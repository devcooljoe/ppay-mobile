import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class KeyboardContainer extends StatelessWidget {
  final Widget child;

  const KeyboardContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 424.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: PPaymobileColors.mainScreenBackground,
        boxShadow: [
          BoxShadow(
            color: PPaymobileColors.deepBackgroundColor,
            blurRadius: 4.r,
          ),
        ],
      ),
      child: child,
    );
  }
}
