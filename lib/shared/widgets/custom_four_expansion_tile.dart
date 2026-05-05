import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';

class CustomFourExpansionTile extends HookConsumerWidget {
  const CustomFourExpansionTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expanded = useState(false);
    return Column(
      children: [
        Theme(
          data: Theme.of(context).copyWith(
            dividerColor: Colors.transparent, // remove default divider
          ),
          child: ExpansionTile(
            tilePadding: EdgeInsets.zero,
            childrenPadding: EdgeInsets.only(bottom: 13.h),
            onExpansionChanged: (value) => expanded.value = value,
            title: Text(
              'Size',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontFamily: 'Gilroy',
                color: Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: expanded.value
                ? SizedBox(
                    height: 24.w,
                    width: 24.w,
                    child: SvgPicture.asset(
                      'assets/icon/minus.svg',
                      fit: BoxFit.contain,
                    ),
                  )
                : SizedBox(
                    height: 24.w,
                    width: 24.w,
                    child: SvgPicture.asset(
                      'assets/icon/add.svg',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 42.h,
                    width: 48.w,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4).r,
                      color: PPaymobileColors.buttonColor,
                    ),
                    child: Center(
                      child: Text(
                        'S',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          color: PPaymobileColors.mainScreenBackground,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  24.horizontalSpace,
                  Container(
                    height: 42.h,
                    width: 48.w,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4).r,
                      color: PPaymobileColors.deepBackgroundColor,
                    ),
                    child: Center(
                      child: Text(
                        'M',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  24.horizontalSpace,
                  Container(
                    height: 42.h,
                    width: 48.w,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4).r,
                      color: PPaymobileColors.deepBackgroundColor,
                    ),
                    child: Center(
                      child: Text(
                        'XL',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  24.horizontalSpace,
                  Container(
                    height: 42.h,
                    width: 48.w,
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4).r,
                      color: PPaymobileColors.deepBackgroundColor,
                    ),
                    child: Center(
                      child: Text(
                        'XXL',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  24.horizontalSpace,
                  Container(
                    height: 42.h,
                    width: 48.w,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4).r,
                      color: PPaymobileColors.deepBackgroundColor,
                    ),
                    child: Center(
                      child: Text(
                        '3L',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
