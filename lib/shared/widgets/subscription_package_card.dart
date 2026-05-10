import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';

class SubscriptionPackageCard extends StatelessWidget {
  final String packageName;
  final String price;
  final String duration;
  final VoidCallback? onTap;

  const SubscriptionPackageCard({
    super.key,
    required this.packageName,
    required this.price,
    required this.duration,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 84.h,
        width: 127.w,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5).r,
          color: PPaymobileColors.deepBackgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              packageName,
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: Colors.black,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            4.verticalSpace,
            RichText(
              text: TextSpan(
                text: '$price/',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                children: [
                  TextSpan(
                    text: duration,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.buttonColor,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
