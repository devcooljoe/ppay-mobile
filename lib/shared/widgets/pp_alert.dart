import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';

enum PPAlertType { warning, success, error }

class PPAlert extends StatelessWidget {
  final String message;
  final PPAlertType type;
  final VoidCallback? onTap;
  final bool showCloseButton;

  const PPAlert({
    super.key,
    required this.message,
    required this.type,
    this.onTap,
    this.showCloseButton = false,
  });

  Color get _backgroundColor {
    switch (type) {
      case PPAlertType.warning:
        return PPaymobileColors.warningColor;
      case PPAlertType.success:
        return PPaymobileColors.doneColor;
      case PPAlertType.error:
        return PPaymobileColors.dangerColor;
    }
  }

  Color get _textColor {
    switch (type) {
      case PPAlertType.warning:
        return PPaymobileColors.warningTextColor;
      case PPAlertType.success:
        return PPaymobileColors.doneTextColor;
      case PPAlertType.error:
        return PPaymobileColors.dangerTextColor;
    }
  }

  String get _iconPath {
    switch (type) {
      case PPAlertType.warning:
        return 'assets/icon/warning.svg';
      case PPAlertType.success:
        return 'assets/icon/tick_pass.svg';
      case PPAlertType.error:
        return 'assets/icon/danger.svg';
    }
  }

  @override
  Widget build(BuildContext context) {
    final content = Container(
      height: 56.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 11.w,
        vertical: 9.h,
      ),
      decoration: BoxDecoration(
        color: _backgroundColor,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 24.w,
            width: 24.w,
            child: SvgPicture.asset(
              _iconPath,
              fit: BoxFit.contain,
            ),
          ),
          8.horizontalSpace,
          Expanded(
            child: Text(
              message,
              softWrap: true,
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: _textColor,
              ),
            ),
          ),
          if (showCloseButton) ...[
            8.horizontalSpace,
            SizedBox(
              height: 28.w,
              width: 28.w,
              child: SvgPicture.asset(
                'assets/icon/cancel.svg',
                fit: BoxFit.contain,
              ),
            ),
          ],
        ],
      ),
    );

    return Container(
      height: 76.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
      color: PPaymobileColors.mainScreenBackground,
      child: onTap != null
          ? GestureDetector(onTap: onTap, child: content)
          : content,
    );
  }
}
