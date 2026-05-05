import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';

class CustomTwoExpansionTile extends HookConsumerWidget {
  const CustomTwoExpansionTile({super.key});

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
              'Price',
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
                height: 25.h,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/range.png',
                  fit: BoxFit.contain,
                ),
              ),
              36.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Min:',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      12.horizontalSpace,
                      Container(
                        height: 46.h,
                        width: 133.h,
                        padding: EdgeInsets.all(10.r),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: PPaymobileColors.textfiedBorder,
                            width: 1.w,
                          ),
                          borderRadius: BorderRadius.circular(7).r,
                        ),
                        child: Center(
                          child: Text(
                            '₦10,000',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                    width: 22.w,
                    child: SvgPicture.asset(
                      'assets/icon/minus.svg',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Max:',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      12.horizontalSpace,
                      Container(
                        height: 46.h,
                        width: 133.h,
                        padding: EdgeInsets.all(10.r),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: PPaymobileColors.textfiedBorder,
                            width: 1.w,
                          ),
                          borderRadius: BorderRadius.circular(7).r,
                        ),
                        child: Center(
                          child: Text(
                            '₦200,000',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
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
