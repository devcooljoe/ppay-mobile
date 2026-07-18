import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pinput/pinput.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/auth/presentation/providers/auth_providers.dart';
import 'package:ppay_mobile/shared/widgets/app_loader.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class VerifyPhonePage extends HookConsumerWidget {
  const VerifyPhonePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otpController = useTextEditingController();
    final countdown = useState(60);
    final canResend = useState(false);
    final hasError = useState(false);

    // Auto-send OTP to phone as soon as this page is opened
    useEffect(() {
      Future.microtask(() {
        ref.read(resendPhoneOtpProvider.notifier).call();
      });

      final timer =
          Stream.periodic(const Duration(seconds: 1), (i) => i).listen((_) {
        if (countdown.value > 0) {
          countdown.value--;
        } else {
          canResend.value = true;
        }
      });
      return timer.cancel;
    }, []);

    ref.listen(resendPhoneOtpProvider, (previous, next) {
      if (next.isLoading) {
        AppLoader.show(context);
      } else {
        AppLoader.hide(context);
        if (next.hasError) {
          MessageHandler.showErrorSnackBar(context, MessageHandler.getErrorMessage(next.error));
        } else {
          next.whenData((_) {
            countdown.value = 60;
            canResend.value = false;
          });
        }
      }
    });

    ref.listen(verifyPhoneOtpProvider, (previous, next) {
      if (next.isLoading) {
        AppLoader.show(context);
      } else {
        AppLoader.hide(context);
        next.whenData((_) {
          context.router.replaceAll([const ExploreRoute()]);
        });
        if (next.hasError) {
          hasError.value = true;
          otpController.clear();
          MessageHandler.showErrorSnackBar(context, MessageHandler.getErrorMessage(next.error));
        }
      }
    });

    String formatTime(int seconds) {
      final m = seconds ~/ 60;
      final s = seconds % 60;
      return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
    }

    void handleVerify() {
      if (otpController.text.length != 6) {
        MessageHandler.showErrorSnackBar(
          context,
          'Please enter the 6-digit code',
        );
        return;
      }
      hasError.value = false;
      ref
          .read(verifyPhoneOtpProvider.notifier)
          .call(otpCode: otpController.text);
    }

    void handleResend() {
      if (!canResend.value) return;
      otpController.clear();
      hasError.value = false;
      ref.read(resendPhoneOtpProvider.notifier).call();
    }

    final user = ref.watch(authenticatedUserProvider).value;
    final maskedPhone = user != null
        ? _maskPhone(user.phoneNumber)
        : 'your phone number';

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: const PPAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.verticalSpace,
              Text(
                'Verify Phone No',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.buttonColorandText,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              8.verticalSpace,
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    const TextSpan(text: 'Please enter the 6-digit code sent to '),
                    TextSpan(
                      text: maskedPhone,
                      style: const TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
              38.verticalSpace,
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
                      border: Border.all(
                        color: hasError.value
                            ? PPaymobileColors.redTextfield
                            : PPaymobileColors.lightGrey,
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),
                  focusedPinTheme: PinTheme(
                    width: 52.w,
                    height: 49.h,
                    textStyle: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: PPaymobileColors.buttonColor,
                        width: 2.w,
                      ),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),
                  onCompleted: (value) {
                    hasError.value = false;
                    ref
                        .read(verifyPhoneOtpProvider.notifier)
                        .call(otpCode: value);
                  },
                ),
              ),
              if (hasError.value) ...[
                6.verticalSpace,
                Text(
                  'Incorrect code entered.',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: PPaymobileColors.redTextfield,
                  ),
                ),
              ],
              16.verticalSpace,
              Row(
                children: [
                  Text(
                    'Didn\'t get the code? ',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  TouchOpacity(
                    onTap: handleResend,
                    child: Text(
                      'Resend code',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: canResend.value
                            ? const Color(0xff429E6E)
                            : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              16.verticalSpace,
              Text(
                canResend.value
                    ? 'Code expired'
                    : 'Time Left: ${formatTime(countdown.value)}',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: canResend.value
                      ? PPaymobileColors.redTextfield
                      : PPaymobileColors.svgIconColor,
                ),
              ),
              const Spacer(),
              PPButton(text: 'Verify', onPressed: handleVerify),
              16.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  String _maskPhone(String phone) {
    if (phone.length < 5) return phone;
    final visible = phone.substring(phone.length - 4);
    final masked = phone.substring(0, phone.length - 4).replaceAll(
          RegExp(r'\d'),
          '*',
        );
    return '$masked$visible';
  }
}
