import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';

class AmountPackageButton extends StatelessWidget {
  final String amount;
  final VoidCallback? onTap;

  const AmountPackageButton({
    super.key,
    required this.amount,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 47.5.h,
        width: 91.w,
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: 4.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5).r,
          color: PPaymobileColors.deepBackgroundColor,
        ),
        child: Center(
          child: Text(
            amount,
            style: TextStyle(
              fontFamily: 'InstrumentSans',
              color: Colors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
