import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';

/// Inline verification status widget used across bill payment pages.
/// Shows a loading indicator, a success banner with the customer name,
/// or an error banner — matching the pattern used in TransferFundsPage.
class BillVerificationStatus extends StatelessWidget {
  final bool isLoading;
  final String? customerName;
  final bool hasError;
  final String errorMessage;

  const BillVerificationStatus({
    super.key,
    required this.isLoading,
    required this.customerName,
    required this.hasError,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: PPaymobileColors.deepBackgroundColor,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Row(
          children: [
            SizedBox(
              height: 16.w,
              width: 16.w,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: PPaymobileColors.buttonColorandText,
              ),
            ),
            8.horizontalSpace,
            Text(
              'Verifying...',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: PPaymobileColors.svgIconColor,
              ),
            ),
          ],
        ),
      );
    }

    if (customerName != null && customerName!.isNotEmpty) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: PPaymobileColors.doneColor,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Row(
          children: [
            SvgPicture.asset('assets/icon/tick_circle.svg',
                height: 16.w, width: 16.w),
            8.horizontalSpace,
            Expanded(
              child: Text(
                customerName!,
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: PPaymobileColors.doneTextColor,
                ),
              ),
            ),
          ],
        ),
      );
    }

    if (hasError) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: PPaymobileColors.dangerColor,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Row(
          children: [
            SvgPicture.asset('assets/icon/danger.svg',
                height: 16.w, width: 16.w),
            8.horizontalSpace,
            Expanded(
              child: Text(
                errorMessage,
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  fontSize: 13.sp,
                  color: PPaymobileColors.dangerTextColor,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
