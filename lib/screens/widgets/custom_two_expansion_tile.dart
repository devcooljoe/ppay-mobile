import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class CustomTwoExpansionTile extends StatefulWidget {
  const CustomTwoExpansionTile({super.key});

  @override
  State<CustomTwoExpansionTile> createState() => _CustomTwoExpansionTileState();
}

class _CustomTwoExpansionTileState extends State<CustomTwoExpansionTile> {
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
              'Price',
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
