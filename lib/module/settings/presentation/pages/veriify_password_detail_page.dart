import 'package:flutter/material.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/auth/presentation/providers/auth_providers.dart';
import 'package:ppay_mobile/shared/widgets/app_loader.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';

@RoutePage()
class VerifyPasswordDetailPage extends HookConsumerWidget {
  final String emailAddress;
  const VerifyPasswordDetailPage({super.key, required this.emailAddress});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otpController = useTextEditingController();

    ref.listen(verifyForgotPasswordOtpProvider, (_, next) {
      if (next.isLoading) {
        AppLoader.show(context);
      } else {
        AppLoader.hide(context);
        if (next.hasError) {
          MessageHandler.showErrorSnackBar(context, MessageHandler.getErrorMessage(next.error));
        } else if (next.value != null) {
          context.router.push(LoginPasswordResetRoute(resetToken: next.value!));
        }
      }
    });

    void handleVerify() {
      final otp = otpController.text.trim();
      if (otp.length != 6) {
        MessageHandler.showErrorSnackBar(context, 'Please enter the 6-digit code');
        return;
      }
      ref.read(verifyForgotPasswordOtpProvider.notifier).call(
            emailAddress: emailAddress,
            otpCode: otp,
          );
    }

    final maskedEmail = _maskEmail(emailAddress);

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: const PPAppBar(title: 'Verification'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
          child: ListView(
            children: [
              32.verticalSpace,
              Text(
                'Verify Code',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.buttonColorandText,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              8.verticalSpace,
              Text(
                'We sent a 6-digit code to $maskedEmail. Please enter the code below.',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.svgIconColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              60.verticalSpace,
              SizedBox(
                width: double.infinity,
                child: Pinput(
                  controller: otpController,
                  length: 6,
                  keyboardType: TextInputType.number,
                  separatorBuilder: (index) => 18.horizontalSpace,
                  defaultPinTheme: PinTheme(
                    width: 52.w,
                    height: 49.h,
                    textStyle: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: PPaymobileColors.textfiedBorder, width: 1.w),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),
                ),
              ),
              16.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't get the code? ",
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  TouchOpacity(
                    onTap: () => ref.read(forgotPasswordProvider.notifier).call(
                          emailAddress: emailAddress,
                        ),
                    child: Text(
                      'Click to Resend',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: PPaymobileColors.buttonColor,
                      ),
                    ),
                  ),
                ],
              ),
              170.verticalSpace,
              TouchOpacity(
                child: SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: PPaymobileColors.buttonColorandText,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(42.r)),
                      elevation: 0,
                    ),
                    onPressed: handleVerify,
                    child: Text(
                      'Verify Code',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _maskEmail(String email) {
    final parts = email.split('@');
    if (parts.length != 2) return email;
    final name = parts[0];
    final domain = parts[1];
    if (name.length <= 3) return '${name[0]}***@$domain';
    return '${name.substring(0, 3)}***@$domain';
  }
}
