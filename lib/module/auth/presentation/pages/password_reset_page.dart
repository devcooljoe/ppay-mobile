import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/pp_label.dart';
import 'package:ppay_mobile/shared/widgets/pp_text_field.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class PasswordResetPage extends HookConsumerWidget {
  const PasswordResetPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final obscurePassword = useState(true);
    final obscureConfirm = useState(true);

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              102.verticalSpace,
              Text(
                'Password Reset',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.buttonColorandText,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Please enter new password below to set new password',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              60.verticalSpace,
              PPLabel(text: 'Enter Password'),
              6.verticalSpace,
              PPTextField(
                hintText: 'johndoe@gmail.com',
                obscureText: obscurePassword.value,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(14.0).r,
                  child: SvgPicture.asset('assets/icon/lock.svg'),
                ),
                suffixIcon: TouchOpacity(
                  onTap: () =>
                      obscurePassword.value = !obscurePassword.value,
                  child: Padding(
                    padding: const EdgeInsets.all(14.0).r,
                    child: SvgPicture.asset(
                      obscurePassword.value
                          ? 'assets/icon/eye-slash.svg'
                          : 'assets/icon/lock_eye.svg',
                    ),
                  ),
                ),
              ),
              29.verticalSpace,
              PPLabel(text: 'Confirm Password'),
              6.verticalSpace,
              PPTextField(
                hintText: 'johndoe@gmail.com',
                obscureText: obscureConfirm.value,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(14.0).r,
                  child: SvgPicture.asset('assets/icon/lock.svg'),
                ),
                suffixIcon: TouchOpacity(
                  onTap: () =>
                      obscureConfirm.value = !obscureConfirm.value,
                  child: Padding(
                    padding: const EdgeInsets.all(14.0).r,
                    child: SvgPicture.asset(
                      obscureConfirm.value
                          ? 'assets/icon/eye-slash.svg'
                          : 'assets/icon/lock_eye.svg',
                    ),
                  ),
                ),
              ),
              24.verticalSpace,
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0).r,
                    child: SvgPicture.asset('assets/icon/tick_circle.svg'),
                  ),
                  Text(
                    'Include uppercase letters (A–Z)',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: PPaymobileColors.svgIconColor,
                    ),
                  ),
                ],
              ),
              16.verticalSpace,
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0).r,
                    child: SvgPicture.asset('assets/icon/tick_fail.svg'),
                  ),
                  Text(
                    'Include lowercase letters (a–z)',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: PPaymobileColors.svgIconColor,
                    ),
                  ),
                ],
              ),
              16.verticalSpace,
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0).r,
                    child: SvgPicture.asset('assets/icon/tick_pass.svg'),
                  ),
                  Text(
                    'Include at least one number (0–9)',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: PPaymobileColors.svgIconColor,
                    ),
                  ),
                ],
              ),
              16.verticalSpace,
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0).r,
                    child: SvgPicture.asset('assets/icon/tick_pass.svg'),
                  ),
                  Text(
                    'Include at least one special character',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: PPaymobileColors.svgIconColor,
                    ),
                  ),
                ],
              ),
              91.verticalSpace,
              PPButton(
                text: 'Reset Password',
                onPressed: () => context.router.push(PasswordChangedRoute()),
              ),
              21.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    height: 16.h,
                    width: 12.w,
                    'assets/icon/arrow_back.svg',
                  ),
                  5.horizontalSpace,
                  Text(
                    'Back to Login',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: PPaymobileColors.svgIconColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
