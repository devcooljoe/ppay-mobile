import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/payment_screen.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/remove_from_cart_bottomsheet.dart';
import 'package:ppay_mobile/screens/widgets/select_country_bottomsheet.dart';
import 'package:ppay_mobile/screens/widgets/select_state_bottomsheet.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  void _showBillingDialog() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8).r,
              bottomRight: Radius.circular(8).r,
            ),
          ),
          child: SizedBox(
            height: 262.h,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                          Text(
                            '4140 Parker Rd. Allentown, New Mexico 31134',
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
                  27.verticalSpace,
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
                            'Canada',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '4140 Parker Rd. Allentown, New Mexico 31134',
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }

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
          'Check Out',
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              42.verticalSpace,
              Text(
                'Enter Receiver’s Address',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              21.verticalSpace,
              Text(
                'Receiver',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.verticalSpace,
              SizedBox(
                height: 54.h,
                width: double.infinity,
                child: TextFormField(
                  showCursor: true,
                  readOnly: true,
                  onTap: _showBillingDialog,
                  decoration: InputDecoration(
                    hintText: 'Enter Receiver Name',
                    hintStyle: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.textfieldGrey,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: PPaymobileColors.textfieldGrey,
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.circular(6).r,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 14.h,
                    ),
                  ),
                ),
              ),
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Country',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      4.verticalSpace,
                      SizedBox(
                        height: 54.h,
                        width: 190.w,
                        child: TextFormField(
                          showCursor: true,
                          readOnly: true,
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) {
                                return SelectCountryBottomsheet();
                              },
                            );
                          },
                          decoration: InputDecoration(
                            hint: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 23.h,
                                  width: 23.w,
                                  child: Image.asset(
                                    'assets/images/nigeria_flag.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                16.horizontalSpace,
                                Text(
                                  'Nigeria',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            suffixIcon: SizedBox(
                              height: 12.h,
                              width: 24.w,
                              child: SvgPicture.asset(
                                'assets/icon/arrow_down.svg',
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            // hintText: 'Enter Receiver Name',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: PPaymobileColors.textfieldGrey,
                                width: 1.w,
                              ),
                              borderRadius: BorderRadius.circular(6).r,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 14.h,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  20.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'State',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      4.verticalSpace,
                      SizedBox(
                        height: 54.h,
                        width: 190.w,
                        child: TextFormField(
                          showCursor: true,
                          readOnly: true,
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) {
                                return SelectStateBottomsheet();
                              },
                            );
                          },
                          decoration: InputDecoration(
                            hintText: 'Select',
                            hintStyle: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: PPaymobileColors.textfieldGrey,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            suffixIcon: SizedBox(
                              height: 12.h,
                              width: 24.w,
                              child: SvgPicture.asset(
                                'assets/icon/arrow_down.svg',
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            // hintText: 'Enter Receiver Name',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: PPaymobileColors.textfieldGrey,
                                width: 1.w,
                              ),
                              borderRadius: BorderRadius.circular(6).r,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 14.h,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              20.verticalSpace,
              Text(
                'Address',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.verticalSpace,
              SizedBox(
                height: 54.h,
                width: double.infinity,
                child: TextFormField(
                  showCursor: true,
                  decoration: InputDecoration(
                    hintText: 'Enter Details',
                    hintStyle: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.textfieldGrey,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: PPaymobileColors.textfieldGrey,
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.circular(6).r,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 14.h,
                    ),
                  ),
                ),
              ),
              20.verticalSpace,
              Text(
                'Phone No',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.verticalSpace,
              SizedBox(
                height: 54.h,
                width: double.infinity,
                child: TextFormField(
                  showCursor: true,
                  decoration: InputDecoration(
                    hintText: '+234|',
                    hintStyle: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.textfieldGrey,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: PPaymobileColors.textfieldGrey,
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.circular(6).r,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 14.h,
                    ),
                  ),
                ),
              ),
              20.verticalSpace,
              Text(
                'Add Note',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.verticalSpace,
              SizedBox(
                height: 107.h,
                width: double.infinity,
                child: TextFormField(
                  maxLines: 4,
                  showCursor: true,
                  decoration: InputDecoration(
                    hintText: 'Optional',
                    hintStyle: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.textfieldGrey,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: PPaymobileColors.textfieldGrey,
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.circular(6).r,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 14.h,
                    ),
                  ),
                ),
              ),
              40.verticalSpace,
              Text(
                'Order List',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              32.verticalSpace,
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
                            GestureDetector(
                              onTap: () async {
                                await showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  builder: (_) =>
                                      const RemoveFromCartBottomsheet(),
                                );
                              },
                              child: SizedBox(
                                height: 24.h,
                                width: 24.w,
                                child: SvgPicture.asset(
                                  'assets/icon/cancel.svg',
                                  fit: BoxFit.contain,
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
              40.verticalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 92.h,
                    width: 127.w,
                    child: Image.asset(
                      'assets/images/cloths_7.png',
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
                                'Female Orange Hoodie',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                await showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  builder: (_) =>
                                      const RemoveFromCartBottomsheet(),
                                );
                              },
                              child: SizedBox(
                                height: 24.h,
                                width: 24.w,
                                child: SvgPicture.asset(
                                  'assets/icon/cancel.svg',
                                  fit: BoxFit.contain,
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
              56.verticalSpace,
              SizedBox(
                height: 59.h,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Charges: 12,000',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            color: PPaymobileColors.lightGrey,
                          ),
                        ),
                        Text(
                          '₦112,000',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            fontWeight: FontWeight.w500,
                            fontSize: 24.sp,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    16.horizontalSpace,
                    TouchOpacity(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentScreen(),
                          ),
                        );
                      },
                      child: SizedBox(
                        height: 54.h,
                        width: 277.w,
                        child: Image.asset(
                          'assets/images/proceed.png',
                          fit: BoxFit.contain,
                        ),
                      ),
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
