import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class FingerprintScreen extends StatefulWidget {
  const FingerprintScreen({super.key});

  @override
  State<FingerprintScreen> createState() => _FingerprintScreenState();
}

class _FingerprintScreenState extends State<FingerprintScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PPaymobileColors.backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 50.h,
              left: 20.w,
              child: SizedBox(
                height: 24.h,
                width: 24.w,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    'assets/icon/arrow_back_white.svg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 11.h,
              left: -25.w,
              right: -25.w,
              child: SizedBox(
                height: 490.h,
                width: 490.w,
                child: Image.asset(
                  'assets/images/line_3.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              top: 87.h,
              left: 51.w,
              right: 51.w,
              child: SizedBox(
                height: 338.h,
                width: 338.w,
                child: Image.asset(
                  'assets/images/line_2.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              top: 141.h,
              left: 105.w,
              right: 105.w,
              child: SizedBox(
                height: 230.h,
                width: 230.w,
                child: Image.asset(
                  'assets/images/line_1.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              top: 195.h,
              left: 158.w,
              right: 158.w,
              child: SizedBox(
                height: 130.h,
                width: 130.w,
                child: Image.asset(
                  'assets/images/big_fingerprint.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              top: 481.h,
              left: 20.w,
              right: 20.w,
              child: Text(
                'Place your thumb on your phone sensor to complete transaction',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: PPaymobileColors.mainScreenBackground,
                ),
              ),
            ),
            Positioned(
              top: 711.h,
              left: 20.w,
              right: 20.w,
              child: SizedBox(
                height: 50.h,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/use_pin.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
