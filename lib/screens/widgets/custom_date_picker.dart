import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/utils/date_utils.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomDatePickerDialog extends StatefulWidget {
  const CustomDatePickerDialog({super.key});

  @override
  State<CustomDatePickerDialog> createState() => _CustomDatePickerDialogState();
}

class _CustomDatePickerDialogState extends State<CustomDatePickerDialog> {
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10).r),
      backgroundColor: PPaymobileColors.mainScreenBackground,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _Header(
              focusedDay: focusedDay,
              onPrev: () => setState(() {
                focusedDay = DateTime(focusedDay.year, focusedDay.month - 1);
              }),
              onNext: () => setState(() {
                focusedDay = DateTime(focusedDay.year, focusedDay.month + 1);
              }),
            ),
            25.verticalSpace,
            TableCalendar(
              focusedDay: focusedDay,
              firstDay: DateTime(2000),
              lastDay: DateTime(2100),
              headerVisible: false,
              selectedDayPredicate: (day) => isSameDay(day, selectedDay),
              onDaySelected: (selected, focused) {
                setState(() {
                  selectedDay = selected;
                  focusedDay = focused;
                });
              },
            ),
            24.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(5).r,
                  onTap: () {
                    // Optional: you can handle tap here if needed
                  },
                  child: Container(
                    height: 39.h,
                    width: 126.w,
                    padding: EdgeInsets.all(10).r,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5).r,
                      border: Border.all(
                        width: 1.w,
                        color: PPaymobileColors.textfiedBorder,
                      ),
                      color: PPaymobileColors.mainScreenBackground,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 14.h,
                          width: 14.w,
                          child: SvgPicture.asset(
                            'assets/icon/calendar.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                        8.horizontalSpace,
                        Text(
                          selectedDay == null
                              ? 'Select date'
                              : "${selectedDay!.day}/${selectedDay!.month}/${selectedDay!.year}",
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: selectedDay == null
                      ? null
                      : () {
                          Navigator.pop(context, selectedDay);
                        },
                  child: Container(
                    height: 37.h,
                    width: 128.w,
                    padding: EdgeInsets.all(10).r,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5).r,
                      color: PPaymobileColors.backgroundColor,
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
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final DateTime focusedDay;
  final VoidCallback onPrev;
  final VoidCallback onNext;

  const _Header({
    required this.focusedDay,
    required this.onPrev,
    required this.onNext,
  });

  bool get isAtCurrentMonth {
    final now = DateTime.now();
    return focusedDay.year == now.year && focusedDay.month == now.month;
  }

  @override
  Widget build(BuildContext context) {
    final enabledColor = PPaymobileColors.mainScreenBackground;
    final disabledColor = PPaymobileColors.deepBackgroundColor;

    return Row(
      children: [
        //previous month
        GestureDetector(
          onTap: onPrev,
          child: Container(
            height: 24.h,
            width: 26.w,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: enabledColor,
              border: Border.all(
                width: 1.w,
                color: PPaymobileColors.textfiedBorder,
              ),
              borderRadius: BorderRadius.circular(4).r,
            ),
            child: SvgPicture.asset(
              'assets/icon/arrow_back_black.svg',
              fit: BoxFit.contain,
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              "${monthName(focusedDay.month)} ${focusedDay.year}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: 'Gilroy',
                color: Colors.black,
              ),
            ),
          ),
        ),

        // next month
        GestureDetector(
          onTap: isAtCurrentMonth ? null : onNext,
          child: Container(
            height: 24.h,
            width: 26.w,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: isAtCurrentMonth ? disabledColor : enabledColor,
              border: Border.all(
                width: 1.w,
                color: PPaymobileColors.textfiedBorder,
              ),
              borderRadius: BorderRadius.circular(4).r,
            ),
            child: SvgPicture.asset(
              'assets/icon/arrow_forward.svg',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
