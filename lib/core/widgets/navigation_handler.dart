import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ppay_mobile/app/router/app_router.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/core/di/injection.dart';
import 'package:ppay_mobile/core/network/interceptors/error_interceptor.dart';
import 'package:ppay_mobile/core/services/biometric_service.dart';
import 'package:ppay_mobile/core/services/token_service.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';

class NavigationHandler extends HookWidget {
  final Widget child;
  final AppRouter router;

  const NavigationHandler({
    super.key,
    required this.child,
    required this.router,
  });

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      final eventBus = getIt<EventBus>();
      final subscription = eventBus.on<UnauthorizedEvent>().listen((
        event,
      ) async {
        final tokenService = getIt<TokenService>();
        await tokenService.deleteToken();

        final biometricService = getIt<BiometricService>();
        await biometricService.setBiometricEnabled(false);

        Future.delayed(const Duration(milliseconds: 100), () {
          if (context.mounted) {
            MessageHandler.showErrorSnackBar(context, event.message);
          }
        });

        await Future.delayed(const Duration(milliseconds: 500));
        router.replaceAll([const LoginRoute()]);
      });

      return subscription.cancel;
    }, []);

    return child;
  }
}
