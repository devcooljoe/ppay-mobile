import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';

class DepatureLocationBottomsheet extends StatefulWidget {
  const DepatureLocationBottomsheet({super.key});

  @override
  State<DepatureLocationBottomsheet> createState() =>
      _DepatureLocationBottomsheetState();
}

class _DepatureLocationBottomsheetState
    extends State<DepatureLocationBottomsheet> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.550,
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
                  Text(
                    'Enter departure location',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                      color: Colors.black,
                    ),
                  ),
                  38.verticalSpace,
                  SizedBox(
                    height: 44.h,
                    width: 396.w,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter Location',
                        hintStyle: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: PPaymobileColors.filterBorderColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        suffixIcon: SizedBox(
                          height: 24.h,
                          width: 24.h,
                          child: SvgPicture.asset(
                            'assets/icon/cancel_1.svg',
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        contentPadding: EdgeInsets.all(10).r,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.r),
                          borderSide: BorderSide(
                            color: PPaymobileColors.textfiedBorder,
                            width: 1.w,
                          ),
                        ),
                      ),
                    ),
                  ),
                  28.verticalSpace,
                  Text(
                    'Suggestions',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: Colors.black,
                    ),
                  ),
                  20.verticalSpace,
                  TouchOpacity(
                    child: SizedBox(
                      height: 49.h,
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 33.h,
                            width: 33.h,
                            child: SvgPicture.asset(
                              'assets/icon/takeoff_1.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                          10.horizontalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Lagos(LOS)',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                ),
                              ),
                              4.verticalSpace,
                              Text(
                                'Nigeria',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: PPaymobileColors.anotherGreyColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  20.verticalSpace,
                  TouchOpacity(
                    child: SizedBox(
                      height: 49.h,
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 33.h,
                            width: 33.h,
                            child: SvgPicture.asset(
                              'assets/icon/takeoff_1.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                          10.horizontalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Ibadan(IBA)',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                ),
                              ),
                              4.verticalSpace,
                              Text(
                                'Nigeria',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: PPaymobileColors.anotherGreyColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  20.verticalSpace,
                  TouchOpacity(
                    child: SizedBox(
                      height: 49.h,
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 33.h,
                            width: 33.h,
                            child: SvgPicture.asset(
                              'assets/icon/takeoff_1.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                          10.horizontalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Benin(BEN)',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                ),
                              ),
                              4.verticalSpace,
                              Text(
                                'Nigeria',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: PPaymobileColors.anotherGreyColor,
                                ),
                              ),
                            ],
                          ),
                        ],
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
