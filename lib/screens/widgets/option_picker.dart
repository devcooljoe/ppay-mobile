import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';

class OptionPicker extends StatefulWidget {
  final bool selected;
  final VoidCallback onSelected;
  const OptionPicker({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  @override
  State<OptionPicker> createState() => _OptionPickerState();
}

class _OptionPickerState extends State<OptionPicker> {
  @override
  Widget build(BuildContext context) {
    return TouchOpacity(
      onTap: widget.onSelected,
      child: Container(
        height: 20.h,
        width: 20.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10).r,
          border: Border.all(width: 1.5.w, color: PPaymobileColors.buttonColor),
        ),
        child: widget.selected
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
