import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/check_out_screen.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/remove_from_cart_bottomsheet.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';

class YourCartBottomsheet extends StatefulWidget {
  const YourCartBottomsheet({super.key});

  @override
  State<YourCartBottomsheet> createState() => _YourCartBottomsheetState();
}

class _YourCartBottomsheetState extends State<YourCartBottomsheet> {
  final bool _onTap = false;
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.880,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Transform.translate(
            offset: const Offset(0, 0),
            child: TouchOpacity(
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your Cart',
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
                            height: 126.h,
                            width: 176.w,
                            child: Image.asset(
                              'assets/images/cloths_6.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 212.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 157.w,
                                      child: Text(
                                        'Female Black Gown',
                                        style: TextStyle(
                                          fontFamily: 'InstrumentSans',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    30.verticalSpace,
                                    TouchOpacity(
                                      onTap: () async {
                                        await showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          builder: (_) =>
                                              const RemoveFromCartBottomsheet(),
                                        );
                                      },
                                      child: SizedBox(
                                        height: 24.h,
                                        width: 24.w,
                                        child: SvgPicture.asset(
                                          'assets/icon/cancel.svg',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ],
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
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                  42.horizontalSpace,
                                  Container(
                                    height: 25.h,
                                    width: 25.w,
                                    padding: EdgeInsets.all(4).r,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: _onTap
                                            ? PPaymobileColors.buttonColor
                                            : PPaymobileColors.textfiedBorder,
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
                                    height: 25.h,
                                    width: 25.w,
                                    padding: EdgeInsets.all(4).r,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: _onTap
                                            ? PPaymobileColors.buttonColor
                                            : PPaymobileColors.textfiedBorder,
                                        width: 1.w,
                                      ),
                                    ),
                                    child: SizedBox(
                                      height: 9.h,
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
                      40.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 126.h,
                            width: 176.w,
                            child: Image.asset(
                              'assets/images/cloths_7.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 212.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 157.w,
                                      child: Text(
                                        'Female Orange Hoodie',
                                        style: TextStyle(
                                          fontFamily: 'InstrumentSans',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    30.verticalSpace,
                                    SizedBox(
                                      height: 24.h,
                                      width: 24.w,
                                      child: SvgPicture.asset(
                                        'assets/icon/cancel.svg',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ],
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
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                  42.horizontalSpace,
                                  Container(
                                    height: 25.h,
                                    width: 25.w,
                                    padding: EdgeInsets.all(4).r,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: _onTap
                                            ? PPaymobileColors.buttonColor
                                            : PPaymobileColors.textfiedBorder,
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
                                    height: 25.h,
                                    width: 25.w,
                                    padding: EdgeInsets.all(4).r,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: _onTap
                                            ? PPaymobileColors.buttonColor
                                            : PPaymobileColors.textfiedBorder,
                                        width: 1.w,
                                      ),
                                    ),
                                    child: SizedBox(
                                      height: 9.h,
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
                      63.verticalSpace,
                      Text(
                        'Order Summary',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp,
                          color: Colors.black,
                        ),
                      ),
                      18.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Subtotal:',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '₦112,000.00',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      19.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Delivery Fee:',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '₦6,000.00',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      19.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Discount:',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '₦1,000(1%)',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      47.83.verticalSpace,
                      Divider(
                        color: PPaymobileColors.anotherColor,
                        height: 1.h,
                      ),
                      17.verticalSpace,
                      SizedBox(
                        height: 62.h,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '₦858,000',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  '₦88,000',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: PPaymobileColors.textfiedBorder,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                            TouchOpacity(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CheckOutScreen(),
                                  ),
                                );
                              },
                              child: SizedBox(
                                height: 54.h,
                                width: 244.w,
                                child: Image.asset(
                                  'assets/images/check_out.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
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
