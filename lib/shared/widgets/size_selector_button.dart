import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';

class SizeSelectorButton extends StatelessWidget {
  final String size;
  final bool isSelected;
  final VoidCallback? onTap;

  const SizeSelectorButton({
    super.key,
    required this.size,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 42.h,
        width: 48.w,
        padding: EdgeInsets.symmetric(
          horizontal: size.length > 2 ? 8.w : 16.w,
          vertical: 10.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4).r,
          color: isSelected
              ? PPaymobileColors.buttonColor
              : PPaymobileColors.deepBackgroundColor,
        ),
        child: Center(
          child: Text(
            size,
            style: TextStyle(
              fontFamily: 'Gilroy',
              color: isSelected
                  ? PPaymobileColors.mainScreenBackground
                  : Colors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
