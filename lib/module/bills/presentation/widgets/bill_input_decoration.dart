import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';

InputDecoration billInputDecoration({required String hint}) {
  return InputDecoration(
    hintText: hint,
    hintStyle: TextStyle(
      fontFamily: 'InstrumentSans',
      color: PPaymobileColors.anotherGreyColor,
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: PPaymobileColors.textfieldGrey, width: 1.w),
      borderRadius: BorderRadius.circular(6.r),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: PPaymobileColors.buttonColor, width: 1.5.w),
      borderRadius: BorderRadius.circular(6.r),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: PPaymobileColors.textfieldGrey, width: 1.w),
      borderRadius: BorderRadius.circular(6.r),
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
  );
}
