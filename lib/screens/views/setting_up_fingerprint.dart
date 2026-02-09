import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/views/fingerprint_complete.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';

class SettingUpFingerprint extends StatefulWidget {
  const SettingUpFingerprint({super.key});

  @override
  State<SettingUpFingerprint> createState() => _SettingUpFingerprintState();
}

class _SettingUpFingerprintState extends State<SettingUpFingerprint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PPaymobileColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: PPaymobileColors.backgroundColor,
        toolbarHeight: 56,
        leadingWidth: 56.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: TouchOpacity(
            onTap: () => Navigator.pop(context),
            child: SizedBox(
              height: 24.h,
              width: 24.w,
              child: SvgPicture.asset(
                'assets/icon/arrow_back_white.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Skip',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.mainScreenBackground,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 11.h,
              left: -25.w,
              right: -25.w,
              child: SizedBox(
                height: 490.h,
                width: 490.w,
                child: Image.asset(
                  'assets/images/fingerprint_line3.png',
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
                  'assets/images/fingerprint_line2.png',
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
                  'assets/images/fingerprint_line1.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              top: 195.h,
              left: 158.w,
              right: 158.w,
              child: SizedBox(
                height: 123.h,
                width: 123.w,
                child: Image.asset(
                  'assets/images/fingerprint_green.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              top: 501.h,
              left: 20.w,
              right: 20.w,
              child: Column(
                children: [
                  Text(
                    'Place your thumb on your phone sensor to activate your biometric',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.mainScreenBackground,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  107.verticalSpace,
                  //this is here because of setting up the fingerprint is done by you so i just use this button to navigate to next page
                  TouchOpacity(
                    child: SizedBox(
                      width: double.infinity,
                      height: 50.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: PPaymobileColors.buttonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(42.r),
                          ),
                          elevation: 0,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return FingerprintComplete();
                              },
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Finish',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
