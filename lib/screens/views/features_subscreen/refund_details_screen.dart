import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/cancel_flight_successful_screen.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/refund_policy_bottomsheet.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';

class RefundDetailsScreen extends StatefulWidget {
  const RefundDetailsScreen({super.key});

  @override
  State<RefundDetailsScreen> createState() => _RefundDetailsScreenState();
}

class _RefundDetailsScreenState extends State<RefundDetailsScreen> {
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
          'Refund Details',
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            40.verticalSpace,
            Text(
              'Confirm flight cancellation',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            24.verticalSpace,
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 46.h,
                width: 221.w,
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.r),
                  color: Color(0xffEEF7FF),
                ),
                child: Text(
                  'Flight Booking ID: #235678',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ),
            27.verticalSpace,
            Text(
              'Your Refunds',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                letterSpacing: 0,
              ),
            ),
            6.verticalSpace,
            Text(
              '₦234,908.00',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 0,
              ),
            ),
            31.verticalSpace,
            Text(
              'Cancellation details',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 0,
              ),
            ),
            19.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Flight Type:',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.svgIconColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0,
                  ),
                ),
                Text(
                  'One Way Trip',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0,
                  ),
                ),
              ],
            ),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Flight Location:',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.svgIconColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0,
                  ),
                ),
                Text(
                  'Lagos - Ibadan',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0,
                  ),
                ),
              ],
            ),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Flight Time:',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.svgIconColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0,
                  ),
                ),
                Text(
                  '23rd July, 2025  03:00PM',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0,
                  ),
                ),
              ],
            ),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Passengers:',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.svgIconColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0,
                  ),
                ),
                Text(
                  '1 Adult, 2 Children',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0,
                  ),
                ),
              ],
            ),
            15.verticalSpace,
            Divider(height: 1.h, color: PPaymobileColors.textfiedBorder),
            19.verticalSpace,
            Text(
              'Cancellation Fee & Non Refundables',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 0,
              ),
            ),
            7.verticalSpace,
            Text(
              'Please note that all flight fees and non refundable fee apply to all three passengers and have been summed up',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                letterSpacing: 0,
              ),
            ),
            26.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cancellation Fee:',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.svgIconColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0,
                  ),
                ),
                Text(
                  '₦1,550',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0,
                  ),
                ),
              ],
            ),
            19.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Airport Charges:',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.svgIconColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0,
                  ),
                ),
                Text(
                  '₦7,550',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0,
                  ),
                ),
              ],
            ),
            19.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'VAT Fee:',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.svgIconColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0,
                  ),
                ),
                Text(
                  '₦11,500 (0.75%)',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0,
                  ),
                ),
              ],
            ),
            70.verticalSpace,
            TouchOpacity(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) {
                    return RefundPolicyBottomsheet();
                  },
                );
              },
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'You confirm that you agree to our',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0,
                  ),
                  children: [
                    TextSpan(
                      text: ' flight cancellation policy',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Color(0xFF73A88C),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0,
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFF73A88C),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            19.verticalSpace,
            TouchOpacity(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CancelFlightSuccessfulScreen(),
                  ),
                );
              },
              child: Container(
                height: 54.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(56).r,
                  color: PPaymobileColors.buttonColorandText,
                ),
                child: Center(
                  child: Text(
                    'Cancel Flight',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            34.verticalSpace,
          ],
        ),
      ),
    );
  }
}
