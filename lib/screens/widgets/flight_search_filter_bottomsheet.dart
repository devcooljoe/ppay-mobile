import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';

class FlightSearchFilterBottomsheet extends StatefulWidget {
  const FlightSearchFilterBottomsheet({super.key});

  @override
  State<FlightSearchFilterBottomsheet> createState() =>
      _FlightSearchFilterBottomsheetState();
}

class _FlightSearchFilterBottomsheetState
    extends State<FlightSearchFilterBottomsheet> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.980,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Transform.translate(
            offset: const Offset(0, 0),
            child: TouchOpacity(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 60.h,
                width: 60.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30).r,
                  color: PPaymobileColors.mainScreenBackground,
                ),
                child: SizedBox(
                  height: 18.h,
                  width: 18.h,
                  child: SvgPicture.asset(
                    'assets/icon/cancel.svg',
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
          ),
          10.verticalSpace,
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 20.w, top: 29.h, right: 20.w),
              width: double.infinity,
              decoration: BoxDecoration(
                color: PPaymobileColors.mainScreenBackground,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: ListView(
                children: [
                  Text(
                    'Filter',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  20.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sorts',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Reset all',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: PPaymobileColors.buttonColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  24.verticalSpace,
                  SizedBox(
                    height: 54.h,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 22.h,
                          width: 22.w,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(8).r,
                          ),
                          child: SvgPicture.asset(
                            'assets/icon/square_check.svg',
                            fit: BoxFit.fill,
                          ),
                        ),
                        7.horizontalSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Direct',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            10.verticalSpace,
                            Text(
                              'From ₦245,890.00',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  23.verticalSpace,
                  SizedBox(
                    height: 54.h,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 22.h,
                          width: 22.w,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(8).r,
                          ),
                          child: SvgPicture.asset(
                            'assets/icon/square_check.svg',
                            fit: BoxFit.fill,
                          ),
                        ),
                        7.horizontalSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '1 Stop',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            10.verticalSpace,
                            Text(
                              'From ₦245,890.00',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  23.verticalSpace,
                  SizedBox(
                    height: 54.h,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 22.h,
                          width: 22.w,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(8).r,
                          ),
                          child: SvgPicture.asset(
                            'assets/icon/square_check.svg',
                            fit: BoxFit.fill,
                          ),
                        ),
                        7.horizontalSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '2+ Stops',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            10.verticalSpace,
                            Text(
                              'From ₦245,890.00',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  15.verticalSpace,
                  SizedBox(
                    width: double.infinity,
                    child: Divider(
                      height: 1.h,
                      color: PPaymobileColors.textfiedBorder,
                    ),
                  ),
                  24.verticalSpace,
                  Text(
                    'Baggage',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  28.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 22.h,
                        width: 22.w,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(8).r,
                          border: Border.all(
                            color: PPaymobileColors.textfieldGrey,
                            width: 1.w,
                          ),
                        ),
                      ),
                      7.horizontalSpace,
                      Text(
                        'Carry on Bag',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  23.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 22.h,
                        width: 22.w,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(8).r,
                          border: Border.all(
                            color: PPaymobileColors.textfieldGrey,
                            width: 1.w,
                          ),
                        ),
                      ),
                      7.horizontalSpace,
                      Text(
                        'Checked Bag',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  17.verticalSpace,
                  SizedBox(
                    width: double.infinity,
                    child: Divider(
                      height: 1.h,
                      color: PPaymobileColors.textfiedBorder,
                    ),
                  ),
                  24.verticalSpace,
                  Text(
                    'Depature Time',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  28.verticalSpace,
                  Text(
                    'Outbound',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '12:30AM - 01:08AM',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  11.verticalSpace,
                  SizedBox(
                    height: 20.h,
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 20.h,
                          width: 20.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.r),
                            border: Border.all(
                              color: PPaymobileColors.buttonColor,
                              width: 1.w,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 4.h,
                            color: PPaymobileColors.buttonColor,
                          ),
                        ),
                        Container(
                          height: 20.h,
                          width: 20.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.r),
                            border: Border.all(
                              color: PPaymobileColors.buttonColor,
                              width: 1.w,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  17.verticalSpace,
                  SizedBox(
                    width: double.infinity,
                    child: Divider(
                      height: 1.h,
                      color: PPaymobileColors.textfiedBorder,
                    ),
                  ),
                  24.verticalSpace,
                  Text(
                    'Trip Duration',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  28.verticalSpace,
                  Text(
                    'Outbound',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '1.5 hours - 15 hours',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  11.verticalSpace,
                  SizedBox(
                    height: 20.h,
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 20.h,
                          width: 20.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.r),
                            border: Border.all(
                              color: PPaymobileColors.buttonColor,
                              width: 1.w,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 4.h,
                            color: PPaymobileColors.buttonColor,
                          ),
                        ),
                        Container(
                          height: 20.h,
                          width: 20.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.r),
                            border: Border.all(
                              color: PPaymobileColors.buttonColor,
                              width: 1.w,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  17.verticalSpace,
                  SizedBox(
                    width: double.infinity,
                    child: Divider(
                      height: 1.h,
                      color: PPaymobileColors.textfiedBorder,
                    ),
                  ),
                  24.verticalSpace,
                  Text(
                    'Airlines',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  28.verticalSpace,
                  SizedBox(
                    height: 54.h,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 22.h,
                          width: 22.w,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(8).r,
                          ),
                          child: SvgPicture.asset(
                            'assets/icon/square_check.svg',
                            fit: BoxFit.fill,
                          ),
                        ),
                        7.horizontalSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Air Peace',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            10.verticalSpace,
                            Text(
                              'From ₦245,890.00',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  23.verticalSpace,
                  SizedBox(
                    height: 54.h,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 22.h,
                          width: 22.w,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(8).r,
                          ),
                          child: SvgPicture.asset(
                            'assets/icon/square_check.svg',
                            fit: BoxFit.fill,
                          ),
                        ),
                        7.horizontalSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Arik Air',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            10.verticalSpace,
                            Text(
                              'From ₦245,890.00',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  23.verticalSpace,
                  SizedBox(
                    height: 54.h,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 22.h,
                          width: 22.w,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(8).r,
                          ),
                          child: SvgPicture.asset(
                            'assets/icon/square_check.svg',
                            fit: BoxFit.fill,
                          ),
                        ),
                        7.horizontalSpace,
                        Text(
                          'Airline Combinations',
                          textAlign: TextAlign.start,
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
                  17.verticalSpace,
                  SizedBox(
                    width: double.infinity,
                    child: Divider(
                      height: 1.h,
                      color: PPaymobileColors.textfiedBorder,
                    ),
                  ),
                  39.verticalSpace,
                  TouchOpacity(
                    child: Container(
                      height: 46.h,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                        vertical: 10.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(65).r,
                        color: PPaymobileColors.buttonColorandText,
                      ),
                      child: Center(
                        child: Text(
                          'Apply',
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
