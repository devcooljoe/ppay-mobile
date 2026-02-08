import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class SelectMeterTypeBottomsheet extends StatefulWidget {
  const SelectMeterTypeBottomsheet({super.key});

  @override
  State<SelectMeterTypeBottomsheet> createState() =>
      _SelectMeterTypeBottomsheetState();
}

class _SelectMeterTypeBottomsheetState
    extends State<SelectMeterTypeBottomsheet> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.380,
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
              padding: EdgeInsets.only(left: 16.w, top: 25.h, right: 16.w),
              width: double.infinity,
              decoration: BoxDecoration(
                color: PPaymobileColors.mainScreenBackground,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Select Meter Type',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                            color: Colors.black,
                          ),
                        ),
                        29.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Prepaid',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 24.h,
                              width: 24.w,
                              child: SvgPicture.asset(
                                'assets/icon/indicator.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                        45.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Postpaid',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 24.h,
                              width: 24.w,
                              child: SvgPicture.asset(
                                'assets/icon/check_circle.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
