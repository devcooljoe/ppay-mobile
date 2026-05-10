import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pinput/pinput.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';

@RoutePage()
class VerifyCodePage extends HookConsumerWidget {
  const VerifyCodePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
          child: ListView(
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
                'Please enter 6-digit code sent to joh***@gmail.com. Please enter below  ',
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
                ),
              ),
              10.verticalSpace,
              SizedBox(
                width: double.infinity,
                child: Pinput(
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
                        color: PPaymobileColors.redTextfield,
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),
                ),
              ),
              6.verticalSpace,
              Text(
                'Incorrect code entered.',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: PPaymobileColors.redTextfield,
                ),
              ),
              6.verticalSpace,
              Row(
                children: [
                  Text(
                    'Didn’t Get the code? ',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Resend code',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff429E6E),
                    ),
                  ),
                ],
              ),
              16.verticalSpace,
              Text(
                'Time Left: 02:48',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff5B5B5B),
                ),
              ),
              76.verticalSpace,
              PPButton(
                text: 'Verify',
                onPressed: () {},
                backgroundColor: PPaymobileColors.buttonInactiveColor,
              ),
              16.verticalSpace,
              PPButton(
                text: 'Verify',
                onPressed: () => context.router.push(VerifyPhoneRoute()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
