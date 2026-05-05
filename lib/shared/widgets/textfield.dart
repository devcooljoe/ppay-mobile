import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PPTextfield extends HookWidget {
  final Widget prefixI;
  final String hintT;
  final TextStyle hintS;
  final Widget? suffixI;
  const PPTextfield({
    super.key,
    required this.prefixI,
    required this.hintT,
    required this.hintS,
    this.suffixI,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
        prefixIcon: prefixI,
        suffixIcon: suffixI,
        hintText: hintT,
        hintStyle: hintS,
        // prefixIcon: SvgPicture.asset(
        //   'assets/icon/message_icon.svg',
        //   height: 24.h,
        //   width: 24.w,
        // ),
        // hintText: 'e.g John Doe',
        // hintStyle: TextStyle(
        //   fontFamily: 'Gilroy',
        //   fontWeight: FontWeight.w400,
        //   fontSize: 16.sp,
        //   fontStyle: FontStyle.italic,
        //   color: PPaymobileColors.svgIconColor,
        // ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.r),
          borderSide: BorderSide(color: Color(0xff9C9C9C)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.r),
          borderSide: BorderSide(color: Color(0xff9C9C9C)),
        ),
      ),
    );
  }
}
