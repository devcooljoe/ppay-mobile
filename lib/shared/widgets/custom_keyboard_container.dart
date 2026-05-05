import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';

class KeyboardContainer extends HookWidget {
  final Widget child;

  const KeyboardContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 424.h,
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
