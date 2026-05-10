import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

class FeatureCard extends StatelessWidget {
  final String iconPath;
  final String label;
  final VoidCallback onTap;

  const FeatureCard({
    super.key,
    required this.iconPath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TouchOpacity(
          onTap: onTap,
          child: Container(
            height: 98.h,
            width: 122.w,
            decoration: BoxDecoration(
              border: Border.all(
                color: PPaymobileColors.textfiedBorder,
              ),
              borderRadius: BorderRadius.circular(8).r,
            ),
            child: Center(
              child: SizedBox(
                height: 52.w,
                width: 52.w,
                child: SvgPicture.asset(
                  iconPath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        8.verticalSpace,
        Text(
          label,
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: Colors.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
