import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/flight_details_screen.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/flight_search_filter_bottomsheet.dart';
import 'package:ppay_mobile/screens/widgets/sort_bottomsheet.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';
import 'package:ppay_mobile/screens/widgets/update_flight_dialog.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({super.key});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: AppBar(
        animateColor: true,
        backgroundColor: PPaymobileColors.mainScreenBackground,
        centerTitle: true,
        title: Text(
          'Search Result',
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
              height: 24.h,
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
        child: ListView(
          children: [
            38.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TouchOpacity(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) {
                          return FlightSearchFilterBottomsheet();
                        },
                      );
                    },
                    child: Container(
                      height: 34.h,
                      width: 194.w,
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.w,
                        vertical: 5.h,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: PPaymobileColors.filterBorderColor,
                          width: 1.w,
                        ),
                        borderRadius: BorderRadius.circular(55.r),
                        color: PPaymobileColors.mainScreenBackground,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 4.r,
                            color: Color(0xffA2A2A2).withValues(alpha: 0.25),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 24.h,
                            width: 24.h,
                            child: SvgPicture.asset(
                              'assets/icon/filter_2.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                          6.horizontalSpace,
                          Text(
                            'Filter',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
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
                          return SortBottomsheet();
                        },
                      );
                    },
                    child: Container(
                      height: 34.h,
                      width: 194.w,
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.w,
                        vertical: 5.h,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: PPaymobileColors.filterBorderColor,
                          width: 1.w,
                        ),
                        borderRadius: BorderRadius.circular(55.r),
                        color: PPaymobileColors.mainScreenBackground,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 4.r,
                            color: Color(0xffA2A2A2).withValues(alpha: 0.25),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 24.h,
                            width: 24.h,
                            child: SvgPicture.asset(
                              'assets/icon/filter.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                          6.horizontalSpace,
                          Text(
                            'Sort',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            36.verticalSpace,
            Padding(
              padding: EdgeInsets.only(left: 20.0.w),
              child: Text(
                'Found 7 available at best price',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            7.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Container(
                height: 76.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8).r,
                  color: PPaymobileColors.anotheroptionbgColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'LAGOS(NIG)',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            20.horizontalSpace,
                            SizedBox(
                              height: 24.h,
                              width: 24.h,
                              child: SvgPicture.asset(
                                'assets/icon/arrow_forward_1.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                            20.horizontalSpace,
                            Text(
                              'ABUJA(NIG)',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        8.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Wed, July 14',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            8.horizontalSpace,
                            SizedBox(
                              height: 7.h,
                              width: 7.h,
                              child: SvgPicture.asset(
                                'assets/icon/spacer.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                            8.horizontalSpace,
                            Text(
                              '1 Seat',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            8.horizontalSpace,
                            SizedBox(
                              height: 7.h,
                              width: 7.h,
                              child: SvgPicture.asset(
                                'assets/icon/spacer.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                            8.horizontalSpace,
                            Text(
                              'Economy',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    TouchOpacity(
                      onTap: () {
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          barrierColor: Colors.transparent,
                          builder: (BuildContext context) {
                            return UpdateFlightDialog();
                          },
                        );
                      },
                      child: SizedBox(
                        height: 24.h,
                        width: 24.h,
                        child: SvgPicture.asset(
                          'assets/icon/edit_1.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            32.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Container(
                height: 139.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8).r,
                  color: PPaymobileColors.anotheroptionbgColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'July - 2025',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    19.verticalSpace,
                    SizedBox(
                      height: 74.h,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            height: 74.h,
                            width: 52.w,
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 8.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6).r,
                              color: PPaymobileColors.mainScreenBackground,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Fri',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                9.verticalSpace,
                                Text(
                                  '11',
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
                          16.horizontalSpace,
                          Container(
                            height: 74.h,
                            width: 52.w,
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 8.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6).r,
                              color: PPaymobileColors.mainScreenBackground,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Sat',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                9.verticalSpace,
                                Text(
                                  '12',
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
                          16.horizontalSpace,
                          Container(
                            height: 74.h,
                            width: 52.w,
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 8.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6).r,
                              color: PPaymobileColors.mainScreenBackground,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Sun',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                9.verticalSpace,
                                Text(
                                  '13',
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
                          16.horizontalSpace,
                          Container(
                            height: 74.h,
                            width: 52.w,
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 8.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6).r,
                              color: PPaymobileColors.buttonColor,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Mon',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color:
                                        PPaymobileColors.mainScreenBackground,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                9.verticalSpace,
                                Text(
                                  '14',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color:
                                        PPaymobileColors.mainScreenBackground,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          16.horizontalSpace,
                          Container(
                            height: 74.h,
                            width: 52.w,
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 8.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6).r,
                              color: PPaymobileColors.mainScreenBackground,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Tue',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                9.verticalSpace,
                                Text(
                                  '15',
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
                          16.horizontalSpace,
                          Container(
                            height: 74.h,
                            width: 52.w,
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 8.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6).r,
                              color: PPaymobileColors.mainScreenBackground,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Wed',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                9.verticalSpace,
                                Text(
                                  '16',
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
                          16.horizontalSpace,
                          Container(
                            height: 74.h,
                            width: 52.w,
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 8.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6).r,
                              color: PPaymobileColors.mainScreenBackground,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Wed',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                9.verticalSpace,
                                Text(
                                  '17',
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
                          16.horizontalSpace,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            32.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Container(
                height: 324.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
                decoration: BoxDecoration(
                  color: PPaymobileColors.flightContainerbgColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            4.horizontalSpace,
                            Container(
                              height: 47.h,
                              width: 47.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.r),
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: Image.asset(
                                'assets/images/air_peace.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              'Air Peace',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 25.h,
                          width: 118.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 14.w,
                            vertical: 1.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32.r),
                            color: PPaymobileColors.anotherButtonColor,
                          ),
                          child: Text(
                            textAlign: TextAlign.center,
                            'Recommended',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: PPaymobileColors.navContainerbgColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    17.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Lagos',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            4.verticalSpace,
                            Text(
                              'LOS',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            4.verticalSpace,
                            Text(
                              '12:00 AM',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 13.h,
                              width: 13.h,
                              child: SvgPicture.asset(
                                'assets/icon/spacer.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                            5.horizontalSpace,
                            SizedBox(
                              height: 2.h,
                              width: 73.5.w,
                              child: SvgPicture.asset(
                                'assets/icon/dashed_1.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '1H 30MIN',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            6.verticalSpace,
                            SizedBox(
                              height: 16.h,
                              width: 16.h,
                              child: SvgPicture.asset(
                                'assets/icon/airplane_1.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                            6.verticalSpace,
                            Text(
                              'One way',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: PPaymobileColors.buttonColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 2.h,
                              width: 73.5.w,
                              child: SvgPicture.asset(
                                'assets/icon/dashed_2.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                            5.horizontalSpace,
                            SizedBox(
                              height: 13.h,
                              width: 13.h,
                              child: SvgPicture.asset(
                                'assets/icon/green_spacer.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Abuja',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            4.verticalSpace,
                            Text(
                              'ABJ',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            4.verticalSpace,
                            Text(
                              '02:00 AM',
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
                    16.verticalSpace,
                    Divider(
                      color: PPaymobileColors.onTapButtonColor,
                      height: 1.h,
                    ),
                    19.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Economy',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '₦154,670.09',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.buttonColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    32.verticalSpace,
                    TouchOpacity(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FlightDetailsScreen(),
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
                          color: PPaymobileColors.navContainerbgColor,
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
                  ],
                ),
              ),
            ),
            28.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Container(
                height: 324.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
                decoration: BoxDecoration(
                  color: PPaymobileColors.flightContainerbgColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            4.horizontalSpace,
                            Container(
                              height: 47.h,
                              width: 47.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.r),
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: Image.asset(
                                'assets/images/air_peace.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              'Air Peace',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 25.h,
                          width: 118.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 14.w,
                            vertical: 1.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32.r),
                            color: PPaymobileColors.anotherButtonColor,
                          ),
                          child: Text(
                            textAlign: TextAlign.center,
                            'Recommended',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: PPaymobileColors.navContainerbgColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    17.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Lagos',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            4.verticalSpace,
                            Text(
                              'LOS',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            4.verticalSpace,
                            Text(
                              '12:00 AM',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 13.h,
                              width: 13.h,
                              child: SvgPicture.asset(
                                'assets/icon/spacer.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                            5.horizontalSpace,
                            SizedBox(
                              height: 2.h,
                              width: 73.5.w,
                              child: SvgPicture.asset(
                                'assets/icon/dashed_1.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '1H 30MIN',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            6.verticalSpace,
                            SizedBox(
                              height: 16.h,
                              width: 16.h,
                              child: SvgPicture.asset(
                                'assets/icon/airplane_1.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                            6.verticalSpace,
                            Text(
                              'Round',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: PPaymobileColors.buttonColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 2.h,
                              width: 73.5.w,
                              child: SvgPicture.asset(
                                'assets/icon/dashed_2.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                            5.horizontalSpace,
                            SizedBox(
                              height: 13.h,
                              width: 13.h,
                              child: SvgPicture.asset(
                                'assets/icon/green_spacer.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Abuja',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            4.verticalSpace,
                            Text(
                              'ABJ',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            4.verticalSpace,
                            Text(
                              '02:00 AM',
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
                    16.verticalSpace,

                    Divider(
                      color: PPaymobileColors.onTapButtonColor,
                      height: 1.h,
                    ),
                    19.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Economy',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '₦154,670.09',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.buttonColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    32.verticalSpace,
                    TouchOpacity(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FlightDetailsScreen(),
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
                          color: PPaymobileColors.navContainerbgColor,
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
