import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ppay_mobile/screens/views/login_screen.dart';
import 'package:ppay_mobile/screens/views/verify_code.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/textfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: AppBar(
        leading: SizedBox.shrink(),
        backgroundColor: PPaymobileColors.mainScreenBackground,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
        child: ListView(
          children: [
            48.verticalSpace,
            Row(
              children: [
                Text(
                  'Sign',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.buttonColorandText,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                6.horizontalSpace,
                Text(
                  'UP',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.buttonColorandText,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                8.verticalSpace,
              ],
            ),
            8.verticalSpace,
            Text(
              'Welcome, Let’s Get You Started',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            45.verticalSpace,
            Text(
              'Full Name',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            6.verticalSpace,
            SizedBox(
              height: 56.h,
              child: PPTextfield(
                prefixI: Padding(
                  padding: const EdgeInsets.all(14.0).r,
                  child: SvgPicture.asset('assets/icon/person_icon.svg'),
                ),
                hintT: 'e.g John Doe',
                hintS: TextStyle(
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  fontStyle: FontStyle.italic,
                  color: PPaymobileColors.svgIconColor,
                ),
              ),
            ),
            29.verticalSpace,
            Text(
              'Email Address',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            6.verticalSpace,
            SizedBox(
              height: 56.h,
              child: PPTextfield(
                prefixI: Padding(
                  padding: const EdgeInsets.all(14.0).r,
                  child: SvgPicture.asset('assets/icon/message_icon.svg'),
                ),
                hintT: 'e.g johndoegmail.com',
                hintS: TextStyle(
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  fontStyle: FontStyle.italic,
                  color: PPaymobileColors.svgIconColor,
                ),
              ),
            ),
            29.verticalSpace,
            Text(
              'Phone Number',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            6.verticalSpace,
            SizedBox(
              height: 56.h,
              child: PPTextfield(
                prefixI: Padding(
                  padding: const EdgeInsets.all(17.0).r,
                  child: Image.asset('assets/images/flag_1.png'),
                ),
                hintT: '+234',
                hintS: TextStyle(
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  color: Colors.black,
                ),
              ),
            ),
            24.verticalSpace,
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 18.0).r,
                  child: SvgPicture.asset(
                    'assets/icon/mark_icon.svg',
                    width: 18.w,
                    height: 18.h,
                  ),
                ),
                9.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'By opening an account you agree to our ',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ),
                    3.verticalSpace,
                    Text(
                      'terms and conditions',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xff429E6E),
                        fontFamily: 'Montserrat',
                        color: Color(0xff429E6E),
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            101.verticalSpace,
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: PPaymobileColors.backgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(42),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VerifyCode()),
                  );
                },
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            6.verticalSpace,

            /// Sign in
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
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
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text(
                    'Sign In',
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
    );
  }
}
