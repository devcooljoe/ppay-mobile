import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';

class PassengersBottomsheet extends StatefulWidget {
  const PassengersBottomsheet({super.key});

  @override
  State<PassengersBottomsheet> createState() => _PassengersBottomsheetState();
}

class _PassengersBottomsheetState extends State<PassengersBottomsheet> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.600,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Transform.translate(
            offset: const Offset(0, 0),
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 60.h,
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
                  Text(
                    'Select Passengers',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                      color: Colors.black,
                    ),
                  ),
                  23.verticalSpace,
                  SizedBox(
                    height: 50.h,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Adults',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                                color: Colors.black,
                              ),
                            ),
                            10.verticalSpace,
                            Text(
                              'Age 18+',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 26.h,
                          width: 102.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TouchOpacity(
                                child: Container(
                                  height: 18.h,
                                  width: 18.h,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: PPaymobileColors.lightGrey,
                                      width: 1.5.w,
                                    ),
                                  ),
                                  child: Center(
                                    child: SizedBox(
                                      height: 8.h,
                                      width: 8.h,
                                      child: SvgPicture.asset(
                                        'assets/icon/minus.svg',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                '1',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  color: Colors.black,
                                ),
                              ),
                              TouchOpacity(
                                child: Container(
                                  height: 18.h,
                                  width: 18.h,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: PPaymobileColors.lightGrey,
                                      width: 1.5.w,
                                    ),
                                  ),
                                  child: Center(
                                    child: SizedBox(
                                      height: 8.h,
                                      width: 8.h,
                                      child: SvgPicture.asset(
                                        'assets/icon/add.svg',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  19.verticalSpace,
                  SizedBox(
                    height: 50.h,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Children',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                                color: Colors.black,
                              ),
                            ),
                            10.verticalSpace,
                            Text(
                              'Ages 0-17',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 26.h,
                          width: 102.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TouchOpacity(
                                child: Container(
                                  height: 18.h,
                                  width: 18.h,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: PPaymobileColors.lightGrey,
                                      width: 1.5.w,
                                    ),
                                  ),
                                  child: Center(
                                    child: SizedBox(
                                      height: 8.h,
                                      width: 8.h,
                                      child: SvgPicture.asset(
                                        'assets/icon/minus.svg',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                '1',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  color: Colors.black,
                                ),
                              ),
                              TouchOpacity(
                                child: Container(
                                  height: 18.h,
                                  width: 18.h,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: PPaymobileColors.lightGrey,
                                      width: 1.5.w,
                                    ),
                                  ),
                                  child: Center(
                                    child: SizedBox(
                                      height: 8.h,
                                      width: 8.h,
                                      child: SvgPicture.asset(
                                        'assets/icon/add.svg',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  24.verticalSpace,
                  Text(
                    "Select child's age",
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: Colors.black,
                    ),
                  ),
                  8.verticalSpace,
                  Container(
                    height: 50.h,
                    width: double.infinity,
                    padding: EdgeInsets.all(12).r,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: PPaymobileColors.textfieldGrey,
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.circular(6).r,
                      color: PPaymobileColors.mainScreenBackground,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "6",
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                          width: 24.w,
                          child: SvgPicture.asset(
                            'assets/icon/arrow_down.svg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  18.verticalSpace,
                  Text(
                    'Please note age of child must be valid for the age booked at the time of travel',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: PPaymobileColors.anotherGreyColor,
                    ),
                  ),
                  39.verticalSpace,
                  TouchOpacity(
                    child: Container(
                      height: 52.h,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 14.h,
                      ).r,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(65).r,
                        color: PPaymobileColors.navContainerbgColor,
                      ),
                      child: Center(
                        child: Text(
                          'Apply',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: PPaymobileColors.mainScreenBackground,
                          ),
                        ),
                      ),
                    ),
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
