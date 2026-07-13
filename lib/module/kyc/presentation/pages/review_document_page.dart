import 'package:flutter/material.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';

@RoutePage()
class ReviewDocumentPage extends HookConsumerWidget {
  const ReviewDocumentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: const PPAppBar(title: 'Verification'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              35.verticalSpace,
              Text(
                'Failed Verification',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              18.verticalSpace,
              Text(
                'Some of your documents could not be verified. Please review details below',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.svgIconColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              56.verticalSpace,
              Text(
                'Unverified Documents',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              32.verticalSpace,
              Container(
                height: 188.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 11.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4).r,
                  color: PPaymobileColors.warningColor,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 24.w,
                      width: 24.w,
                      child: SvgPicture.asset(
                        'assets/icon/warning.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                    8.horizontalSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'National ID',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          2.verticalSpace,
                          Text(
                            'Reason',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.black,
                            ),
                          ),
                          10.verticalSpace,
                          Text(
                            'Your document didn’t meet verification requirements. Please re submit a valid, ID number so we can complete your verification',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: PPaymobileColors.kyccontainerColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          11.verticalSpace,
                          Row(
                            children: [
                              Text(
                                'Try Again',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: PPaymobileColors.backgroundColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              10.horizontalSpace,
                              SizedBox(
                                height: 24.w,
                                width: 24.w,
                                child: SvgPicture.asset(
                                  'assets/icon/arrow_forward_1.svg',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        ],
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
