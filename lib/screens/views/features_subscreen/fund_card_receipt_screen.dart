import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class FundCardReceiptScreen extends StatefulWidget {
  const FundCardReceiptScreen({super.key});

  @override
  State<FundCardReceiptScreen> createState() => _FundCardReceiptScreenState();
}

class _FundCardReceiptScreenState extends State<FundCardReceiptScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PPaymobileColors.deepBackgroundColor,
      appBar: AppBar(
        backgroundColor: PPaymobileColors.mainScreenBackground,
        toolbarHeight: 56,
        leadingWidth: 56.w,
        title: Text(
          'Receipt',
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
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
              16.verticalSpace,
              Container(
                height: 170.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
                color: PPaymobileColors.mainScreenBackground,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Dollar card Funded',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: PPaymobileColors.svgIconColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    7.verticalSpace,
                    Text(
                      '\$23.28',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    3.verticalSpace,
                    SizedBox(
                      height: 24.h,
                      width: 99.w,
                      child: Image.asset(
                        'assets/images/success.png', //for failed transaction, use 'assets/images/failed.png'
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
              16.verticalSpace,
              Container(
                height: 333.h,
                width: 400.w,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 21.h),
                color: PPaymobileColors.mainScreenBackground,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Date: ',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.svgIconColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '18 July, 2025',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    22.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Transaction ID: ',
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
                            Text(
                              'CGX-10980565',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            7.horizontalSpace,
                            SizedBox(
                              height: 21.h,
                              width: 21.w,
                              child: SvgPicture.asset(
                                'assets/icon/paste_black1.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    22.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Amount: ',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.svgIconColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '\$23.03',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    22.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Naira Amount: ',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.svgIconColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '₦149,000.00',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    22.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Charges Fee: ',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.svgIconColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '₦800',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    21.verticalSpace,
                    Divider(
                      color: PPaymobileColors.textfiedBorder,
                      thickness: 1.h,
                    ),
                    24.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total: ',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '\$23.28',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
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
    );
  }
}
