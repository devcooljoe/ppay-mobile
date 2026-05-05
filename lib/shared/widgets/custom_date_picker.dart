import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/utils/date_utils.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomDatePickerDialog extends HookConsumerWidget {
  const CustomDatePickerDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusedDay = useState(DateTime.now());
    final selectedDay = useState<DateTime?>(null);
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10).r),
      backgroundColor: PPaymobileColors.mainScreenBackground,
      child: Padding(
        padding: const EdgeInsets.all(16).r,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _Header(
              focusedDay: focusedDay.value,
              onPrev: () => focusedDay.value = DateTime(focusedDay.value.year, focusedDay.value.month - 1),
              onNext: () => focusedDay.value = DateTime(focusedDay.value.year, focusedDay.value.month + 1),
            ),
            25.verticalSpace,
            TableCalendar(
              focusedDay: focusedDay.value,
              firstDay: DateTime(2000),
              lastDay: DateTime(2100),
              headerVisible: false,
              selectedDayPredicate: (day) => isSameDay(day, selectedDay.value),
              onDaySelected: (selected, focused) {
                selectedDay.value = selected;
                focusedDay.value = focused;
              },
            ),
            24.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(5).r,
                  onTap: () {},
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
                          height: 14.w,
                          width: 14.w,
                          child: SvgPicture.asset(
                            'assets/icon/calendar.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                        8.horizontalSpace,
                        Text(
                          selectedDay.value == null
                              ? 'Select date'
                              : "${selectedDay.value!.day}/${selectedDay.value!.month}/${selectedDay.value!.year}",
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
                  onTap: selectedDay.value == null
                      ? null
                      : () {
                          Navigator.pop(context, selectedDay.value);
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
