import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class BoardinngPassDetailsScreen extends StatefulWidget {
  const BoardinngPassDetailsScreen({super.key});

  @override
  State<BoardinngPassDetailsScreen> createState() =>
      _BoardinngPassDetailsScreenState();
}

class _BoardinngPassDetailsScreenState
    extends State<BoardinngPassDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 91.h,
          width: 91.h,
          child: Image.asset(
            'assets/images/air_peace.png',
            fit: BoxFit.contain,
          ),
        ),
        4.verticalSpace,
        Text(
          'Murtala Muhammed International Airport',
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: PPaymobileColors.svgIconColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        2.verticalSpace,
        Text(
          'Air Peace Line',
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: PPaymobileColors.svgIconColor,
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        40.verticalSpace,
        SizedBox(
          height: 3.h,
          width: 355.w,
          child: SvgPicture.asset(
            'assets/icon/dashed_3.svg',
            fit: BoxFit.contain,
          ),
        ),
        36.verticalSpace,
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
                    color: Colors.black,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                4.verticalSpace,
                Text(
                  'LAGOS',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: Colors.black,
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
                clipBehavior: Clip.none,
                children: [
                  SvgPicture.asset('assets/icon/crmeter.svg'),
                  Positioned(
                    bottom: 16,
                    child: SvgPicture.asset(
                      'assets/icon/airplane_g.svg',
                      width: 24.w,
                      height: 24.w,
                    ),
                  ),
                  Positioned(
                    bottom: 0.h,
                    child: Text(
                      '1H 30MIN',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
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
                    color: Colors.black,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                4.verticalSpace,
                Text(
                  'ABUJA',
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
        32.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 100.h,
              width: 178.w,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10).r,
                color: Color(0xffF9F9F9),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24.h,
                    width: 24.h,
                    child: SvgPicture.asset(
                      'assets/icon/time_b.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                  8.verticalSpace,
                  Text(
                    'Time',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  5.verticalSpace,
                  Text(
                    '04:00AM - 01:30AM',
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
            Container(
              height: 100.h,
              width: 178.w,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10).r,
                color: Color(0xffF9F9F9),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24.h,
                    width: 24.h,
                    child: SvgPicture.asset(
                      'assets/icon/calendar.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                  8.verticalSpace,
                  Text(
                    'Date',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  5.verticalSpace,
                  Text(
                    'July 14, 2025',
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
          ],
        ),
        35.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Flight',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.anotherGreyColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                2.verticalSpace,
                Text(
                  'NIG121',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Gate',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.anotherGreyColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                2.verticalSpace,
                Text(
                  'T4',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: Colors.black,
                    fontSize: 14.sp,
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
                2.verticalSpace,
                Text(
                  'B2',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
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
                2.verticalSpace,
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
        41.verticalSpace,
        SizedBox(
          height: 3.h,
          width: 355.w,
          child: SvgPicture.asset(
            'assets/icon/dashed_3.svg',
            fit: BoxFit.contain,
          ),
        ),
        24.verticalSpace,
        Text(
          'Passenger name',
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: PPaymobileColors.buttonColor,
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        2.verticalSpace,
        Text(
          'Adebami Sarah',
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: Colors.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        10.verticalSpace,
        SizedBox(
          height: 65.h,
          width: 349.w,
          child: SvgPicture.asset(
            'assets/icon/bar_code.svg',
            fit: BoxFit.contain,
          ),
        ),
        2.verticalSpace,
        Text(
          '12345678904757893334759',
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: Colors.black,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
