import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BulletText extends HookWidget {
  final String text;

  const BulletText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('•', style: TextStyle(fontSize: 16.sp, height: 1.4)),
        8.horizontalSpace,
        Expanded(
          child: Text(
            text,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontFamily: 'InstrumentSans',
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}
