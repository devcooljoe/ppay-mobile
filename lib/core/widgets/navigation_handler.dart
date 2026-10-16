import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/core/di/injection.dart';
import 'package:ppay_mobile/core/network/interceptors/error_interceptor.dart';
import 'package:ppay_mobile/core/services/biometric_service.dart';
import 'package:ppay_mobile/core/services/firebase_messaging_service.dart';
import 'package:ppay_mobile/core/services/hive_service.dart';
import 'package:ppay_mobile/core/services/token_service.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/auth/presentation/providers/auth_providers.dart';
import 'package:ppay_mobile/module/crypto/presentation/providers/crypto_providers.dart'
    hide balanceVisibilityProvider;
import 'package:ppay_mobile/module/dashboard/providers/balance_visibility_provider.dart';
import 'package:ppay_mobile/module/dashboard/providers/wallet_provider.dart';
import 'package:ppay_mobile/module/virtual_card/presentation/providers/virtual_card_providers.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';

class NavigationHandler extends HookConsumerWidget {
  final Widget child;
  final AppRouter router;

  const NavigationHandler({
    super.key,
    required this.child,
    required this.router,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      final eventBus = getIt<EventBus>();

      // Handle unauthorized events (token expiration)
      final unauthorizedSubscription = eventBus.on<UnauthorizedEvent>().listen((
        event,
      ) async {
        // Clear token from storage and memory
        final tokenService = getIt<TokenService>();
        await tokenService.deleteToken();

        // Disable biometric authentication
        final biometricService = getIt<BiometricService>();
        await biometricService.setBiometricEnabled(false);

        // Clear all user-related state in providers
        ref.read(authenticatedUserProvider.notifier).logout();
        ref.invalidate(walletProvider);
        ref.invalidate(balanceVisibilityProvider);
        ref.invalidate(getDollarCardsProvider);
        ref.invalidate(estimatedAssetValueProvider);
        ref.invalidate(allCryptoRatesProvider);
        ref.invalidate(cryptoRatesProvider);

        // Clear any cached preferences (except saved email for convenience)
        final hiveService = getIt<HiveService>();
        await hiveService.delete('balance_visibility');

        Future.delayed(const Duration(milliseconds: 100), () {
          if (context.mounted) {
            MessageHandler.showErrorSnackBar(context, event.message);
          }
        });

        await Future.delayed(const Duration(milliseconds: 500));
        router.replaceAll([const LoginRoute()]);
      });

      // Handle verification notification events
      final verificationSubscription = eventBus
          .on<VerificationNotificationEvent>()
          .listen((event) async {
            // Refresh user data to get updated verification status
            await ref.read(authenticatedUserProvider.notifier).silentRefresh();

            // Show dialog with verification result
            if (context.mounted) {
              _showVerificationDialog(context, event);
            }
          });

      return () {
        unauthorizedSubscription.cancel();
        verificationSubscription.cancel();
      };
    }, []);

    return child;
  }

  void _showVerificationDialog(
    BuildContext context,
    VerificationNotificationEvent event,
  ) {
    final isSuccess = event.status == 'verified';
    final icon = isSuccess ? Icons.check_circle_rounded : Icons.error_rounded;
    final iconColor =
        isSuccess
            ? PPaymobileColors
                .buttonColor // Green color
            : PPaymobileColors.redTextfield;

    showDialog(
      context: context,
      barrierDismissible: true,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                Icon(icon, size: 64, color: iconColor),
                const SizedBox(height: 16),
                Text(
                  event.title,
                  style: const TextStyle(
                    fontFamily: 'InstrumentSans',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  event.body,
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: PPaymobileColors.buttonColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'OK',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
