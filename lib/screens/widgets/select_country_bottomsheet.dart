import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/model/document_model.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class SelectCountryBottomsheet extends StatefulWidget {
  const SelectCountryBottomsheet({super.key});

  @override
  State<SelectCountryBottomsheet> createState() =>
      _SelectCountryBottomsheetState();
}

class _SelectCountryBottomsheetState extends State<SelectCountryBottomsheet> {
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
                borderRadius: BorderRadius.vertical(top: Radius.circular(36.r)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Select Country',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            fontWeight: FontWeight.w500,
                            fontSize: 20.sp,
                            color: Colors.black,
                          ),
                        ),
                        32.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 23.h,
                                  width: 23.w,
                                  child: Image.asset(
                                    'assets/images/nigeria_flag.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                12.horizontalSpace,
                                Text(
                                  'Nigeria',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 23.h,
                                  width: 23.w,
                                  child: Image.asset(
                                    'assets/images/nigeria_flag.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                12.horizontalSpace,
                                Text(
                                  'Nigeria',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
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
