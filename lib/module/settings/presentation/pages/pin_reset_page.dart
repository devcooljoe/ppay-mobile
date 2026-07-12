import 'package:flutter/material.dart';
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
    // Step 0 = OTP entry, Step 1 = new PIN entry
    final step = useState(0);
    final resetToken = useState<String?>(null);
    final otpController = useTextEditingController();
    final pinController = useTextEditingController();
    final confirmPinController = useTextEditingController();

    // Trigger ForgotPin on page load
    useEffect(() {
      Future.microtask(() {
        ref.read(forgotPinProvider.notifier).call();
      });
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
        } else if (!next.isLoading) {
          context.router.replace(const PinResetCompleteRoute());
        }
      }
    });

    void onKeyTap(String value) {
      final controller = step.value == 0 ? otpController : pinController;
      final limit = step.value == 0 ? 6 : 4;
      if (controller.text.length < limit) {
        controller.text += value;
      }
    }

    void onDelete() {
      final controller = step.value == 0 ? otpController : pinController;
      if (controller.text.isNotEmpty) {
        controller.text = controller.text.substring(0, controller.text.length - 1);
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

    void handleResetPin() {
      final pin = pinController.text;
      final confirm = confirmPinController.text;
      if (pin.length != 4) {
        MessageHandler.showErrorSnackBar(context, 'Please enter a 4-digit PIN');
        return;
      }
      if (pin != confirm) {
        MessageHandler.showErrorSnackBar(context, 'PINs do not match');
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
      appBar: AppBar(
        backgroundColor: PPaymobileColors.mainScreenBackground,
        toolbarHeight: 56,
        leadingWidth: 56.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: TouchOpacity(
            onTap: () => Navigator.pop(context),
            child: SizedBox(
              height: 24.w,
              width: 24.w,
              child: SvgPicture.asset('assets/icon/arrow_back.svg', fit: BoxFit.scaleDown),
            ),
          ),
        ),
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
            : _NewPinStep(
                pinController: pinController,
                confirmPinController: confirmPinController,
                onKeyTap: onKeyTap,
                onDelete: onDelete,
                onSubmit: handleResetPin,
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
            KeyboardContainer(
              child: CustomKeyboard(onKeyTap: onKeyTap, onDelete: onDelete),
            ),
            24.verticalSpace,
            TouchOpacity(
              child: SizedBox(
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
                      fontFamily: 'Montserrat',
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
      ],
    );
  }
}

class _NewPinStep extends StatelessWidget {
  final TextEditingController pinController;
  final TextEditingController confirmPinController;
  final void Function(String) onKeyTap;
  final VoidCallback onDelete;
  final VoidCallback onSubmit;

  const _NewPinStep({
    required this.pinController,
    required this.confirmPinController,
    required this.onKeyTap,
    required this.onDelete,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        24.verticalSpace,
        Text(
          'New Security PIN',
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: PPaymobileColors.buttonColorandText,
            fontSize: 24.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        4.verticalSpace,
        Text(
          'Enter a new 4-digit security PIN',
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
            Text('New PIN', style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 14.sp, color: PPaymobileColors.svgIconColor)),
            8.verticalSpace,
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
            20.verticalSpace,
            Text('Confirm PIN', style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 14.sp, color: PPaymobileColors.svgIconColor)),
            8.verticalSpace,
            Pinput(
              controller: confirmPinController,
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
            KeyboardContainer(
              child: CustomKeyboard(onKeyTap: onKeyTap, onDelete: onDelete),
            ),
            24.verticalSpace,
            TouchOpacity(
              child: SizedBox(
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
                        'Reset PIN',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
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
            ),
          ],
        ),
      ],
    );
  }
}
