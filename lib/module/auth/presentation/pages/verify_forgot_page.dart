import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
class VerifyForgotPage extends HookConsumerWidget {
  final String email;

  const VerifyForgotPage({super.key, required this.email});

  String _maskEmail(String email) {
    final parts = email.split('@');
    if (parts.length != 2) return email;
    final name = parts[0];
    final domain = parts[1];
    if (name.length <= 3) return '${name[0]}***@$domain';
    return '${name.substring(0, 3)}***@$domain';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otpController = useTextEditingController();
    final currentOtp = useState('');
    final hasError = useState(false);
    final secondsLeft = useState(60);
    final isResending = useState(false);

    useEffect(() {
      final timer = Stream.periodic(const Duration(seconds: 1), (i) => i).listen((_) {
        if (secondsLeft.value > 0) {
          secondsLeft.value--;
        }
      });
      return timer.cancel;
    }, []);

    ref.listen(verifyForgotPasswordOtpProvider, (previous, next) {
      if (next.isLoading) {
        AppLoader.show(context);
      } else {
        AppLoader.hide(context);
        next.whenData((resetToken) {
          if (resetToken != null && context.mounted) {
            context.router.push(LoginPasswordResetRoute(resetToken: resetToken));
          }
        });
        if (next.hasError) {
          hasError.value = true;
          MessageHandler.showErrorSnackBar(context, next.error.toString());
        }
      }
    });

    ref.listen(forgotPasswordProvider, (previous, next) {
      if (!next.isLoading) {
        isResending.value = false;
        next.whenData((_) {
          MessageHandler.showSuccessSnackBar(context, 'Code resent to your email');
          secondsLeft.value = 60;
        });
        if (next.hasError) {
          MessageHandler.showErrorSnackBar(context, next.error.toString());
        }
      }
    });

    final defaultPinTheme = PinTheme(
      width: 52.w,
      height: 52.h,
      textStyle: TextStyle(
        fontSize: 20.sp,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: PPaymobileColors.textfiedBorder,
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
    );

    final errorPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        border: Border.all(
          color: PPaymobileColors.redTextfield,
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        border: Border.all(
          color: PPaymobileColors.buttonColor,
          width: 1.5.w,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
    );

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              40.verticalSpace,
              Text(
                'Verify Code',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.buttonColorandText,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              8.verticalSpace,
              Text(
                'We sent a 6-digit code to ${_maskEmail(email)}. Please enter code below',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              40.verticalSpace,
              SizedBox(
                width: double.infinity,
                child: Pinput(
                  length: 6,
                  controller: otpController,
                  keyboardType: TextInputType.number,
                  separatorBuilder: (index) => 10.horizontalSpace,
                  defaultPinTheme: hasError.value ? errorPinTheme : defaultPinTheme,
                  focusedPinTheme: hasError.value ? errorPinTheme : focusedPinTheme,
                  onChanged: (value) {
                    currentOtp.value = value;
                    if (hasError.value) hasError.value = false;
                  },
                  onCompleted: (value) => currentOtp.value = value,
                ),
              ),
              10.verticalSpace,
              if (hasError.value)
                Text(
                  'Incorrect code. Please enter the correct code',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: PPaymobileColors.redTextfield,
                  ),
                ),
              10.verticalSpace,
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
                    onTap: secondsLeft.value > 0 || isResending.value
                        ? null
                        : () {
                            isResending.value = true;
                            ref.read(forgotPasswordProvider.notifier).call(
                              emailAddress: email,
                            );
                          },
                    child: Text(
                      'Click to Resend',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: secondsLeft.value > 0
                            ? PPaymobileColors.buttonInactiveColor
                            : PPaymobileColors.buttonColor,
                      ),
                    ),
                  ),
                ],
              ),
              8.verticalSpace,
              if (secondsLeft.value > 0)
                Text(
                  'Resend in ${secondsLeft.value}s',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: PPaymobileColors.svgIconColor,
                  ),
                ),
              const Spacer(),
              PPButton(
                text: 'Verify',
                onPressed: currentOtp.value.length == 6
                    ? () {
                        ref.read(verifyForgotPasswordOtpProvider.notifier).call(
                          emailAddress: email,
                          otpCode: currentOtp.value,
                        );
                      }
                    : null,
                backgroundColor: currentOtp.value.length == 6
                    ? null
                    : PPaymobileColors.buttonInactiveColor,
              ),
              21.verticalSpace,
              TouchOpacity(
                onTap: () => context.router.maybePop(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      height: 16.h,
                      width: 12.w,
                      'assets/icon/arrow_back.svg',
                    ),
                    8.horizontalSpace,
                    Text(
                      'Back to Login',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: PPaymobileColors.svgIconColor,
                      ),
                    ),
                  ],
                ),
              ),
              21.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
