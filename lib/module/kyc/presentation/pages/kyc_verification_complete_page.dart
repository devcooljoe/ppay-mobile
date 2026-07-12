import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/settings/presentation/providers/biometric_provider.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';

@RoutePage()
class KycVerificationCompletePage extends HookConsumerWidget {
  const KycVerificationCompletePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSettingUpBiometric = useState(false);

    Future<void> handleSetUpBiometric() async {
      isSettingUpBiometric.value = true;
      final success = await ref
          .read(biometricStateProvider.notifier)
          .toggleBiometric('Enable biometrics to sign in faster');
      isSettingUpBiometric.value = false;

      if (!context.mounted) return;

      if (success) {
        MessageHandler.showSuccessSnackBar(
          context,
          'Biometrics enabled successfully',
        );
      } else {
        MessageHandler.showErrorSnackBar(
          context,
          'Biometric setup was cancelled or failed',
        );
      }

      context.router.replaceAll([const ExploreRoute()]);
    }

    void handleGoToDashboard() {
      context.router.replaceAll([const ExploreRoute()]);
    }

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              const Spacer(),
              SizedBox(
                height: 158.w,
                width: 158.w,
                child: Image.asset(
                  'assets/images/complete.png',
                  fit: BoxFit.contain,
                ),
              ),
              24.verticalSpace,
              Text(
                'Verification Complete',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              12.verticalSpace,
              Text(
                'You have successfully submitted your verification documents. A confirmation email will be sent once your documents are reviewed.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.svgIconColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              PPButton(
                text: isSettingUpBiometric.value
                    ? 'Setting up...'
                    : 'Set Up Biometrics',
                onPressed:
                    isSettingUpBiometric.value ? null : handleSetUpBiometric,
              ),
              16.verticalSpace,
              PPButton(
                text: 'Go To Dashboard',
                onPressed: handleGoToDashboard,
                backgroundColor: PPaymobileColors.anotherButtonColor,
              ),
              32.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
