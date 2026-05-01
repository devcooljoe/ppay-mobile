import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class CancelFlightSuccessfulPage extends StatefulWidget {
  const CancelFlightSuccessfulPage({super.key});

  @override
  State<CancelFlightSuccessfulPage> createState() =>
      _CancelFlightSuccessfulPageState();
}

class _CancelFlightSuccessfulPageState
    extends State<CancelFlightSuccessfulPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: AppBar(automaticallyImplyLeading: false),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              122.verticalSpace,
              SizedBox(
                height: 74.w,
                width: 74.w,
                child: Image.asset(
                  'assets/images/success1.png',
                  fit: BoxFit.contain,
                ),
              ),
              25.verticalSpace,
              Text(
                'Flight Canceled',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.greenTextColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              4.verticalSpace,
              Text(
                textAlign: TextAlign.center,
                'Your flight booking for ID #45689 has been successfully canceled. A sum of ₦345,800.00 will be refunded to your wallet after confirmation.',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.svgIconColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              241.verticalSpace,
              TouchOpacity(
                onTap: () {},
                child: Container(
                  height: 50.h,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(56).r,
                    color: PPaymobileColors.buttonColorandText,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Book New Flight',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              18.verticalSpace,
              TouchOpacity(
                onTap: () {},
                child: Container(
                  height: 50.h,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(56).r,
                    color: PPaymobileColors.mainScreenBackground,
                    border: Border.all(
                      color: PPaymobileColors.textfiedBorder,
                      width: 1.w,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Go Back',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
