import 'package:auto_route/auto_route.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_label.dart';
import 'package:ppay_mobile/shared/widgets/pp_text_field.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';

@RoutePage()
class ForgotPasswordPage extends HookConsumerWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                'Forgot Password',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.buttonColorandText,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              8.verticalSpace,
              Text(
                'Please Enter your email below to retrieve your password',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              60.verticalSpace,
              const PPLabel(text: 'Enter Email or Phone No'),
              4.verticalSpace,
              const PPTextField(
                hintText: 'Enter Details',
              ),
              170.verticalSpace,
              PPButton(
                text: 'Continue',
                onPressed: () {
                  context.router.push(VerifyForgotRoute());
                },
              ),
              21.verticalSpace,
              TouchOpacity(
                onTap: () {
                  context.router.push(LoginRoute());
                },
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
            ],
          ),
        ),
      ),
    );
  }
}
