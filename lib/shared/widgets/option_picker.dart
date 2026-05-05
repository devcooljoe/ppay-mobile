import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

class OptionPicker extends HookWidget {
  final bool selected;
  final VoidCallback onSelected;
  const OptionPicker({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return TouchOpacity(
      onTap: onSelected,
      child: Container(
        height: 20.h,
        width: 20.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10).r,
          border: Border.all(width: 1.5.w, color: PPaymobileColors.buttonColor),
        ),
        child: selected
            ? Center(
                child: Container(
                  height: 12.h,
                  width: 12.h,
                  decoration: BoxDecoration(
                    color: PPaymobileColors.buttonColor,
                    borderRadius: BorderRadius.circular(6).r,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
