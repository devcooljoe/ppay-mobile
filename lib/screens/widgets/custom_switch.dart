import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({super.key, required this.value, required this.onChanged});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onChanged(!widget.value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 16.w,
        height: 16.h, // smaller track
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        decoration: BoxDecoration(
          color: widget.value
              ? PPaymobileColors
                    .doneColor // active track
              : PPaymobileColors.deepBackgroundColor, // inactive track
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Align(
          alignment: widget.value
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 20.w, // bigger thumb
            height: 20.w,
            decoration: BoxDecoration(
              color: widget.value
                  ? PPaymobileColors
                        .buttonColor // active thumb
                  : PPaymobileColors.textfiedBorder, // inactive thumb
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
