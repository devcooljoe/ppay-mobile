import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/search_result_two_screen.dart';
import 'package:ppay_mobile/screens/widgets/class_bottomsheet.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/date_bottomsheet.dart';
import 'package:ppay_mobile/screens/widgets/depature_location_bottomsheet.dart';
import 'package:ppay_mobile/screens/widgets/destination_location_bottomsheet.dart';
import 'package:ppay_mobile/screens/widgets/passengers_bottomsheet.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';

class RoundWayTripScreen extends StatefulWidget {
  const RoundWayTripScreen({super.key});

  @override
  State<RoundWayTripScreen> createState() => _RoundWayTripScreenState();
}

class _RoundWayTripScreenState extends State<RoundWayTripScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.verticalSpace,
          Container(
            height: 128.h,
            width: 376.w,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8).r,
              border: Border.all(
                width: 1.w,
                color: PPaymobileColors.filterBorderColor,
              ),
            ),
            child: SizedBox(
              height: 112.h,
              width: 378.w,
              child: Stack(
                children: [
                  Positioned(
                    top: 0.h,
                    left: 0.w,
                    child: SizedBox(
                      height: 112.h,
                      width: 373.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TouchOpacity(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) {
                                  return DepatureLocationBottomsheet();
                                },
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                4.horizontalSpace,
                                SizedBox(
                                  height: 24.w,
                                  width: 24.w,
                                  child: SvgPicture.asset(
                                    'assets/icon/takeoff_1.svg',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                15.horizontalSpace,
                                SizedBox(
                                  height: 35.h,
                                  width: 1.5.w,
                                  child: VerticalDivider(
                                    width: 1.w,
                                    color: PPaymobileColors.filterBorderColor,
                                  ),
                                ),
                                25.horizontalSpace,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'From',
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                        color: PPaymobileColors.textfieldGrey,
                                      ),
                                    ),
                                    4.verticalSpace,
                                    Text(
                                      'Choose',
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: PPaymobileColors.textfieldGrey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          12.verticalSpace,
                          Divider(
                            height: 1.w,
                            color: PPaymobileColors.filterBorderColor,
                          ),
                          12.verticalSpace,
                          TouchOpacity(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) {
                                  return DestinationLocationBottomsheet();
                                },
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                4.horizontalSpace,
                                SizedBox(
                                  height: 24.w,
                                  width: 24.w,
                                  child: SvgPicture.asset(
                                    'assets/icon/flight_down.svg',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                15.horizontalSpace,
                                SizedBox(
                                  height: 35.h,
                                  width: 1.5.w,
                                  child: VerticalDivider(
                                    width: 1.w,
                                    color: PPaymobileColors.filterBorderColor,
                                  ),
                                ),
                                25.horizontalSpace,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'To',
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                        color: PPaymobileColors.textfieldGrey,
                                      ),
                                    ),
                                    Text(
                                      'Choose',
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: PPaymobileColors.textfieldGrey,
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
                  ),
                  Positioned(
                    top: 28.h,
                    right: 25.w,
                    child: Container(
                      height: 40.h,
                      width: 40.h,
                      padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                        color: PPaymobileColors.buttonColor,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 11.6.r,
                            color: Color(0xff429E6E).withValues(alpha: 0.18),
                          ),
                        ],
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/icon/swap_1.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          16.verticalSpace,
          TouchOpacity(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) {
                  return DateBottomsheet();
                },
              );
            },
            child: Container(
              height: 58.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.r),
                border: Border.all(
                  color: PPaymobileColors.lightGrey,
                  width: 1.w,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Departure Date',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.lightGrey,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  4.verticalSpace,
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icon/calendar_1.svg',
                        height: 18.w,
                        width: 18.w,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        '09/11/2025',
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
          ),
          16.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TouchOpacity(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) {
                      return PassengersBottomsheet();
                    },
                  );
                },
                child: Container(
                  height: 58.h,
                  width: 180.w,
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.r),
                    border: Border.all(
                      color: PPaymobileColors.lightGrey,
                      width: 1.w,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Passengers',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: PPaymobileColors.lightGrey,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      4.verticalSpace,
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icon/user_1.svg',
                            height: 18.w,
                            width: 18.w,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            '01 Adult',
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
              ),
              TouchOpacity(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) {
                      return ClassBottomsheet();
                    },
                  );
                },
                child: Container(
                  height: 58.h,
                  width: 180.w,
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.r),
                    border: Border.all(
                      color: PPaymobileColors.lightGrey,
                      width: 1.w,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Class',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: PPaymobileColors.lightGrey,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      4.verticalSpace,
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icon/economy.svg',
                            height: 18.w,
                            width: 18.w,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            'Economy',
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
              ),
            ],
          ),
          27.verticalSpace,
          TouchOpacity(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchResultTwoScreen(),
                ),
              );
            },
            child: Container(
              height: 52.h,
              width: 376.w,
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(55).r,
                color: PPaymobileColors.buttonColorandText,
              ),
              child: Center(
                child: Text(
                  'Search Flight',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.mainScreenBackground,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
