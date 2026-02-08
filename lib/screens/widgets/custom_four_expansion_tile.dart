import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class CustomFourExpansionTile extends StatefulWidget {
  const CustomFourExpansionTile({super.key});

  @override
  State<CustomFourExpansionTile> createState() =>
      _CustomFourExpansionTileState();
}

class _CustomFourExpansionTileState extends State<CustomFourExpansionTile> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Theme(
          data: Theme.of(context).copyWith(
            dividerColor: Colors.transparent, // remove default divider
          ),
          child: ExpansionTile(
            tilePadding: EdgeInsets.zero,
            childrenPadding: EdgeInsets.only(bottom: 13.h),
            onExpansionChanged: (value) {
              setState(() => _expanded = value);
            },
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
            trailing: _expanded
                ? SizedBox(
                    height: 24.h,
                    width: 24.w,
                    child: SvgPicture.asset(
                      'assets/icon/minus.svg',
                      fit: BoxFit.contain,
                    ),
                  )
                : SizedBox(
                    height: 24.h,
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
