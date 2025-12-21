import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:ppay_mobile/screens/views/create_password.dart';
import 'package:ppay_mobile/screens/views/passwordreset_screen.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class VerifyforgotScreen extends StatefulWidget {
  const VerifyforgotScreen({super.key});

  @override
  State<VerifyforgotScreen> createState() => _VerifyforgotScreenState();
}

class _VerifyforgotScreenState extends State<VerifyforgotScreen> {
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
                'We sent a 6-digit code to john****@gmail.com. Please enter code below',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              60.verticalSpace,
              Container(
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
                        color: PPaymobileColors.textfiedBorder,
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),
                ),
              ),
              10.verticalSpace,
              Container(
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Incorrect code. Please enter correct code',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: PPaymobileColors.redTextfield,
                    ),
                  ),
                  6.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                        'Click to Resend',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: PPaymobileColors.highlightTextColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              170.verticalSpace,
              SizedBox(
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
                      MaterialPageRoute(
                        builder: (context) => PasswordresetScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Verify',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    height: 16.h,
                    width: 12.w,
                    'assets/icon/arrow_back.svg',
                  ),
                  10.horizontalSpace,
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
            ],
          ),
        ),
      ),
    );
    ;
  }
}
