import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/module/flight/multi_select_seat_one_page.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/custom_date_picker.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class MultiPassengersDetailsPage extends HookConsumerWidget {
  const MultiPassengersDetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

                        },
                        child: Container(
                          height: 58.h,
                          width: 189.5.w,
                          padding: EdgeInsets.symmetric(horizontal: 14.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.r),
                            border: Border.all(
                              color: PPaymobileColors.lightGrey,
                              width: 1.w,
                            ),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icon/calendar.svg',
                                height: 18.w,
                                width: 18.w,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                '09/11/2025',
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
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nationality',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      4.verticalSpace,
                      Container(
                        height: 54.h,
                        width: 189.5.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6).r,
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            suffixIcon: TouchOpacity(
                              child: SizedBox(
                                height: 13.h,
                                width: 7.w,
                                child: SvgPicture.asset(
                                  'assets/icon/arrow_down.svg',
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                            hintText: 'Select',
                            hintStyle: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: PPaymobileColors.textfiedBorder,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 14.h,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.r),
                              borderSide: BorderSide(
                                color: PPaymobileColors.lightGrey,
                                width: 1.w,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.r),
                              borderSide: BorderSide(
                                color: PPaymobileColors.lightGrey,
                                width: 1.w,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              26.verticalSpace,
              Text(
                'Passport Number',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.verticalSpace,
              Container(
                height: 54.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6).r,
                ),
                child: TextFormField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    hintText: 'eg. 12345678',
                    hintStyle: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.textfiedBorder,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 14.h,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        color: PPaymobileColors.lightGrey,
                        width: 1.w,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        color: PPaymobileColors.lightGrey,
                        width: 1.w,
                      ),
                    ),
                  ),
                ),
              ),
              26.verticalSpace,
              Text(
                'Phone Number',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.verticalSpace,
              Container(
                height: 54.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6).r,
                ),
                child: TextFormField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    hintText: 'eg. 12345678',
                    hintStyle: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.textfiedBorder,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 14.h,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        color: PPaymobileColors.lightGrey,
                        width: 1.w,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        color: PPaymobileColors.lightGrey,
                        width: 1.w,
                      ),
                    ),
                  ),
                ),
              ),
              26.verticalSpace,
              Text(
                'Email',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.verticalSpace,
              Container(
                height: 54.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6).r,
                ),
                child: TextFormField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    hintText: 'eg. 12345678',
                    hintStyle: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.textfiedBorder,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 14.h,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        color: PPaymobileColors.lightGrey,
                        width: 1.w,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        color: PPaymobileColors.lightGrey,
                        width: 1.w,
                      ),
                    ),
                  ),
                ),
              ),
              40.verticalSpace,
              Text(
                'Passenger 2',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              13.verticalSpace,
              Text(
                'Full Name',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.verticalSpace,
              Container(
                height: 54.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6).r,
                ),
                child: TextFormField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    hintText: 'Enter Name',
                    hintStyle: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.textfiedBorder,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 14.h,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        color: PPaymobileColors.lightGrey,
                        width: 1.w,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        color: PPaymobileColors.lightGrey,
                        width: 1.w,
                      ),
                    ),
                  ),
                ),
              ),
              26.verticalSpace,
              Text(
                'Gender',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.verticalSpace,
              Container(
                height: 54.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6).r,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    suffixIcon: TouchOpacity(
                      child: SizedBox(
                        height: 13.h,
                        width: 7.w,
                        child: SvgPicture.asset(
                          'assets/icon/arrow_down.svg',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    hintText: 'Select',
                    hintStyle: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.textfiedBorder,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 14.h,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        color: PPaymobileColors.lightGrey,
                        width: 1.w,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        color: PPaymobileColors.lightGrey,
                        width: 1.w,
                      ),
                    ),
                  ),
                ),
              ),
              26.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Date of Birth',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      4.verticalSpace,
                      TouchOpacity(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) {
                              return CustomDatePickerDialog();
                            },

                        },
                        child: Container(
                          height: 58.h,
                          width: 189.5.w,
                          padding: EdgeInsets.symmetric(horizontal: 14.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.r),
                            border: Border.all(
                              color: PPaymobileColors.lightGrey,
                              width: 1.w,
                            ),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icon/calendar.svg',
                                height: 18.w,
                                width: 18.w,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                '09/11/2025',
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
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nationality',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      4.verticalSpace,
                      Container(
                        height: 54.h,
                        width: 189.5.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6).r,
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            suffixIcon: TouchOpacity(
                              child: SizedBox(
                                height: 13.h,
                                width: 7.w,
                                child: SvgPicture.asset(
                                  'assets/icon/arrow_down.svg',
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                            hintText: 'Select',
                            hintStyle: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: PPaymobileColors.textfiedBorder,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 14.h,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.r),
                              borderSide: BorderSide(
                                color: PPaymobileColors.lightGrey,
                                width: 1.w,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.r),
                              borderSide: BorderSide(
                                color: PPaymobileColors.lightGrey,
                                width: 1.w,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              26.verticalSpace,
              Text(
                'Passport Number',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.verticalSpace,
              Container(
                height: 54.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6).r,
                ),
                child: TextFormField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    hintText: 'eg. 12345678',
                    hintStyle: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.textfiedBorder,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 14.h,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        color: PPaymobileColors.lightGrey,
                        width: 1.w,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        color: PPaymobileColors.lightGrey,
                        width: 1.w,
                      ),
                    ),
                  ),
                ),
              ),
              26.verticalSpace,
              Text(
                'Phone Number',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.verticalSpace,
              Container(
                height: 54.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6).r,
                ),
                child: TextFormField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    hintText: 'eg. 12345678',
                    hintStyle: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.textfiedBorder,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 14.h,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        color: PPaymobileColors.lightGrey,
                        width: 1.w,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        color: PPaymobileColors.lightGrey,
                        width: 1.w,
                      ),
                    ),
                  ),
                ),
              ),
              26.verticalSpace,
              Text(
                'Email',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.verticalSpace,
              Container(
                height: 54.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6).r,
                ),
                child: TextFormField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    hintText: 'eg. 12345678',
                    hintStyle: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.textfiedBorder,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 14.h,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        color: PPaymobileColors.lightGrey,
                        width: 1.w,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        color: PPaymobileColors.lightGrey,
                        width: 1.w,
                      ),
                    ),
                  ),
                ),
              ),
              40.verticalSpace,
              Text(
                'Passenger 3',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              13.verticalSpace,
              Text(
                'Full Name',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.verticalSpace,
              Container(
                height: 54.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6).r,
                ),
                child: TextFormField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    hintText: 'Enter Name',
                    hintStyle: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.textfiedBorder,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 14.h,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        color: PPaymobileColors.lightGrey,
                        width: 1.w,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        color: PPaymobileColors.lightGrey,
                        width: 1.w,
                      ),
                    ),
                  ),
                ),
              ),
              26.verticalSpace,
              Text(
                'Gender',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.verticalSpace,
              Container(
                height: 54.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6).r,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    suffixIcon: TouchOpacity(
                      child: SizedBox(
                        height: 13.h,
                        width: 7.w,
                        child: SvgPicture.asset(
                          'assets/icon/arrow_down.svg',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    hintText: 'Select',
                    hintStyle: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.textfiedBorder,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 14.h,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        color: PPaymobileColors.lightGrey,
                        width: 1.w,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        color: PPaymobileColors.lightGrey,
                        width: 1.w,
                      ),
                    ),
                  ),
                ),
              ),
              26.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Date of Birth',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      4.verticalSpace,
                      TouchOpacity(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) {
                              return CustomDatePickerDialog();
                            },

                        },
                        child: Container(
                          height: 58.h,
                          width: 189.5.w,
                          padding: EdgeInsets.symmetric(horizontal: 14.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.r),
                            border: Border.all(
                              color: PPaymobileColors.lightGrey,
                              width: 1.w,
                            ),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icon/calendar.svg',
                                height: 18.w,
                                width: 18.w,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                '09/11/2025',
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
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nationality',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      4.verticalSpace,
                      Container(
                        height: 54.h,
                        width: 189.5.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6).r,
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            suffixIcon: TouchOpacity(
                              child: SizedBox(
                                height: 13.h,
                                width: 7.w,
                                child: SvgPicture.asset(
                                  'assets/icon/arrow_down.svg',
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                            hintText: 'Select',
                            hintStyle: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: PPaymobileColors.textfiedBorder,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 14.h,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.r),
                              borderSide: BorderSide(
                                color: PPaymobileColors.lightGrey,
                                width: 1.w,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.r),
                              borderSide: BorderSide(
                                color: PPaymobileColors.lightGrey,
                                width: 1.w,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              26.verticalSpace,
              Text(
                'Passport Number',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.verticalSpace,
              Container(
                height: 54.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6).r,
                ),
                child: TextFormField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    hintText: 'eg. 12345678',
                    hintStyle: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.textfiedBorder,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 14.h,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        color: PPaymobileColors.lightGrey,
                        width: 1.w,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        color: PPaymobileColors.lightGrey,
                        width: 1.w,
                      ),
                    ),
                  ),
                ),
              ),
              26.verticalSpace,
              Text(
                'Phone Number',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.verticalSpace,
              Container(
                height: 54.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6).r,
                ),
                child: TextFormField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    hintText: 'eg. 12345678',
                    hintStyle: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.textfiedBorder,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 14.h,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        color: PPaymobileColors.lightGrey,
                        width: 1.w,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        color: PPaymobileColors.lightGrey,
                        width: 1.w,
                      ),
                    ),
                  ),
                ),
              ),
              26.verticalSpace,
              Text(
                'Email',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.verticalSpace,
              Container(
                height: 54.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6).r,
                ),
                child: TextFormField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    hintText: 'eg. 12345678',
                    hintStyle: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.textfiedBorder,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 14.h,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        color: PPaymobileColors.lightGrey,
                        width: 1.w,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        color: PPaymobileColors.lightGrey,
                        width: 1.w,
                      ),
                    ),
                  ),
                ),
              ),
              46.verticalSpace,
              TouchOpacity(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MultiSelectSeatOnePage(),
                    ),

                },
                child: Container(
                  height: 46.h,
                  width: 212.w,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(56).r,
                    color: PPaymobileColors
                        .filterBorderColor, //buttoncolorandtext when all the containers are filled up
                  ),
                  child: Center(
                    child: Text(
                      'Select',
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
            ],
          ),
        ),
              ),
      ),
    );  }
