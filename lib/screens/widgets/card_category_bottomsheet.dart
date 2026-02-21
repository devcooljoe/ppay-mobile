import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/option_picker.dart';

class CardCategoryBottomsheet extends StatefulWidget {
  const CardCategoryBottomsheet({super.key});

  @override
  State<CardCategoryBottomsheet> createState() =>
      _CardCategoryBottomsheetState();
}

class _CardCategoryBottomsheetState extends State<CardCategoryBottomsheet> {
  int selectedIndex = 0;
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
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select Card Category',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                          color: Colors.black,
                        ),
                      ),
                      29.verticalSpace,
                      SizedBox(
                        height: 54.h,
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: SvgPicture.asset(
                              'assets/icon/bank_search.svg',
                              fit: BoxFit.scaleDown,
                            ),
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              fontFamily: 'InstrumentSans',
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              color: PPaymobileColors.anotherColor,
                            ),
                            filled: true,
                            fillColor: PPaymobileColors.deepBackgroundColor,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4).r,
                              borderSide: BorderSide.none,
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
                              SizedBox(
                                height: 31.h,
                                width: 46.w,
                                child: Image.asset(
                                  'assets/images/amazon_1.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              12.horizontalSpace,
                              Text(
                                'Amazon UK',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          OptionPicker(
                            selected: selectedIndex == 1,
                            onSelected: () => setState(() {
                              selectedIndex = 1;
                            }),
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
                                height: 36.h,
                                width: 41.w,
                                child: Image.asset(
                                  'assets/images/walmart.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              12.horizontalSpace,
                              Text(
                                'Walmart USA',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          OptionPicker(
                            selected: selectedIndex == 2,
                            onSelected: () => setState(() {
                              selectedIndex = 2;
                            }),
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
