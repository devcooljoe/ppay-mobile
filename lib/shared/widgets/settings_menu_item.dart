import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

class SettingsMenuItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback? onTap;
  final Widget? trailing;
  final Color? titleColor;

  const SettingsMenuItem({
    super.key,
    required this.imagePath,
    required this.title,
    this.onTap,
    this.trailing,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return TouchOpacity(
      onTap: onTap,
      child: Container(
        height: 56.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 9.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 38.w,
                    width: 38.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19.r),
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  10.horizontalSpace,
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: titleColor ?? Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            if (trailing != null) trailing!,
            SizedBox(
              height: 24.h,
              width: 12.w,
              child: SvgPicture.asset(
                'assets/icon/arrow_forward.svg',
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
