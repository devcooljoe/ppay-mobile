import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;

  const QuantitySelector({
    super.key,
    required this.quantity,
    this.onIncrement,
    this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 44.w,
          width: 44.w,
          padding: EdgeInsets.all(10).r,
          decoration: BoxDecoration(
            border: Border.all(
              color: PPaymobileColors.svgIconColor,
              width: 1.w,
            ),
            borderRadius: BorderRadius.circular(7).r,
            color: PPaymobileColors.mainScreenBackground,
          ),
          child: GestureDetector(
            onTap: onDecrement,
            child: Center(
              child: SizedBox(
                height: 20.w,
                width: 20.w,
                child: SvgPicture.asset(
                  'assets/icon/minus.svg',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        20.horizontalSpace,
        Text(
          "$quantity",
          style: TextStyle(
            fontFamily: 'Gilroy',
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        20.horizontalSpace,
        Container(
          height: 44.w,
          width: 44.w,
          padding: EdgeInsets.all(10).r,
          decoration: BoxDecoration(
            border: Border.all(
              color: PPaymobileColors.svgIconColor,
              width: 1.w,
            ),
            borderRadius: BorderRadius.circular(7).r,
            color: PPaymobileColors.mainScreenBackground,
          ),
          child: GestureDetector(
            onTap: onIncrement,
            child: Center(
              child: SizedBox(
                height: 20.w,
                width: 20.w,
                child: SvgPicture.asset(
                  'assets/icon/add.svg',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
