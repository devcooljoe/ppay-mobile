import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/views/kyc_verification_complete_screen.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class KycFaceVerificationScreen extends StatefulWidget {
  const KycFaceVerificationScreen({super.key});

  @override
  State<KycFaceVerificationScreen> createState() =>
      _KycFaceVerificationScreenState();
}

class _KycFaceVerificationScreenState extends State<KycFaceVerificationScreen> {
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
          padding: EdgeInsets.only(left: 10.w),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: SizedBox(
              height: 24.h,
              width: 24.w,
              child: SvgPicture.asset(
                'assets/icon/arrow_back_white.svg',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
          child: Column(
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
                'Look directly at your front Camera and take a picture of your face',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.mainScreenBackground,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              52.verticalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 68.w,
                    height: 68.h,
                    padding: EdgeInsets.all(18).r,
                    decoration: BoxDecoration(
                      color: PPaymobileColors.selfieOptionbgColor,
                      borderRadius: BorderRadius.circular(31).r,
                    ),
                    child: SizedBox(
                      height: 31.h,
                      width: 31.w,
                      child: SvgPicture.asset(
                        'assets/icon/rotate_camera.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => KycVerificationCompleteScreen(),
                      ),
                    ),
                    child: Container(
                      height: 97.h,
                      width: 97.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(48.5).r,
                        border: Border.all(
                          width: 5.w,
                          color: PPaymobileColors.mainScreenBackground,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0).r,
                        child: SizedBox(
                          height: 73.h,
                          width: 73.w,
                          child: SvgPicture.asset(
                            'assets/icon/capture_camera.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 68.w,
                    height: 68.h,
                    padding: EdgeInsets.all(18).r,
                    decoration: BoxDecoration(
                      color: PPaymobileColors.selfieOptionbgColor,
                      borderRadius: BorderRadius.circular(31).r,
                    ),
                    child: SizedBox(
                      height: 31.h,
                      width: 31.w,
                      child: SvgPicture.asset(
                        'assets/icon/flashlight_off.svg',
                        fit: BoxFit.contain,
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
