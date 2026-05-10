import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

class TransactionListItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String amount;
  final VoidCallback? onTap;

  const TransactionListItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.amount,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TouchOpacity(
      onTap: onTap,
      child: Container(
        height: 49.h,
        width: double.infinity,
        color: PPaymobileColors.mainScreenBackground,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 49.w,
                  width: 49.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                12.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    4.verticalSpace,
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff9C9C9C),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              amount,
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: PPaymobileColors.redTextfield,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
