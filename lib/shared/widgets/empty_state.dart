import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';

class EmptyState extends StatelessWidget {
  final String imagePath;
  final String message;
  final String? subtitle;
  final String? actionLabel;
  final VoidCallback? onAction;

  const EmptyState({
    super.key,
    required this.imagePath,
    required this.message,
    this.subtitle,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
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
        12.verticalSpace,
        Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
            color: PPaymobileColors.svgIconColor,
          ),
        ),
        if (subtitle != null) ...[
          6.verticalSpace,
          Text(
            subtitle!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'InstrumentSans',
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: PPaymobileColors.anotherGreyColor,
            ),
          ),
        ],
        if (actionLabel != null && onAction != null) ...[
          16.verticalSpace,
          TextButton(
            onPressed: onAction,
            child: Text(
              actionLabel!,
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: PPaymobileColors.buttonColor,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
