import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';

class ReferScreen extends StatefulWidget {
  const ReferScreen({super.key});

  @override
  State<ReferScreen> createState() => _ReferScreenState();
}

class _ReferScreenState extends State<ReferScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: AppBar(
        backgroundColor: PPaymobileColors.backgroundColor,
        toolbarHeight: 56,
        leadingWidth: 56.w,
        centerTitle: true,
        title: Text(
          'Referral',
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
        child: ListView(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                color: PPaymobileColors.backgroundColor,
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Refer your friends',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: PPaymobileColors.mainScreenBackground,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            1.verticalSpace,
                            SizedBox(
                              height: 76.h,
                              width: 275.w,
                              child: Text(
                                'Earn +200 point cashback',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: PPaymobileColors.mainScreenBackground,
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 114.h,
                            width: 107.w,
                            child: Image.asset(
                              'assets/images/trophy.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            27.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 58.h,
                        width: 56.w,
                        child: Image.asset(
                          'assets/images/coins.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      10.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Get rewards by sharing with friends',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Get +200 point for 5 referral',
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
                  49.verticalSpace,
                  Text(
                    'Simple steps to get rewards',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  25.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 33.h,
                        width: 33.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.5).r,
                          border: Border.all(
                            width: 1.w,
                            color: PPaymobileColors.textfiedBorder,
                          ),
                        ),
                        child: Center(
                          child: SizedBox(
                            height: 20.h,
                            width: 20.w,
                            child: SvgPicture.asset(
                              'assets/icon/link.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      8.horizontalSpace,
                      Text(
                        'Copy and share the link',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 17.w),
                    child: Container(
                      height: 34.h,
                      width: 1.w,
                      color: PPaymobileColors.textfiedBorder,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 33.h,
                        width: 33.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.5).r,
                          border: Border.all(
                            width: 1.w,
                            color: PPaymobileColors.textfiedBorder,
                          ),
                        ),
                        child: Center(
                          child: SizedBox(
                            height: 20.h,
                            width: 20.w,
                            child: SvgPicture.asset(
                              'assets/icon/signin.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      8.horizontalSpace,
                      Text(
                        'Your friends signup with your link',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 17.w),
                    child: Container(
                      height: 34.h,
                      width: 1.w,
                      color: PPaymobileColors.textfiedBorder,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 33.h,
                        width: 33.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.5).r,
                          border: Border.all(
                            width: 1.w,
                            color: PPaymobileColors.textfiedBorder,
                          ),
                        ),
                        child: Center(
                          child: SizedBox(
                            height: 20.h,
                            width: 20.w,
                            child: SvgPicture.asset(
                              'assets/icon/money.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      8.horizontalSpace,
                      Text(
                        'Get cashback price for referral',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  60.verticalSpace,
                  Text(
                    'Copy Link',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  10.verticalSpace,
                  Row(
                    children: [
                      SizedBox(
                        height: 44.h,
                        width: 328.w,
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10).r,
                            filled: true,
                            fillColor: PPaymobileColors.deepBackgroundColor,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: PPaymobileColors.svgIconColor,
                              ),
                            ),
                            hint: Text(
                              'https//www.pinnaclepay.comfghC3',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: PPaymobileColors.svgIconColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 46.h,
                        width: 72.w,
                        padding: EdgeInsets.all(10).r,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(4).r,
                            bottomRight: Radius.circular(4).r,
                          ),
                          color: PPaymobileColors.backgroundColor,
                        ),
                        child: Center(
                          child: Text(
                            'Copy',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: PPaymobileColors.mainScreenBackground,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  5.verticalSpace,
                  Text(
                    'You have zero referral',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
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
