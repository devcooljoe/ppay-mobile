import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

class FeatureIconButton extends StatelessWidget {
  final String iconPath;
  final String label;
  final VoidCallback onTap;

  const FeatureIconButton({
    super.key,
    required this.iconPath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TouchOpacity(
          onTap: onTap,
          child: Container(
            height: 66.h,
            width: 78.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              color: PPaymobileColors.deepBackgroundColor,
            ),
            child: Center(
              child: SvgPicture.asset(iconPath),
            ),
          ),
        ),
        12.verticalSpace,
        Text(
          label,
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
