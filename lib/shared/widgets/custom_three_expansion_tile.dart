import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomThreeExpansionTile extends HookConsumerWidget {
  const CustomThreeExpansionTile({super.key});

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
              'Color',
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
              SizedBox(
                height: 53.4.h,
                width: 389.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 53.4,
                      width: 53.4.w,
                      child: Image.asset(
                        'assets/images/color_1.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    30.51.horizontalSpace,
                    SizedBox(
                      height: 40.6.h,
                      width: 40.6.w,
                      child: Image.asset(
                        'assets/images/color_2.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    30.51.horizontalSpace,
                    SizedBox(
                      height: 40.6.h,
                      width: 40.6.w,
                      child: Image.asset(
                        'assets/images/color_3.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    30.51.horizontalSpace,
                    SizedBox(
                      height: 40.6.h,
                      width: 40.6.w,
                      child: Image.asset(
                        'assets/images/color_4.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    30.51.horizontalSpace,
                    SizedBox(
                      height: 40.6.h,
                      width: 40.6.w,
                      child: Image.asset(
                        'assets/images/color_5.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
