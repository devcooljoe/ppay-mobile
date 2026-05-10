import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

class CryptoActionButton extends StatelessWidget {
  final String iconPath;
  final String label;
  final VoidCallback onTap;

  const CryptoActionButton({
    super.key,
    required this.iconPath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TouchOpacity(
          onTap: onTap,
          child: Container(
            height: 68.w,
            width: 68.w,
            padding: EdgeInsets.all(15.54).r,
            decoration: BoxDecoration(
              color: PPaymobileColors.cryptoContainerColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SizedBox(
                height: 18.w,
                width: 18.w,
                child: SvgPicture.asset(
                  iconPath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        8.verticalSpace,
        Text(
          label,
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: PPaymobileColors.mainScreenBackground,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
