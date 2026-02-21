import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/views/login_screen.dart';
import 'package:ppay_mobile/screens/views/password_changed.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/textfield.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';

class CreatePassword extends StatefulWidget {
  const CreatePassword({super.key});

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: PPaymobileColors.mainScreenBackground,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
          child: ListView(
            children: [
              40.verticalSpace,
              Text(
                'Create Password',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.buttonColorandText,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Please enter password below to secure your account',
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
              80.verticalSpace,
              TouchOpacity(
                child: SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: PPaymobileColors.anotherButtonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(42.r),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {},
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
              ),
              10.verticalSpace,
              TouchOpacity(
                child: SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: PPaymobileColors.backgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(42.r),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PasswordChanged(),
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
              ),
              21.verticalSpace,
              TouchOpacity(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Row(
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
