import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PPLabel extends StatelessWidget {
  final String text;
  final Color? color;

  const PPLabel({
    super.key,
    required this.text,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'InstrumentSans',
        color: color ?? Colors.black,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
