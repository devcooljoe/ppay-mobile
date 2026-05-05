import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/custom_date_picker.dart';

class FilterTransactionsBottomsheet extends HookConsumerWidget {
  const FilterTransactionsBottomsheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateController = useTextEditingController();

    return FractionallySizedBox(
      heightFactor: 0.920,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Filter By',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  30.verticalSpace,
                  Text(
                    'Crypto',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  4.verticalSpace,
                  SizedBox(
                    height: 56.h,
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 15.h,
                        ),
                        hintText: 'Enter Crypto',
                        hintStyle: TextStyle(
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          color: PPaymobileColors.svgIconColor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.r),
                          borderSide: BorderSide(
                            color: PPaymobileColors.textfiedBorder,
                            width: 1.w,
                          ),
                        ),
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
                  33.verticalSpace,
                  Text(
                    'Price Range',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  16.verticalSpace,
                  SizedBox(
                    height: 25.h,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/range.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  13.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '₦5,000',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '₦300,000',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  33.verticalSpace,
                  Text(
                    'Transaction Date',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  22.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'From',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          4.verticalSpace,
                          SizedBox(
                            height: 50.h,
                            width: 158.w,
                            child: TextFormField(
                              controller: dateController,
                              readOnly: true,
                              onTap: () async {
                                final selectedDate = await showDialog<DateTime>(
                                  context: context,
                                  builder: (_) =>
                                      const CustomDatePickerDialog(),
                                );
                                if (selectedDate != null) {
                                  dateController.text =
                                      "${selectedDate.day.toString().padLeft(2, '0')}/"
                                      "${selectedDate.month.toString().padLeft(2, '0')}/"
                                      "${selectedDate.year}";
                                }
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: 12.h,
                                ),
                                hintText: '09/11/2009',
                                hintStyle: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(6.0).r,
                                  child: SizedBox(
                                    height: 18.w,
                                    width: 18.w,
                                    child: SvgPicture.asset(
                                      'assets/icon/calendar2.svg',
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                ),
                                prefixIconConstraints: BoxConstraints(
                                  minWidth: 10.w,
                                  minHeight: 10.h,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.r),
                                  borderSide: BorderSide(
                                    color: PPaymobileColors.textfiedBorder,
                                    width: 1.w,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'To',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          4.verticalSpace,
                          SizedBox(
                            height: 50.h,
                            width: 158.w,
                            child: TextFormField(
                              controller: dateController,
                              readOnly: true,
                              onTap: () async {
                                final selectedDate = await showDialog<DateTime>(
                                  context: context,
                                  builder: (_) =>
                                      const CustomDatePickerDialog(),
                                );
                                if (selectedDate != null) {
                                  dateController.text =
                                      "${selectedDate.day.toString().padLeft(2, '0')}/"
                                      "${selectedDate.month.toString().padLeft(2, '0')}/"
                                      "${selectedDate.year}";
                                }
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: 12.h,
                                ),
                                hintText: '09/11/2009',
                                hintStyle: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(6.0).r,
                                  child: SizedBox(
                                    height: 18.w,
                                    width: 18.w,
                                    child: SvgPicture.asset(
                                      'assets/icon/calendar2.svg',
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                ),
                                prefixIconConstraints: BoxConstraints(
                                  minWidth: 10.w,
                                  minHeight: 10.h,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.r),
                                  borderSide: BorderSide(
                                    color: PPaymobileColors.textfiedBorder,
                                    width: 1.w,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  33.verticalSpace,
                  Text(
                    'Transaction Status',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  24.verticalSpace,
                  Wrap(
                    spacing: 37.w,
                    runSpacing: 24.h,
                    children: [
                      _status(
                        'All',
                        'assets/icon/picker.svg',
                        PPaymobileColors.buttonColor,
                      ),
                      _status(
                        'Sucessful',
                        'assets/icon/non_picker.svg',
                        Colors.black,
                      ),
                      _status(
                        'Failed',
                        'assets/icon/non_picker.svg',
                        Colors.black,
                      ),
                      _status(
                        'Pending',
                        'assets/icon/non_picker.svg',
                        Colors.black,
                      ),
                    ],
                  ),
                  50.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 184.5.w,
                        height: 50.h,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                PPaymobileColors.buttonColorandText,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(42),
                            ),
                            elevation: 0,
                          ),
                          onPressed: () {},
                          child: Text(
                            'Apply',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 184.5.w,
                        height: 50.h,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: PPaymobileColors.textfiedBorder,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(42),
                            ),
                            elevation: 0,
                          ),
                          onPressed: () {},
                          child: Text(
                            'Reset',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              color: Colors.black,
                            ),
                          ),
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

Widget _status(String text, String selected, Color textColor) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SvgPicture.asset(
        selected,
        height: 24.w,
        width: 24.w,
        fit: BoxFit.contain,
      ),
      12.horizontalSpace,
      Text(
        text,
        style: TextStyle(
          fontFamily: 'InstrumentSans',
          color: textColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}
