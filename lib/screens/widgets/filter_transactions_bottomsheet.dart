import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/custom_date_picker.dart';

class FilterTransactionsBottomsheet extends StatefulWidget {
  const FilterTransactionsBottomsheet({super.key});

  @override
  State<FilterTransactionsBottomsheet> createState() =>
      _FilterTransactionsBottomsheetState();
}

class _FilterTransactionsBottomsheetState
    extends State<FilterTransactionsBottomsheet> {
  bool isEnabled = false;
  final TextEditingController _dateController = TextEditingController();

  double _currentValue = 0;

  @override
  Widget build(BuildContext context) {
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
                    child: Slider(
                      padding: EdgeInsets.zero,
                      value: _currentValue,
                      activeColor: PPaymobileColors.buttonColor,
                      thumbColor: PPaymobileColors.buttonColor,
                      min: 0,
                      max: 30,
                      label: _currentValue.toString(),
                      inactiveColor: PPaymobileColors.deepBackgroundColor,
                      onChanged: (value) {
                        setState(() {
                          _currentValue = value;
                        });
                      },
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
                              controller: _dateController,
                              readOnly: true,
                              onTap: () async {
                                /// 👉 THIS is where the dialog is called
                                final selectedDate = await showDialog<DateTime>(
                                  context: context,
                                  builder: (_) =>
                                      const CustomDatePickerDialog(),
                                );
                                if (selectedDate != null) {
                                  _dateController.text =
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
                                    height: 18.h,
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
                              controller: _dateController,
                              readOnly: true,
                              onTap: () async {
                                /// 👉 THIS is where the dialog is called
                                final selectedDate = await showDialog<DateTime>(
                                  context: context,
                                  builder: (_) =>
                                      const CustomDatePickerDialog(),
                                );
                                if (selectedDate != null) {
                                  _dateController.text =
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
                                    height: 18.h,
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
                    spacing: 37.w, // horizontal space
                    runSpacing: 24.h, // vertical space between lines
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
                            backgroundColor: PPaymobileColors.backgroundColor,
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
        height: 24.h,
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
