import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';

class EmptyState extends StatelessWidget {
  final String imagePath;
  final String message;

  const EmptyState({
    super.key,
    required this.imagePath,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 138.h,
          width: 225.w,
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
          ),
        ),
        Text(
          message,
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: PPaymobileColors.textfiedBorder,
          ),
        ),
      ],
    );
  }
}
