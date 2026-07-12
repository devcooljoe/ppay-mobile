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
class VerifyEmailOtpPage extends HookConsumerWidget {
  const VerifyEmailOtpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otpController = useTextEditingController();
    final countdown = useState(60);
    final canResend = useState(false);

    useEffect(() {
      // Auto-send email OTP when page opens
      Future.microtask(() {
        ref.read(resendEmailOtpProvider.notifier).call();
      });

      final timer =
          Stream.periodic(const Duration(seconds: 1), (count) => count).listen((
            _,
          ) {
            if (countdown.value > 0) {
              countdown.value--;
            } else {
              canResend.value = true;
            }
          });
      return timer.cancel;
    }, []);

    ref.listen(verifyEmailOtpProvider, (previous, next) {
      if (next.isLoading) {
        AppLoader.show(context);
      } else {
        AppLoader.hide(context);
        next.whenData((_) async {
          await ref.read(authenticatedUserProvider.notifier).call();
          if (!context.mounted) return;
          final user = ref.read(authenticatedUserProvider).value;
          if (user != null && !user.isPhoneNumberVerified) {
            context.router.replace(const VerifyPhoneRoute());
          } else {
            context.router.replaceAll([const ExploreRoute()]);
          }
        });
        if (next.hasError) {
          MessageHandler.showErrorSnackBar(context, next.error.toString());
        }
      }
    });

    ref.listen(resendEmailOtpProvider, (previous, next) {
      if (next.isLoading) {
        AppLoader.show(context);
      } else {
        AppLoader.hide(context);
        next.whenData((_) {
          MessageHandler.showSuccessSnackBar(context, 'OTP sent successfully');
          countdown.value = 60;
          canResend.value = false;
        });
        if (next.hasError) {
          MessageHandler.showErrorSnackBar(context, next.error.toString());
        }
      }
    });

    String formatTime(int seconds) {
      final minutes = seconds ~/ 60;
      final secs = seconds % 60;
      return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
    }

    void handleVerify() {
      if (otpController.text.length == 6) {
        ref
            .read(verifyEmailOtpProvider.notifier)
            .call(otpCode: otpController.text);
      } else {
        MessageHandler.showErrorSnackBar(
          context,
          'Please enter a valid 6-digit code',
        );
      }
    }

    void handleResend() {
      if (canResend.value) {
        ref.read(resendEmailOtpProvider.notifier).call();
      }
    }

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
                'Verify Email',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.buttonColorandText,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              8.verticalSpace,
              Text(
                'Please enter 6-digit code sent to your email address',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
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
                        color: PPaymobileColors.lightGrey,
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
                  onCompleted: (value) {},
                ),
              ),
              16.verticalSpace,
              Row(
                children: [
                  Text(
                    'Didn\'t Get the code? ',
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
                'Time Left: ${formatTime(countdown.value)}',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff5B5B5B),
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
}
