import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/core/di/injection.dart';
import 'package:ppay_mobile/core/providers/inactivity_provider.dart';
import 'package:ppay_mobile/core/services/token_service.dart';
import 'package:ppay_mobile/module/auth/presentation/providers/auth_providers.dart';
import 'package:ppay_mobile/shared/widgets/inactivity_sheet.dart';

class InactivityHandler extends HookConsumerWidget {
  final Widget child;
  final AppRouter router;

  const InactivityHandler({
    super.key,
    required this.child,
    required this.router,
  });

  bool _isInAuthFlow(RouteData currentRoute) {
    const authRoutes = [SignupRoute.name, OnboardRoute.name, LoginRoute.name];
    return authRoutes.contains(currentRoute.name);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inactivityNotifier = ref.read(inactivityNotifierProvider.notifier);
    final dialogShownRef = useRef(false);

    ref.watch(inactivityNotifierProvider);

    ref.listen(inactivityNotifierProvider, (previous, next) async {
      if (dialogShownRef.value) return;

      final currentContext = router.navigatorKey.currentContext;
      if (currentContext == null) return;

      if (_isInAuthFlow(router.current)) return;

      dialogShownRef.value = true;
      inactivityNotifier.markDialogShown();

      final hasLocalAuth = await inactivityNotifier
          .checkBiometricAvailability();

      await showInactivitySheet(
        currentContext,
        hasLocalAuth: hasLocalAuth,
        onLogout: () async {
          Navigator.of(currentContext).pop();
          dialogShownRef.value = false;
          inactivityNotifier.stopTimer();
          await getIt<TokenService>().deleteToken();
          ref.invalidate(authenticatedUserProvider);
          router.replaceAll([SplashRoute()]);
        },
        onStay: hasLocalAuth
            ? () async {
                final authenticated = await inactivityNotifier
                    .authenticateWithBiometric(
                      'Authenticate to enable biometric sign in',
                    );
                if (authenticated) {
                  dialogShownRef.value = false;
                  inactivityNotifier.markDialogDismissed();
                  Navigator.of(currentContext).pop();
                  inactivityNotifier.startTimer();
                }
              }
            : null,
      );
    });

    return child;
  }
}
