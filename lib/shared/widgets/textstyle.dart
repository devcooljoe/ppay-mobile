import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PPaymobileTextStyles {
  static TextStyle regular({double? size, Color? color}) => TextStyle(
        fontFamily: 'InstrumentSans',
        fontWeight: FontWeight.w400,
        fontSize: size ?? 14.sp,
        color: color ?? Colors.black,
      );

  static TextStyle medium({double? size, Color? color}) => TextStyle(
        fontFamily: 'InstrumentSans',
        fontWeight: FontWeight.w500,
        fontSize: size ?? 14.sp,
        color: color ?? Colors.black,
      );

  static TextStyle semiBold({double? size, Color? color}) => TextStyle(
        fontFamily: 'InstrumentSans',
        fontWeight: FontWeight.w600,
        fontSize: size ?? 14.sp,
        color: color ?? Colors.black,
      );
}
