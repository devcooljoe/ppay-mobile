import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/electricity_pin_bottomsheet.dart';

class ElectricityConfirmScreen extends StatefulWidget {
  const ElectricityConfirmScreen({super.key});

  @override
  State<ElectricityConfirmScreen> createState() =>
      _ElectricityConfirmScreenState();
}

class _ElectricityConfirmScreenState extends State<ElectricityConfirmScreen> {
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
          'Electricity Bill',
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
              Text(
                'Confirm Transaction',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Please carefully review the details below',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.svgIconColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              41.verticalSpace,
              Container(
                height: 327.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7).r,
                  border: Border.all(
                    width: 1.w,
                    color: PPaymobileColors.textfiedBorder,
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6.7.r,
                      color: PPaymobileColors.shadowColor,
                    ),
                  ],
                  color: PPaymobileColors.mainScreenBackground,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Transaction Details',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    24.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Meter Number:',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.svgIconColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '67893458864',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    24.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Payment to:',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.svgIconColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 25.h,
                              width: 37.w,
                              child: Image.asset(
                                'assets/images/ekedc_1.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            8.horizontalSpace,
                            Text(
                              'EKEDC',
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
                    24.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Amount:',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.svgIconColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '₦6,000.00',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    24.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Charges:',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.svgIconColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '₦0.00',
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
                    Divider(
                      color: PPaymobileColors.textfiedBorder,
                      height: 1.h,
                    ),
                    20.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total:',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.svgIconColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '₦6,000.00',
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
              ),
              129.verticalSpace,
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) {
                      return ElectricityPinBottomsheet();
                    },
                  );
                },
                child: SizedBox(
                  height: 50.h,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/confirm_pay.png',
                    fit: BoxFit.contain,
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
