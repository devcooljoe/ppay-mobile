import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class RemoveFromCartBottomsheet extends StatefulWidget {
  const RemoveFromCartBottomsheet({super.key});

  @override
  State<RemoveFromCartBottomsheet> createState() =>
      _RemoveFromCartBottomsheetState();
}

class _RemoveFromCartBottomsheetState extends State<RemoveFromCartBottomsheet> {
  final bool _onTap = false;
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.490,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Remove from Cart?',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          fontWeight: FontWeight.w500,
                          fontSize: 24.sp,
                          color: Colors.black,
                        ),
                      ),
                      33.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 102.h,
                            width: 113.w,
                            child: Image.asset(
                              'assets/images/cloths_8.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(
                            width: 272.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Female Black Gown',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Cloths',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                    color: PPaymobileColors.svgIconColor,
                                  ),
                                ),
                                24.verticalSpace,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '₦56,000',
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18.sp,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 25.w,
                                          width: 25.w,
                                          padding: EdgeInsets.all(4).r,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: _onTap
                                                  ? PPaymobileColors.buttonColor
                                                  : PPaymobileColors
                                                        .textfiedBorder,
                                              width: 1.w,
                                            ),
                                          ),
                                          child: SizedBox(
                                            height: 2.h,
                                            width: 10.w,
                                            child: SvgPicture.asset(
                                              'assets/icon/minus.svg',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),

                                        11.horizontalSpace,
                                        Text(
                                          '1',
                                          style: TextStyle(
                                            fontFamily: 'InstrumentSans',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.sp,
                                            color: Colors.black,
                                          ),
                                        ),
                                        11.horizontalSpace,
                                        Container(
                                          height: 25.w,
                                          width: 25.w,
                                          padding: EdgeInsets.all(4).r,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: _onTap
                                                  ? PPaymobileColors.buttonColor
                                                  : PPaymobileColors
                                                        .textfiedBorder,
                                              width: 1.w,
                                            ),
                                          ),
                                          child: SizedBox(
                                            height: 9.w,
                                            width: 9.w,
                                            child: SvgPicture.asset(
                                              'assets/icon/add.svg',
                                              fit: BoxFit.contain,
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
                      ),
                    ],
                  ),
                  65.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 54.h,
                        width: 183.w,
                        child: Image.asset(
                          'assets/images/cancel.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: 54.h,
                        width: 183.w,
                        child: Image.asset(
                          'assets/images/remove.png',
                          fit: BoxFit.contain,
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
    );
  }
}
