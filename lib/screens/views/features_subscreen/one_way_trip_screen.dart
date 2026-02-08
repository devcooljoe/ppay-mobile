import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class OneWayTripScreen extends StatefulWidget {
  const OneWayTripScreen({super.key});

  @override
  State<OneWayTripScreen> createState() => _OneWayTripScreenState();
}

class _OneWayTripScreenState extends State<OneWayTripScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        20.verticalSpace,
        SizedBox(
          height: 128.h,
          width: 376.w,
          child: Container(
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              4.horizontalSpace,
                              SizedBox(
                                height: 24.h,
                                width: 24.w,
                                child: SvgPicture.asset(
                                  'assets/icon/takeoff_1.svg',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              15.horizontalSpace,
                              VerticalDivider(
                                width: 1.w,
                                color: PPaymobileColors.filterBorderColor,
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
                          12.verticalSpace,
                          Divider(
                            height: 1.w,
                            color: PPaymobileColors.filterBorderColor,
                          ),
                          12.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              4.horizontalSpace,
                              SizedBox(
                                height: 24.h,
                                width: 24.w,
                                child: SvgPicture.asset(
                                  'assets/icon/flight_down.svg',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              15.horizontalSpace,
                              VerticalDivider(
                                width: 1.w,
                                color: PPaymobileColors.filterBorderColor,
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
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 28.h,
                    right: 25.w,
                    child: SizedBox(
                      height: 40.h,
                      width: 40.w,
                      child: Image.asset(
                        'assets/images/updown.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        16.verticalSpace,
        SizedBox(
          height: 58.h,
          width: double.infinity,
          child: TextFormField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 14.w,
                vertical: 8.h,
              ),
              labelText: 'Departure Date',
              labelStyle: TextStyle(
                fontFamily: 'InstrumentSans',
                color: PPaymobileColors.lightGrey,
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
              ),
              floatingLabelAlignment: FloatingLabelAlignment.start,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              hintText: '09/11/2025',
              hintStyle: TextStyle(
                fontFamily: 'InstrumentSans',
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              prefixIcon: SizedBox(
                height: 24.h,
                width: 24.w,
                child: SvgPicture.asset(
                  'assets/icon/calendar_1.svg',
                  fit: BoxFit.scaleDown,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9.r),
                borderSide: BorderSide(
                  color: PPaymobileColors.filterBorderColor,
                  width: 1.w,
                ),
              ),
            ),
          ),
        ),
        16.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 58.h,
              width: 180.w,
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 8.h,
                  ),
                  labelText: 'Passengers',
                  labelStyle: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.lightGrey,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  hintText: '01 Adult',
                  hintStyle: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  prefixIcon: SizedBox(
                    height: 24.h,
                    width: 24.w,
                    child: SvgPicture.asset(
                      'assets/icon/user_1.svg',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9.r),
                    borderSide: BorderSide(
                      color: PPaymobileColors.filterBorderColor,
                      width: 1.w,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 58.h,
              width: 180.w,
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 8.h,
                  ),
                  labelText: 'Class',
                  labelStyle: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.lightGrey,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  hintText: 'Economy',
                  hintStyle: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  prefixIcon: SizedBox(
                    height: 24.h,
                    width: 24.w,
                    child: SvgPicture.asset(
                      'assets/icon/economy.svg',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9.r),
                    borderSide: BorderSide(
                      color: PPaymobileColors.filterBorderColor,
                      width: 1.w,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        27.verticalSpace,
        SizedBox(
          height: 52.h,
          width: 376.w,
          child: Image.asset('assets/images/sfl.png', fit: BoxFit.contain),
        ),
        // SizedBox(
        //   height: 44.h,
        //   width: double.infinity,
        //   child: ElevatedButton(
        //     style: ElevatedButton.styleFrom(
        //       backgroundColor: Color(0xFF0B6B61),
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(24.r),
        //       ),
        //     ),
        //     onPressed: () {},
        //     child: const Text('Search Flight'),
        //   ),
        // ),
      ],
    );
  }
}
