import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/custom_expansion_tile.dart';
import 'package:ppay_mobile/screens/widgets/custom_four_expansion_tile.dart';
import 'package:ppay_mobile/screens/widgets/custom_three_expansion_tile.dart';
import 'package:ppay_mobile/screens/widgets/custom_two_expansion_tile.dart';

class ClothsFilterBottomsheet extends StatefulWidget {
  const ClothsFilterBottomsheet({super.key});

  @override
  State<ClothsFilterBottomsheet> createState() =>
      _ClothsFilterBottomsheetState();
}

class _ClothsFilterBottomsheetState extends State<ClothsFilterBottomsheet> {
  bool isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.950,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Transform.translate(
            offset: const Offset(0, 0),
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 60.w,
                width: 60.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30).r,
                  color: PPaymobileColors.mainScreenBackground,
                ),
                child: SizedBox(
                  height: 18.h,
                  width: 18.h,
                  child: SvgPicture.asset(
                    'assets/icon/cancel.svg',
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
          ),
          10.verticalSpace,
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 20.w, top: 29.h, right: 20.w),
              width: double.infinity,
              decoration: BoxDecoration(
                color: PPaymobileColors.mainScreenBackground,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Filter',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      34.verticalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Categories',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          23.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 38.h,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 25.w,
                                  vertical: 7.h,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2.w,
                                    color: PPaymobileColors.buttonColor,
                                  ),
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
                                      'All',
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
                              ),
                              24.horizontalSpace,
                              Container(
                                height: 38.h,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 25.w,
                                  vertical: 7.h,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2.w,
                                    color: PPaymobileColors.textfiedBorder,
                                  ),
                                  borderRadius: BorderRadius.circular(56).r,
                                ),
                                child: Center(
                                  child: Text(
                                    'Men Dress',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontFamily: 'InstrumentSans',
                                      color: Colors.black,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              24.horizontalSpace,
                              Container(
                                height: 38.h,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 25.w,
                                  vertical: 7.h,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2.w,
                                    color: PPaymobileColors.textfiedBorder,
                                  ),
                                  borderRadius: BorderRadius.circular(56).r,
                                ),
                                child: Center(
                                  child: Text(
                                    'Female',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontFamily: 'InstrumentSans',
                                      color: Colors.black,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          13.verticalSpace,
                          Divider(
                            color: PPaymobileColors.textfiedBorder,
                            thickness: 1.w,
                          ),
                          49.5.verticalSpace,
                          CustomExpansionTile(),
                          13.verticalSpace,
                          Divider(
                            color: PPaymobileColors.textfiedBorder,
                            thickness: 1.w,
                          ),
                          40.verticalSpace,
                          CustomTwoExpansionTile(),
                          13.verticalSpace,
                          Divider(
                            color: PPaymobileColors.textfiedBorder,
                            thickness: 1.w,
                          ),
                          40.verticalSpace,
                          CustomThreeExpansionTile(),
                          13.verticalSpace,
                          Divider(
                            color: PPaymobileColors.textfiedBorder,
                            thickness: 1.w,
                          ),
                          40.verticalSpace,
                          CustomFourExpansionTile(),
                          13.verticalSpace,
                          Divider(
                            color: PPaymobileColors.textfiedBorder,
                            thickness: 1.w,
                          ),
                          88.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 185.w,
                                height: 47.h,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        PPaymobileColors.buttonColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7).r,
                                    ),
                                    elevation: 0,
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    'Apply',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 185.w,
                                height: 47.h,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        PPaymobileColors.textfiedBorder,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7.r),
                                    ),
                                    elevation: 0,
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    'Reset',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.sp,
                                      color: Colors.black,
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
