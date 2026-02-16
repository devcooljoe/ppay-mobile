import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/flight_two_pin_bottomsheet.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/option_picker.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';

class FlightTwoPaymentScreen extends StatefulWidget {
  const FlightTwoPaymentScreen({super.key});

  @override
  State<FlightTwoPaymentScreen> createState() => _FlightTwoPaymentScreenState();
}

class _FlightTwoPaymentScreenState extends State<FlightTwoPaymentScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: AppBar(
        animateColor: true,
        backgroundColor: PPaymobileColors.buttonColorandText,
        centerTitle: true,
        title: Text(
          'Payment',
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
              height: 24.h,
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
                    height: 250.h,
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
                        43.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
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
                          ],
                        ),
                      ],
                    ),
                  ),
                  24.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      'Payment From',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  10.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Container(
                      height: 74.h,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 9.h,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: PPaymobileColors.filterBorderColor,
                          width: 1.w,
                        ),
                        borderRadius: BorderRadius.circular(9).r,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 39.h,
                                width: 37.w,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 7.w,
                                  vertical: 9.h,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4).r,
                                  color: Color(0xffEFF5F2),
                                ),
                                child: Center(
                                  child: SizedBox(
                                    height: 23.h,
                                    width: 23.w,
                                    child: SvgPicture.asset(
                                      'assets/images/flag.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                              9.horizontalSpace,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Wallet Balance',
                                    style: TextStyle(
                                      fontFamily: 'InstrumentSans',
                                      color: PPaymobileColors.svgIconColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  4.verticalSpace,
                                  Text(
                                    '₦400,000.00',
                                    style: TextStyle(
                                      fontFamily: 'InstrumentSans',
                                      color: Colors.black,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          OptionPicker(
                            selected: selectedIndex == 1,
                            onSelected: () => setState(() {
                              selectedIndex = 1;
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                  65.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      'Order Summary',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  18.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Base Payment:',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '₦245,879.00',
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
                  19.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Charges Fee:',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '₦2,000.00',
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
                  19.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Airport Charges:',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '₦900.00',
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
                  19.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'VAT Fee:',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '₦1,980.00 (0.075%)',
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
                  13.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Divider(
                      color: PPaymobileColors.anotherGreyColor,
                      height: 1.h,
                    ),
                  ),
                  18.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total:',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '₦6,000.00',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  33.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: TouchOpacity(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) {
                            return FlightTwoPinBottomsheet();
                          },
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
                            'Confirm Payment',
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
          ],
        ),
      ),
    );
  }
}
