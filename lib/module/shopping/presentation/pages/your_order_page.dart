import 'package:flutter/material.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';

@RoutePage()
class YourOrderPage extends HookConsumerWidget {
  const YourOrderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: AppBar(
        backgroundColor: PPaymobileColors.mainScreenBackground,
        toolbarHeight: 56,
        leadingWidth: 56.w,
        centerTitle: true,
        title: Text(
          'Your Order',
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: TouchOpacity(
            onTap: () => Navigator.pop(context),
            child: SizedBox(
              height: 24.w,
              width: 24.w,
              child: SvgPicture.asset(
                'assets/icon/arrow_back.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              39.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 38.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: 25.w,
                      vertical: 7.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(49.r),
                      color: PPaymobileColors.tabColor,
                    ),
                    child: Center(
                      child: Text(
                        'All orders',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: PPaymobileColors.mainScreenBackground,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 38.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: 25.w,
                      vertical: 7.h,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: PPaymobileColors.textfiedBorder,
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.circular(49.r),
                      color: PPaymobileColors.mainScreenBackground,
                    ),
                    child: Center(
                      child: Text(
                        'Delivered',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 38.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: 25.w,
                      vertical: 7.h,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: PPaymobileColors.textfiedBorder,
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.circular(49.r),
                      color: PPaymobileColors.mainScreenBackground,
                    ),
                    child: Center(
                      child: Text(
                        'Active',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              54.verticalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 122.h,
                    width: 176.w,
                    child: Image.asset(
                      'assets/images/cloths_6.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: 122.h,
                    width: 212.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Female Black Gown',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Cloths',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                color: PPaymobileColors.svgIconColor,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '₦56,000',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp,
                                color: Colors.black,
                              ),
                            ),
                            42.horizontalSpace,
                            GestureDetector(
                              onTap: () {
                                context.router.push(TrackOrderRoute());
                              },
                              child: Container(
                                height: 35.h,
                                width: 67.w,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.w,
                                  vertical: 8.h,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4).r,
                                  color: PPaymobileColors.buttonColorandText,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Review',
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              40.verticalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 122.h,
                    width: 176.w,
                    child: Image.asset(
                      'assets/images/cloths_7.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: 122.h,
                    width: 212.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Female Black Gown',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Cloths',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                color: PPaymobileColors.svgIconColor,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '₦56,000',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp,
                                color: Colors.black,
                              ),
                            ),
                            42.horizontalSpace,
                            Container(
                              height: 35.h,
                              width: 67.w,
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                                vertical: 8.h,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4).r,
                                color: PPaymobileColors.buttonColorandText,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Review',
                                    style: TextStyle(
                                      fontFamily: 'InstrumentSans',
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
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
