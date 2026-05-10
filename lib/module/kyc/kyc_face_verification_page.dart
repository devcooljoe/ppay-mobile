import 'package:flutter/material.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';

@RoutePage()
class KycFaceVerificationPage extends HookConsumerWidget {
  const KycFaceVerificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              height: 24.w,
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
                height: 333.w,
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
                      height: 31.w,
                      width: 31.w,
                      child: SvgPicture.asset(
                        'assets/icon/rotate_camera.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  TouchOpacity(
                    onTap: () => context.router.push(KycVerificationCompleteRoute()),
                    child: Container(
                      height: 97.w,
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
                          height: 73.w,
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
                      height: 31.w,
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
