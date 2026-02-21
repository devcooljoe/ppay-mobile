import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/select_inbound_seat_screen.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';

class SelectOutboundSeatScreen extends StatefulWidget {
  const SelectOutboundSeatScreen({super.key});

  @override
  State<SelectOutboundSeatScreen> createState() =>
      _SelectOutboundSeatScreenState();
}

class _SelectOutboundSeatScreenState extends State<SelectOutboundSeatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: AppBar(
        animateColor: true,
        backgroundColor: PPaymobileColors.buttonColorandText,
        centerTitle: true,
        title: Text(
          'Select Seat',
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: PPaymobileColors.mainScreenBackground,
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
                'assets/icon/arrow_back_white.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(
                    height: 124.h,
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 16.h),
                    color: PPaymobileColors.buttonColorandText,
                    child: Column(
                      children: [
                        35.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'LOS',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color:
                                        PPaymobileColors.mainScreenBackground,
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                4.verticalSpace,
                                Text(
                                  'LAGOS',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color:
                                        PPaymobileColors.mainScreenBackground,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 119.w,
                              height: 73.h,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  SvgPicture.asset('assets/icon/crmeter.svg'),
                                  Positioned(
                                    bottom: 16,
                                    child: SvgPicture.asset(
                                      'assets/icon/aeroplane.svg',
                                      width: 24.w,
                                      height: 24.w,
                                      allowDrawingOutsideViewBox: true,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0.h,
                                    child: Text(
                                      '1H 30MIN',
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        color: PPaymobileColors
                                            .mainScreenBackground,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'ABJ',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color:
                                        PPaymobileColors.mainScreenBackground,
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                4.verticalSpace,
                                Text(
                                  'ABUJA',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color:
                                        PPaymobileColors.mainScreenBackground,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  24.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 13.h,
                              width: 13.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1.r),
                                color: Color(0xffCFCFCF),
                              ),
                            ),
                            13.horizontalSpace,
                            Text(
                              'Selected',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 13.h,
                              width: 13.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1.r),
                                color: Color(0xffCFCFCF),
                              ),
                            ),
                            13.horizontalSpace,
                            Text(
                              'Available',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 13.h,
                              width: 13.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1.r),
                                color: Color(0xffCFCFCF),
                              ),
                            ),
                            13.horizontalSpace,
                            Text(
                              'Unavailable',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  40.verticalSpace,
                  Align(
                    alignment: AlignmentGeometry.center,
                    child: Container(
                      height: 28.h,
                      width: 124.w,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28).r,
                        border: Border.all(
                          color: PPaymobileColors.textfiedBorder,
                          width: 1.w,
                        ),
                        color: PPaymobileColors.mainScreenBackground,
                      ),
                      child: Center(
                        child: Text(
                          'Outbound Trip',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  40.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 44.h,
                          width: 53.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(4).r,
                          ),
                          child: Center(
                            child: Text(
                              'A',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        12.horizontalSpace,
                        Container(
                          height: 44.h,
                          width: 53.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(4).r,
                          ),
                          child: Center(
                            child: Text(
                              'B',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        23.horizontalSpace,
                        Container(
                          height: 44.h,
                          width: 53.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(4).r,
                          ),
                        ),
                        23.horizontalSpace,
                        Container(
                          height: 44.h,
                          width: 53.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(4).r,
                          ),
                          child: Center(
                            child: Text(
                              'C',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        12.horizontalSpace,
                        Container(
                          height: 44.h,
                          width: 53.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(4).r,
                          ),
                          child: Center(
                            child: Text(
                              'D',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        12.horizontalSpace,
                        Container(
                          height: 44.h,
                          width: 53.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(4).r,
                          ),
                          child: Center(
                            child: Text(
                              'E',
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
                  ),
                  20.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 44.h,
                          width: 53.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: PPaymobileColors.anotherbuttonbgColor,
                            borderRadius: BorderRadius.circular(4).r,
                          ),
                          child: Center(
                            child: Text(
                              'A1',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        12.horizontalSpace,
                        Container(
                          height: 44.h,
                          width: 53.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: PPaymobileColors.anotherbuttonbgColor,
                            borderRadius: BorderRadius.circular(4).r,
                          ),
                          child: Center(
                            child: Text(
                              'B1',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        23.horizontalSpace,
                        Container(
                          height: 44.h,
                          width: 53.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(4).r,
                          ),
                          child: Center(
                            child: Text(
                              '1',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        23.horizontalSpace,
                        Container(
                          height: 44.h,
                          width: 53.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: PPaymobileColors.anotherCtbgColor,
                            borderRadius: BorderRadius.circular(4).r,
                          ),
                          child: Center(
                            child: Text(
                              'C1',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        12.horizontalSpace,
                        Container(
                          height: 44.h,
                          width: 53.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xffCFCFCF),
                            borderRadius: BorderRadius.circular(4).r,
                          ),
                          child: Center(
                            child: Text(
                              'D1',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        12.horizontalSpace,
                        Container(
                          height: 44.h,
                          width: 53.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: PPaymobileColors.anotherCtbgColor,
                            borderRadius: BorderRadius.circular(4).r,
                          ),
                          child: Center(
                            child: Text(
                              'E1',
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
                  ),
                  33.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 44.h,
                          width: 53.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: PPaymobileColors.anotherbuttonbgColor,
                            borderRadius: BorderRadius.circular(4).r,
                          ),
                          child: Center(
                            child: Text(
                              'A2',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        12.horizontalSpace,
                        Container(
                          height: 44.h,
                          width: 53.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: PPaymobileColors.buttonColor,
                            borderRadius: BorderRadius.circular(4).r,
                          ),
                          child: Center(
                            child: Text(
                              'B2',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        23.horizontalSpace,
                        Container(
                          height: 44.h,
                          width: 53.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(4).r,
                          ),
                          child: Center(
                            child: Text(
                              '1',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        23.horizontalSpace,
                        Container(
                          height: 44.h,
                          width: 53.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: PPaymobileColors.anotherCtbgColor,
                            borderRadius: BorderRadius.circular(4).r,
                          ),
                          child: Center(
                            child: Text(
                              'C2',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        12.horizontalSpace,
                        Container(
                          height: 44.h,
                          width: 53.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xffCFCFCF),
                            borderRadius: BorderRadius.circular(4).r,
                          ),
                          child: Center(
                            child: Text(
                              'D2',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        12.horizontalSpace,
                        Container(
                          height: 44.h,
                          width: 53.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: PPaymobileColors.anotherCtbgColor,
                            borderRadius: BorderRadius.circular(4).r,
                          ),
                          child: Center(
                            child: Text(
                              'E2',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  33.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 44.h,
                          width: 53.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: PPaymobileColors.anotherbuttonbgColor,
                            borderRadius: BorderRadius.circular(4).r,
                          ),
                          child: Center(
                            child: Text(
                              'A3',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        12.horizontalSpace,
                        Container(
                          height: 44.h,
                          width: 53.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: PPaymobileColors.anotherbuttonbgColor,
                            borderRadius: BorderRadius.circular(4).r,
                          ),
                          child: Center(
                            child: Text(
                              'B3',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        23.horizontalSpace,
                        Container(
                          height: 44.h,
                          width: 53.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(4).r,
                          ),
                          child: Center(
                            child: Text(
                              '1',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        23.horizontalSpace,
                        Container(
                          height: 44.h,
                          width: 53.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: PPaymobileColors.anotherCtbgColor,
                            borderRadius: BorderRadius.circular(4).r,
                          ),
                          child: Center(
                            child: Text(
                              'C3',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        12.horizontalSpace,
                        Container(
                          height: 44.h,
                          width: 53.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xffCFCFCF),
                            borderRadius: BorderRadius.circular(4).r,
                          ),
                          child: Center(
                            child: Text(
                              'D3',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        12.horizontalSpace,
                        Container(
                          height: 44.h,
                          width: 53.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: PPaymobileColors.anotherCtbgColor,
                            borderRadius: BorderRadius.circular(4).r,
                          ),
                          child: Center(
                            child: Text(
                              'E3',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  33.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 44.h,
                          width: 53.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: PPaymobileColors.anotherbuttonbgColor,
                            borderRadius: BorderRadius.circular(4).r,
                          ),
                          child: Center(
                            child: Text(
                              'A4',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        12.horizontalSpace,
                        Container(
                          height: 44.h,
                          width: 53.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: PPaymobileColors.anotherbuttonbgColor,
                            borderRadius: BorderRadius.circular(4).r,
                          ),
                          child: Center(
                            child: Text(
                              'B4',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        23.horizontalSpace,
                        Container(
                          height: 44.h,
                          width: 53.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(4).r,
                          ),
                          child: Center(
                            child: Text(
                              '1',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        23.horizontalSpace,
                        Container(
                          height: 44.h,
                          width: 53.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: PPaymobileColors.anotherCtbgColor,
                            borderRadius: BorderRadius.circular(4).r,
                          ),
                          child: Center(
                            child: Text(
                              'C4',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        12.horizontalSpace,
                        Container(
                          height: 44.h,
                          width: 53.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xffCFCFCF),
                            borderRadius: BorderRadius.circular(4).r,
                          ),
                          child: Center(
                            child: Text(
                              'D4',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        12.horizontalSpace,
                        Container(
                          height: 44.h,
                          width: 53.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: PPaymobileColors.anotherCtbgColor,
                            borderRadius: BorderRadius.circular(4).r,
                          ),
                          child: Center(
                            child: Text(
                              'E4',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  33.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 44.h,
                          width: 53.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: PPaymobileColors.anotherbuttonbgColor,
                            borderRadius: BorderRadius.circular(4).r,
                          ),
                          child: Center(
                            child: Text(
                              'A5',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        12.horizontalSpace,
                        Container(
                          height: 44.h,
                          width: 53.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: PPaymobileColors.anotherbuttonbgColor,
                            borderRadius: BorderRadius.circular(4).r,
                          ),
                          child: Center(
                            child: Text(
                              'B5',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        23.horizontalSpace,
                        Container(
                          height: 44.h,
                          width: 53.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(4).r,
                          ),
                          child: Center(
                            child: Text(
                              '1',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        23.horizontalSpace,
                        Container(
                          height: 44.h,
                          width: 53.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: PPaymobileColors.anotherCtbgColor,
                            borderRadius: BorderRadius.circular(4).r,
                          ),
                          child: Center(
                            child: Text(
                              'C5',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        12.horizontalSpace,
                        Container(
                          height: 44.h,
                          width: 53.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xffCFCFCF),
                            borderRadius: BorderRadius.circular(4).r,
                          ),
                          child: Center(
                            child: Text(
                              'D5',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        12.horizontalSpace,
                        Container(
                          height: 44.h,
                          width: 53.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: PPaymobileColors.anotherCtbgColor,
                            borderRadius: BorderRadius.circular(4).r,
                          ),
                          child: Center(
                            child: Text(
                              'E5',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  49.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Class',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: PPaymobileColors.anotherGreyColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            3.verticalSpace,
                            Text(
                              'Economy',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Seat',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: PPaymobileColors.anotherGreyColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            3.verticalSpace,
                            Text(
                              'B2',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Price',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: PPaymobileColors.anotherGreyColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            3.verticalSpace,
                            Text(
                              '₦234,567',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  20.verticalSpace,
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: TouchOpacity(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectInboundSeatScreen(),
                    ),
                  );
                },
                child: Container(
                  height: 46.h,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(56).r,
                    color: PPaymobileColors.buttonColorandText,
                  ),
                  child: Center(
                    child: Text(
                      'Select',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: PPaymobileColors.mainScreenBackground,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
