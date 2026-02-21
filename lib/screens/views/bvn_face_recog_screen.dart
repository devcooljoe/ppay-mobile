import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/views/kyc_verification_complete_screen.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';

class BvnFaceRecogScreen extends StatefulWidget {
  const BvnFaceRecogScreen({super.key});

  @override
  State<BvnFaceRecogScreen> createState() => _BvnFaceRecogScreenState();
}

class _BvnFaceRecogScreenState extends State<BvnFaceRecogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PPaymobileColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: PPaymobileColors.backgroundColor,
        toolbarHeight: 56,
        leadingWidth: 56.w,
        title: Text(
          'Take Selfie',
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: PPaymobileColors.mainScreenBackground,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                90.verticalSpace,
                SizedBox(
                  height: 333.h,
                  width: 333.w,
                  child: Image.asset('assets/images/face_capture.png'),
                ),
                91.verticalSpace,
                Text(
                  'Look directly at your front Camera',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.mainScreenBackground,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                52.verticalSpace,
                TouchOpacity(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => KycVerificationCompleteScreen(),
                    ),
                  ),
                  child: SizedBox(
                    height: 95.h,
                    width: 95.w,
                    child: Image.asset(
                      'assets/images/twenty.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                16.verticalSpace,
                Text(
                  'Turn your head Left',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.mainScreenBackground,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                52.verticalSpace,
                TouchOpacity(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => KycVerificationCompleteScreen(),
                    ),
                  ),
                  child: SizedBox(
                    height: 95.h,
                    width: 95.w,
                    child: Image.asset(
                      'assets/images/sixty.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                16.verticalSpace,
                Text(
                  'Blink your eye',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.mainScreenBackground,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                52.verticalSpace,
                TouchOpacity(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => KycVerificationCompleteScreen(),
                    ),
                  ),
                  child: SizedBox(
                    height: 95.h,
                    width: 95.w,
                    child: Image.asset(
                      'assets/images/ninety.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                16.verticalSpace,
                Text(
                  'You’re all good',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.mainScreenBackground,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                52.verticalSpace,
                TouchOpacity(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => KycVerificationCompleteScreen(),
                    ),
                  ),
                  child: SizedBox(
                    height: 95.h,
                    width: 95.w,
                    child: Image.asset(
                      'assets/images/hundred.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                24.verticalSpace,
                SizedBox(
                  height: 333.h,
                  width: 333.w,
                  child: Image.asset('assets/images/face_capture_error.png'),
                ),
                91.verticalSpace,
                Text(
                  'Error occurred. Please try again',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.mainScreenBackground,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                52.verticalSpace,
                TouchOpacity(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => KycVerificationCompleteScreen(),
                    ),
                  ),
                  child: SizedBox(
                    height: 95.h,
                    width: 95.w,
                    child: Image.asset(
                      'assets/images/redo.png',
                      fit: BoxFit.contain,
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
