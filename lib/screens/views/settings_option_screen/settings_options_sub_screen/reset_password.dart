import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/views/password_changed_two_screen.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/textfield.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: AppBar(
        backgroundColor: PPaymobileColors.mainScreenBackground,
        toolbarHeight: 56,
        leadingWidth: 56.w,
        centerTitle: true,
        title: Text(
          'Verification',
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: TouchOpacity(
            onTap: () => Navigator.pop(context),
            child: SizedBox(
              height: 24.w,
              width: 24.w,
              child: SvgPicture.asset(
                'assets/icon/arrow_back.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    32.verticalSpace,
                    Text(
                      'Password Reset',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: PPaymobileColors.buttonColorandText,
                        fontSize: 24.sp,
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
                    Text(
                      'Enter Password',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    6.verticalSpace,
                    PPTextfield(
                      prefixI: Padding(
                        padding: const EdgeInsets.all(14.0).r,
                        child: SvgPicture.asset('assets/icon/lock.svg'),
                      ),
                      hintT: 'johndoe@gmail.com',
                      hintS: TextStyle(
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        fontStyle: FontStyle.italic,
                        color: PPaymobileColors.svgIconColor,
                      ),
                      suffixI: Padding(
                        padding: const EdgeInsets.all(14.0).r,
                        child: SvgPicture.asset('assets/icon/lock_eye.svg'),
                      ),
                    ),
                    29.verticalSpace,
                    Text(
                      'Confirm Password',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    6.verticalSpace,
                    PPTextfield(
                      prefixI: Padding(
                        padding: const EdgeInsets.all(14.0).r,
                        child: SvgPicture.asset('assets/icon/lock.svg'),
                      ),
                      hintT: 'johndoe@gmail.com',
                      hintS: TextStyle(
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        fontStyle: FontStyle.italic,
                        color: PPaymobileColors.svgIconColor,
                      ),
                      suffixI: Padding(
                        padding: const EdgeInsets.all(14.0).r,
                        child: SvgPicture.asset(
                          // height: 15.h,
                          // width: 19.w,
                          'assets/icon/lock_eye.svg',
                        ),
                      ),
                    ),
                    24.verticalSpace,
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0).r,
                          child: SvgPicture.asset(
                            'assets/icon/tick_circle.svg',
                          ),
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
                  ],
                ),
              ),
              91.verticalSpace,
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: PPaymobileColors.buttonColorandText,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(42.r),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PasswordChangedTwoScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Reset Password',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: Colors.white,
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
}
