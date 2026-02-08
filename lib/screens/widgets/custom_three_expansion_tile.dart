import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomThreeExpansionTile extends StatefulWidget {
  const CustomThreeExpansionTile({super.key});

  @override
  State<CustomThreeExpansionTile> createState() =>
      _CustomThreeExpansionTileState();
}

class _CustomThreeExpansionTileState extends State<CustomThreeExpansionTile> {
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
              'Color',
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
