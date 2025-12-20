import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

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
            ],
          ),
        ),
      ),
    );
  }
}
