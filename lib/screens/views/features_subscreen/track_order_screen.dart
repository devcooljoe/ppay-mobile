import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({super.key});

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: AppBar(
        backgroundColor: PPaymobileColors.mainScreenBackground,
        toolbarHeight: 56,
        leadingWidth: 56.w,
        centerTitle: true,
        title: Text(
          'Track Order',
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: SizedBox(
              height: 24.h,
              width: 24.w,
              child: SvgPicture.asset(
                'assets/icon/arrow_back.svg',
                fit: BoxFit.contain,
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
              46.verticalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 92.h,
                    width: 127.w,
                    child: Image.asset(
                      'assets/images/cloths_6.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  12.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 261.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 237.w,
                              child: Text(
                                'Female Black Gown',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Size L:',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                              color: Colors.black,
                            ),
                          ),
                          9.horizontalSpace,
                          SizedBox(
                            height: 7.h,
                            width: 7.w,
                            child: SvgPicture.asset(
                              'assets/icon/indicator_1.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                          9.horizontalSpace,
                          Text(
                            'Color: Black',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      12.verticalSpace,
                      Text(
                        '₦56,000',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              23.verticalSpace,
              Divider(color: PPaymobileColors.filterBorderColor, height: 1.h),
              30.verticalSpace,
              Text(
                'Order Details',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Expected Delivery Date: ',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.svgIconColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '23rd March, 2025',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              16.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tracking ID:',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.svgIconColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'TRK45690078',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              17.verticalSpace,
              Divider(color: PPaymobileColors.filterBorderColor, height: 1.h),
              30.verticalSpace,
              Text(
                'Address',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 35.h,
                    width: 35.w,
                    child: Image.asset(
                      'assets/images/location.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  10.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'United State',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      9.verticalSpace,
                      Text(
                        '4140 Parker Rd. Allentown, New Mexico 31134',
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
              17.verticalSpace,
              Divider(color: PPaymobileColors.filterBorderColor, height: 1.h),
              43.verticalSpace,
              Text(
                'Order Status',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              24.verticalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 36.h,
                            width: 36.w,
                            child: Image.asset(
                              'assets/images/big_check.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          17.horizontalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Order Placed',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              1.verticalSpace,
                              Text(
                                '23rd Aug, 2025',
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
                      SizedBox(
                        height: 24.h,
                        width: 24.w,
                        child: SvgPicture.asset(
                          'assets/icon/package.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 37.w,
                    height: 52.h,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Container(
                      height: 52.h,
                      width: 5.w,
                      color: PPaymobileColors.buttonColor,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 36.h,
                            width: 36.w,
                            child: Image.asset(
                              'assets/images/big_check.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          17.horizontalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Processing',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              1.verticalSpace,
                              Text(
                                '23rd Aug, 2025',
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
                      SizedBox(
                        height: 24.h,
                        width: 24.w,
                        child: SvgPicture.asset(
                          'assets/icon/process.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 37.w,
                    height: 52.h,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Container(
                      height: 52.h,
                      width: 5.w,
                      color: PPaymobileColors.deepBackgroundColor,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 36.h,
                            width: 36.w,
                            child: Image.asset(
                              'assets/images/big_check_1.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          17.horizontalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Shipped',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              1.verticalSpace,
                              Text(
                                '23rd Aug, 2025',
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
                      SizedBox(
                        height: 24.h,
                        width: 24.w,
                        child: SvgPicture.asset(
                          'assets/icon/delivery_truck_1.svg', // for completed use 'assets/icon/delivery_truck.svg'
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 37.w,
                    height: 52.h,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Container(
                      height: 52.h,
                      width: 5.w,
                      color: PPaymobileColors.deepBackgroundColor,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 36.h,
                            width: 36.w,
                            child: Image.asset(
                              'assets/images/big_check_1.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          17.horizontalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Delivered',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              1.verticalSpace,
                              Text(
                                '23rd Aug, 2025',
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
                      SizedBox(
                        height: 24.h,
                        width: 24.w,
                        child: SvgPicture.asset(
                          'assets/icon/delivered_1.svg', // for completed use 'assets/icon/delivered.svg'
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              108.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
