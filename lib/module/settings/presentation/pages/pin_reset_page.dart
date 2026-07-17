import 'package:flutter/material.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/auth/presentation/providers/auth_providers.dart';
import 'package:ppay_mobile/shared/widgets/app_loader.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/custom_keyboard.dart';
import 'package:ppay_mobile/shared/widgets/custom_keyboard_container.dart';

@RoutePage()
class PinResetPage extends HookConsumerWidget {
  const PinResetPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // step 0 = OTP, step 1 = enter new PIN, step 2 = confirm PIN
    final step = useState(0);
    final resetToken = useState<String?>(null);
    final otpController = useTextEditingController();
    final pinController = useTextEditingController();
    final confirmPinController = useTextEditingController();

    useEffect(() {
      Future.microtask(() => ref.read(forgotPinProvider.notifier).call());
      return null;
    }, []);

    ref.listen(forgotPinProvider, (_, next) {
      if (next.isLoading) {
        AppLoader.show(context);
      } else {
        AppLoader.hide(context);
        if (next.hasError) {
          MessageHandler.showErrorSnackBar(context, next.error.toString());
        }
      }
    });

    ref.listen(verifyForgotPinOtpProvider, (_, next) {
      if (next.isLoading) {
        AppLoader.show(context);
      } else {
        AppLoader.hide(context);
        if (next.hasError) {
          MessageHandler.showErrorSnackBar(context, next.error.toString());
        } else if (next.value != null) {
          resetToken.value = next.value;
          step.value = 1;
        }
      }
    });

    ref.listen(resetPinProvider, (_, next) {
      if (next.isLoading) {
        AppLoader.show(context);
      } else {
        AppLoader.hide(context);
        if (next.hasError) {
          MessageHandler.showErrorSnackBar(context, next.error.toString());
        } else if (!next.isLoading && !next.hasError) {
          context.router.replace(const PinResetCompleteRoute());
        }
      }
    });

    void onKeyTap(String value) {
      if (step.value == 0) {
        if (otpController.text.length < 6) otpController.text += value;
      } else if (step.value == 1) {
        if (pinController.text.length < 4) pinController.text += value;
      } else {
        if (confirmPinController.text.length < 4) confirmPinController.text += value;
      }
    }

    void onDelete() {
      if (step.value == 0) {
        if (otpController.text.isNotEmpty) {
          otpController.text = otpController.text.substring(0, otpController.text.length - 1);
        }
      } else if (step.value == 1) {
        if (pinController.text.isNotEmpty) {
          pinController.text = pinController.text.substring(0, pinController.text.length - 1);
        }
      } else {
        if (confirmPinController.text.isNotEmpty) {
          confirmPinController.text = confirmPinController.text.substring(0, confirmPinController.text.length - 1);
        }
      }
    }

    void handleVerifyOtp() {
      final otp = otpController.text.trim();
      if (otp.length != 6) {
        MessageHandler.showErrorSnackBar(context, 'Please enter the 6-digit OTP');
        return;
      }
      ref.read(verifyForgotPinOtpProvider.notifier).call(otpCode: otp);
    }

    void handlePinEntered() {
      if (pinController.text.length != 4) {
        MessageHandler.showErrorSnackBar(context, 'Please enter a 4-digit PIN');
        return;
      }
      step.value = 2;
    }

    void handleConfirmPin() {
      final pin = pinController.text;
      final confirm = confirmPinController.text;
      if (confirm.length != 4) {
        MessageHandler.showErrorSnackBar(context, 'Please confirm your 4-digit PIN');
        return;
      }
      if (pin != confirm) {
        MessageHandler.showErrorSnackBar(context, 'PINs do not match');
        confirmPinController.clear();
        return;
      }
      ref.read(resetPinProvider.notifier).call(
            resetToken: resetToken.value!,
            pin: pin,
            confirmPin: confirm,
          );
    }

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(
        onBackPressed: step.value > 0
            ? () {
                if (step.value == 2) confirmPinController.clear();
                step.value = step.value - 1;
              }
            : null,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
        child: step.value == 0
            ? _OtpStep(
                otpController: otpController,
                onKeyTap: onKeyTap,
                onDelete: onDelete,
                onVerify: handleVerifyOtp,
                onResend: () => ref.read(forgotPinProvider.notifier).call(),
              )
            : step.value == 1
                ? _PinEntryStep(
                    label: 'New Security PIN',
                    subtitle: 'Enter a new 4-digit security PIN',
                    pinController: pinController,
                    onKeyTap: onKeyTap,
                    onDelete: onDelete,
                    onSubmit: handlePinEntered,
                    buttonLabel: 'Continue',
                  )
                : _PinEntryStep(
                    label: 'Confirm PIN',
                    subtitle: 'Re-enter your new 4-digit PIN to confirm',
                    pinController: confirmPinController,
                    onKeyTap: onKeyTap,
                    onDelete: onDelete,
                    onSubmit: handleConfirmPin,
                    buttonLabel: 'Reset PIN',
                  ),
      ),
    );
  }
}

class _OtpStep extends StatelessWidget {
  final TextEditingController otpController;
  final void Function(String) onKeyTap;
  final VoidCallback onDelete;
  final VoidCallback onVerify;
  final VoidCallback onResend;

  const _OtpStep({
    required this.otpController,
    required this.onKeyTap,
    required this.onDelete,
    required this.onVerify,
    required this.onResend,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        24.verticalSpace,
        Text(
          'Verify OTP',
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: PPaymobileColors.buttonColorandText,
            fontSize: 24.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        4.verticalSpace,
        Text(
          'A 6-digit OTP has been sent to your email. Enter it below to continue.',
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: PPaymobileColors.svgIconColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        46.verticalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Pinput(
              controller: otpController,
              length: 6,
              keyboardType: TextInputType.none,
              separatorBuilder: (index) => 12.horizontalSpace,
              defaultPinTheme: PinTheme(
                width: 48.w,
                height: 49.h,
                textStyle: TextStyle(fontSize: 20.sp, color: Colors.black, fontWeight: FontWeight.w600),
                decoration: BoxDecoration(
                  border: Border.all(color: PPaymobileColors.textfiedBorder, width: 1.w),
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ),
            ),
            12.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Didn't get the code? ",
                  style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 14.sp, color: Colors.black),
                ),
                TouchOpacity(
                  onTap: onResend,
                  child: Text(
                    'Resend',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontSize: 14.sp,
                      color: PPaymobileColors.buttonColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            29.verticalSpace,
            KeyboardContainer(child: CustomKeyboard(onKeyTap: onKeyTap, onDelete: onDelete)),
            24.verticalSpace,
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: PPaymobileColors.buttonColorandText,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(42)),
                  elevation: 0,
                ),
                onPressed: onVerify,
                child: Text(
                  'Verify OTP',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _PinEntryStep extends StatelessWidget {
  final String label;
  final String subtitle;
  final TextEditingController pinController;
  final void Function(String) onKeyTap;
  final VoidCallback onDelete;
  final VoidCallback onSubmit;
  final String buttonLabel;

  const _PinEntryStep({
    required this.label,
    required this.subtitle,
    required this.pinController,
    required this.onKeyTap,
    required this.onDelete,
    required this.onSubmit,
    required this.buttonLabel,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        24.verticalSpace,
        Text(
          label,
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: PPaymobileColors.buttonColorandText,
            fontSize: 24.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        4.verticalSpace,
        Text(
          subtitle,
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: PPaymobileColors.svgIconColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        46.verticalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 76.w,
              width: 76.w,
              padding: EdgeInsets.all(13).r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(38).r,
                color: PPaymobileColors.doneColor,
              ),
              child: SvgPicture.asset('assets/icon/lock_green.svg', fit: BoxFit.contain),
            ),
            24.verticalSpace,
            Pinput(
              controller: pinController,
              length: 4,
              keyboardType: TextInputType.none,
              separatorBuilder: (index) => 18.horizontalSpace,
              defaultPinTheme: PinTheme(
                width: 52.w,
                height: 49.h,
                textStyle: TextStyle(fontSize: 20.sp, color: Colors.black, fontWeight: FontWeight.w600),
                decoration: BoxDecoration(
                  border: Border.all(color: PPaymobileColors.textfiedBorder, width: 1.w),
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ),
            ),
            12.verticalSpace,
            Text(
              'Please remember to always keep your PIN secure',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13.sp, color: Colors.black),
            ),
            29.verticalSpace,
            KeyboardContainer(child: CustomKeyboard(onKeyTap: onKeyTap, onDelete: onDelete)),
            24.verticalSpace,
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: PPaymobileColors.buttonColorandText,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(42)),
                  elevation: 0,
                ),
                onPressed: onSubmit,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      buttonLabel,
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: Colors.white,
                      ),
                    ),
                    10.horizontalSpace,
                    SvgPicture.asset('assets/icon/arrow_forwardw.svg', height: 24.w, width: 24.w, fit: BoxFit.contain),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
