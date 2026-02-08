import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class SelectBetProviderBottomsheet extends StatefulWidget {
  const SelectBetProviderBottomsheet({super.key});

  @override
  State<SelectBetProviderBottomsheet> createState() =>
      _SelectBetProviderBottomsheetState();
}

class _SelectBetProviderBottomsheetState
    extends State<SelectBetProviderBottomsheet> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.665,
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
                          'Select Bet Provider',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            fontWeight: FontWeight.w500,
                            fontSize: 20.sp,
                            color: Colors.black,
                          ),
                        ),
                        29.verticalSpace,
                        Container(
                          height: 54.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4).r,
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: SizedBox(
                                height: 24.h,
                                width: 24.w,
                                child: SvgPicture.asset(
                                  'assets/icon/bank_search.svg',
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                              hintText: 'Search',
                              hintStyle: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: PPaymobileColors.textfiedBorder,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              filled: true,
                              fillColor: PPaymobileColors.deepBackgroundColor,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 14.h,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(4).r,
                              ),
                            ),
                          ),
                        ),
                        41.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 30.h,
                                  width: 30.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/sporty.png',
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                12.horizontalSpace,
                                Text(
                                  'Sporty',
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
                                Container(
                                  height: 30.h,
                                  width: 30.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/sporty.png',
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                12.horizontalSpace,
                                Text(
                                  'Sporty',
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
