import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/option_picker.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';

class SortBottomsheet extends StatefulWidget {
  const SortBottomsheet({super.key});

  @override
  State<SortBottomsheet> createState() => _SortBottomsheetState();
}

class _SortBottomsheetState extends State<SortBottomsheet> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.580,
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
                    'Sort',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 24.sp,
                      color: Colors.black,
                    ),
                  ),
                  20.verticalSpace,
                  SizedBox(
                    height: 26.h,
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recommended',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: Colors.black,
                          ),
                        ),
                        OptionPicker(
                          selected: selectedIndex == 1,
                          onSelected: () => setState(() {
                            selectedIndex = 1;
                          }),
                        ),
                      ],
                    ),
                  ),
                  30.verticalSpace,
                  SizedBox(
                    height: 26.h,
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Lowest Price',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: Colors.black,
                          ),
                        ),
                        OptionPicker(
                          selected: selectedIndex == 2,
                          onSelected: () => setState(() {
                            selectedIndex = 2;
                          }),
                        ),
                      ],
                    ),
                  ),
                  30.verticalSpace,
                  SizedBox(
                    height: 26.h,
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Earliest Departure',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: Colors.black,
                          ),
                        ),
                        OptionPicker(
                          selected: selectedIndex == 3,
                          onSelected: () => setState(() {
                            selectedIndex = 3;
                          }),
                        ),
                      ],
                    ),
                  ),
                  30.verticalSpace,
                  SizedBox(
                    height: 26.h,
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Earliest Arrival',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: Colors.black,
                          ),
                        ),
                        OptionPicker(
                          selected: selectedIndex == 4,
                          onSelected: () => setState(() {
                            selectedIndex = 4;
                          }),
                        ),
                      ],
                    ),
                  ),
                  30.verticalSpace,
                  SizedBox(
                    height: 26.h,
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Latest Departure',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: Colors.black,
                          ),
                        ),
                        OptionPicker(
                          selected: selectedIndex == 5,
                          onSelected: () => setState(() {
                            selectedIndex = 5;
                          }),
                        ),
                      ],
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
