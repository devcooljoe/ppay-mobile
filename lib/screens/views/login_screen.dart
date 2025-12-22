import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/views/forgot_password_screen.dart';
import 'package:ppay_mobile/screens/views/route_screen.dart';
import 'package:ppay_mobile/screens/views/signup_screen.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  41.verticalSpace,
                  SizedBox(
                    height: 56.h,
                    width: 36.w,
                    child: Image.asset(
                      'assets/images/logo2.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  25.verticalSpace,
                  Text(
                    'Sign In',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.buttonColorandText,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  6.verticalSpace,
                  Text(
                    'Welcome back, enter the details below',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: PPaymobileColors.svgIconColor,
                    ),
                  ),
                ],
              ),
              60.verticalSpace,
              Text(
                'Enter Email or Phone No',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.verticalSpace,
              SizedBox(
                height: 56.h,
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 15.h,
                    ),
                    hintText: 'Enter Details',
                    hintStyle: TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      fontStyle: FontStyle.italic,
                      color: PPaymobileColors.svgIconColor,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        color: PPaymobileColors.textfiedBorder,
                        width: 1.w,
                      ),
                    ),
                  ),
                ),
              ),
              29.verticalSpace,
              Text(
                'Enter Password',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.verticalSpace,
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
              6.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0).r,
                        child: SvgPicture.asset(
                          'assets/icon/mark_icon.svg',
                          width: 18.w,
                          height: 18.h,
                        ),
                      ),
                      3.horizontalSpace,
                      Text(
                        'Remember Me',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPasswordScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: PPaymobileColors.highlightTextColor,
                        fontFamily: 'Montserrat',
                        color: PPaymobileColors.highlightTextColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
              71.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: PPaymobileColors.backgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(42),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RouteScreen()),
                      );
                    },
                    child: Text(
                      'Sign In',
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
              6.verticalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Or Use Biometrics',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  22.verticalSpace,
                  SizedBox(
                    height: 80.h,
                    width: 80.w,
                    child: SvgPicture.asset(
                      'assets/icon/fingerprint.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              36.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: Colors.black,
                    ),
                  ),
                  5.horizontalSpace,
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: PPaymobileColors.highlightTextColor,
                      ),
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
