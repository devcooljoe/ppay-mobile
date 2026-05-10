import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';

class DataPlanCard extends StatelessWidget {
  final String duration;
  final String plan;
  final VoidCallback? onTap;

  const DataPlanCard({
    super.key,
    required this.duration,
    required this.plan,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 65.h,
        width: 125.w,
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: 4.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5).r,
          color: PPaymobileColors.deepBackgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              duration,
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: Colors.black,
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            8.verticalSpace,
            Text(
              plan,
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: Colors.black,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
