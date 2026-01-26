import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class CustomExpansionTile extends StatefulWidget {
  const CustomExpansionTile({super.key});

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
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
              'Type',
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
                children: [
                  _specialItem('All'),
                  24.horizontalSpace,
                  _normalItem('Suits'),
                  24.horizontalSpace,
                  _normalItem('Plain Shirt'),
                ],
              ),
              24.verticalSpace,
              Row(
                children: [
                  _normalItem('Hoodie'),
                  24.horizontalSpace,
                  _normalItem('Swim Suits'),
                  24.horizontalSpace,
                  _normalItem('Skirts'),
                ],
              ),
              24.verticalSpace,
              Row(
                children: [
                  _normalItem('Jeans'),
                  24.horizontalSpace,
                  _normalItem('Formal Wear'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  //Normal container
  Widget _normalItem(String text) {
    return Container(
      height: 38.h,
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 7.h),
      decoration: BoxDecoration(
        border: Border.all(width: 2.w, color: PPaymobileColors.textfiedBorder),
        borderRadius: BorderRadius.circular(56).r,
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: Colors.black,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _specialItem(String text) {
    return Container(
      height: 38.h,
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 7.h),
      decoration: BoxDecoration(
        border: Border.all(width: 2.w, color: PPaymobileColors.buttonColor),
        borderRadius: BorderRadius.circular(56).r,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 17.4.h,
            width: 17.4.w,
            child: SvgPicture.asset(
              'assets/icon/square_check.svg',
              fit: BoxFit.contain,
            ),
          ),
          12.horizontalSpace,
          Text(
            text,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: 'InstrumentSans',
              color: Colors.black,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
