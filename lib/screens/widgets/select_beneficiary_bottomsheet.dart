import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';

class SelectBeneficiaryBottomsheet extends StatefulWidget {
  const SelectBeneficiaryBottomsheet({super.key});

  @override
  State<SelectBeneficiaryBottomsheet> createState() =>
      _SelectBeneficiaryBottomsheetState();
}

class _SelectBeneficiaryBottomsheetState
    extends State<SelectBeneficiaryBottomsheet> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.560,
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
          8.verticalSpace,
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 20.w, top: 29.h, right: 20.w),
              width: double.infinity,
              decoration: BoxDecoration(
                color: PPaymobileColors.mainScreenBackground,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
              ),
              child: ListView(
                children: [
                  Text(
                    'Select Beneficiary',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  40.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40.h,
                        width: 53.w,
                        child: Image.asset(
                          'assets/images/ekedc.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      14.horizontalSpace,
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'EKEDC',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '67893458864',
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp,
                                        color: PPaymobileColors.svgIconColor,
                                      ),
                                    ),
                                    5.horizontalSpace,
                                    SizedBox(
                                      height: 7.w,
                                      width: 7.w,
                                      child: SvgPicture.asset(
                                        'assets/icon/spacer.svg',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    5.horizontalSpace,
                                    Text(
                                      'ECO Bank',
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp,
                                        color: PPaymobileColors.svgIconColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            TouchOpacity(
                              child: Container(
                                height: 36.h,
                                width: 80.w,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 7.w,
                                  vertical: 6.h,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4).r,
                                  color: PPaymobileColors.buttonColorandText,
                                ),
                                child: Center(
                                  child: Text(
                                    "Pay Bill",
                                    style: TextStyle(
                                      color:
                                          PPaymobileColors.mainScreenBackground,
                                      fontSize: 14.sp,
                                      fontFamily: 'InstrumentSans',
                                      fontWeight: FontWeight.w500,
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
                  13.verticalSpace,
                  Divider(color: PPaymobileColors.textfiedBorder, height: 1.h),
                  32.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40.h,
                        width: 53.w,
                        child: Image.asset(
                          'assets/images/aedc.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      14.horizontalSpace,
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'EKEDC',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '67893458864',
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp,
                                        color: PPaymobileColors.svgIconColor,
                                      ),
                                    ),
                                    5.horizontalSpace,
                                    SizedBox(
                                      height: 7.w,
                                      width: 7.w,
                                      child: SvgPicture.asset(
                                        'assets/icon/spacer.svg',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    5.horizontalSpace,
                                    Text(
                                      'ECO Bank',
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp,
                                        color: PPaymobileColors.svgIconColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            TouchOpacity(
                              child: Container(
                                height: 36.h,
                                width: 80.w,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 7.w,
                                  vertical: 6.h,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4).r,
                                  color: PPaymobileColors.buttonColorandText,
                                ),
                                child: Center(
                                  child: Text(
                                    "Pay Bill",
                                    style: TextStyle(
                                      color:
                                          PPaymobileColors.mainScreenBackground,
                                      fontSize: 14.sp,
                                      fontFamily: 'InstrumentSans',
                                      fontWeight: FontWeight.w500,
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
                  13.verticalSpace,
                  Divider(color: PPaymobileColors.textfiedBorder, height: 1.h),
                  32.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40.h,
                        width: 53.w,
                        child: Image.asset(
                          'assets/images/ibedc.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      14.horizontalSpace,
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'EKEDC',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '67893458864',
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp,
                                        color: PPaymobileColors.svgIconColor,
                                      ),
                                    ),
                                    5.horizontalSpace,
                                    SizedBox(
                                      height: 7.w,
                                      width: 7.w,
                                      child: SvgPicture.asset(
                                        'assets/icon/spacer.svg',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    5.horizontalSpace,
                                    Text(
                                      'ECO Bank',
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp,
                                        color: PPaymobileColors.svgIconColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            TouchOpacity(
                              child: Container(
                                height: 36.h,
                                width: 80.w,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 7.w,
                                  vertical: 6.h,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4).r,
                                  color: PPaymobileColors.buttonColorandText,
                                ),
                                child: Center(
                                  child: Text(
                                    "Pay Bill",
                                    style: TextStyle(
                                      color:
                                          PPaymobileColors.mainScreenBackground,
                                      fontSize: 14.sp,
                                      fontFamily: 'InstrumentSans',
                                      fontWeight: FontWeight.w500,
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
                  13.verticalSpace,
                  Divider(color: PPaymobileColors.textfiedBorder, height: 1.h),
                  32.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40.h,
                        width: 53.w,
                        child: Image.asset(
                          'assets/images/ikedc.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      14.horizontalSpace,
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'EKEDC',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '67893458864',
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp,
                                        color: PPaymobileColors.svgIconColor,
                                      ),
                                    ),
                                    5.horizontalSpace,
                                    SizedBox(
                                      height: 7.w,
                                      width: 7.w,
                                      child: SvgPicture.asset(
                                        'assets/icon/spacer.svg',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    5.horizontalSpace,
                                    Text(
                                      'ECO Bank',
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp,
                                        color: PPaymobileColors.svgIconColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            TouchOpacity(
                              child: Container(
                                height: 36.h,
                                width: 80.w,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 7.w,
                                  vertical: 6.h,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4).r,
                                  color: PPaymobileColors.buttonColorandText,
                                ),
                                child: Center(
                                  child: Text(
                                    "Pay Bill",
                                    style: TextStyle(
                                      color:
                                          PPaymobileColors.mainScreenBackground,
                                      fontSize: 14.sp,
                                      fontFamily: 'InstrumentSans',
                                      fontWeight: FontWeight.w500,
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
                  13.verticalSpace,
                  Divider(color: PPaymobileColors.textfiedBorder, height: 1.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
