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
class VerifyCodePage extends HookConsumerWidget {
  const VerifyCodePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otpController = useTextEditingController();
    final currentOtp = useState('');
    final hasError = useState(false);
    final countdown = useState(60);
    final canResend = useState(false);

    useEffect(() {
      // Auto-send email OTP when page opens
      Future.microtask(() {
        ref.read(resendEmailOtpProvider.notifier).call();
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

    ref.listen(verifyEmailOtpProvider, (previous, next) {
      if (next.isLoading) {
        AppLoader.show(context);
      } else {
        AppLoader.hide(context);
        next.whenData((_) async {
          // Refresh user profile to get latest verification flags
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
          hasError.value = true;
          MessageHandler.showErrorSnackBar(context, MessageHandler.getErrorMessage(next.error));
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
          otpController.clear();
          hasError.value = false;
        });
        if (next.hasError) {
          MessageHandler.showErrorSnackBar(context, MessageHandler.getErrorMessage(next.error));
        }
      }
    });

    String formatTime(int seconds) {
      final m = seconds ~/ 60;
      final s = seconds % 60;
      return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
    }

    final user = ref.watch(authenticatedUserProvider).value;
    final maskedEmail =
        user != null ? _maskEmail(user.emailAddress) : 'your email';

    final defaultPinTheme = PinTheme(
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
    );

    final focusedPinTheme = PinTheme(
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
              : PPaymobileColors.buttonColor,
          width: 2.w,
        ),
        borderRadius: BorderRadius.circular(6.r),
      ),
    );

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
                'Please enter the 6-digit code sent to $maskedEmail',
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
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  onChanged: (value) {
                    currentOtp.value = value;
                    if (hasError.value) hasError.value = false;
                  },
                  onCompleted: (_) {},
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
                    "Didn't get the code? ",
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  TouchOpacity(
                    onTap: canResend.value
                        ? () => ref.read(resendEmailOtpProvider.notifier).call()
                        : null,
                    child: Text(
                      'Resend code',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: canResend.value
                            ? PPaymobileColors.buttonColor
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
              PPButton(
                text: 'Verify',
                onPressed: currentOtp.value.length == 6
                    ? () => ref
                        .read(verifyEmailOtpProvider.notifier)
                        .call(otpCode: currentOtp.value)
                    : null,
                backgroundColor: currentOtp.value.length == 6
                    ? null
                    : PPaymobileColors.buttonInactiveColor,
              ),
              16.verticalSpace,
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
