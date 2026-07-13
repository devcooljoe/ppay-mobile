import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/shared/utils/date_utils.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:table_calendar/table_calendar.dart';

enum _PickerMode { calendar, year, month }

class CustomDatePickerDialog extends HookConsumerWidget {
  const CustomDatePickerDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusedDay = useState(DateTime.now());
    final selectedDay = useState<DateTime?>(null);
    final mode = useState(_PickerMode.calendar);

    // Year list: 1940 to current year
    final currentYear = DateTime.now().year;
    final years = List.generate(currentYear - 1939, (i) => currentYear - i);

    void switchToYear() => mode.value = _PickerMode.year;
    void switchToMonth() => mode.value = _PickerMode.month;
    void switchToCalendar() => mode.value = _PickerMode.calendar;

    Widget buildHeader() {
      final isCalendar = mode.value == _PickerMode.calendar;
      return Row(
        children: [
          if (isCalendar)
            GestureDetector(
              onTap: () => focusedDay.value = DateTime(
                focusedDay.value.year,
                focusedDay.value.month - 1,
              ),
              child: Container(
                height: 24.h,
                width: 26.w,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: PPaymobileColors.mainScreenBackground,
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
            )
          else
            GestureDetector(
              onTap: switchToCalendar,
              child: Container(
                height: 24.h,
                width: 26.w,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: PPaymobileColors.mainScreenBackground,
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
              child: GestureDetector(
                onTap: isCalendar ? switchToYear : null,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: isCalendar
                      ? BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: PPaymobileColors.anotherbuttonbgColor,
                        )
                      : null,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        mode.value == _PickerMode.year
                            ? 'Select Year'
                            : mode.value == _PickerMode.month
                                ? '${focusedDay.value.year}'
                                : '${monthName(focusedDay.value.month)} ${focusedDay.value.year}',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                        ),
                      ),
                      if (isCalendar) ...[
                        4.horizontalSpace,
                        Icon(
                          Icons.arrow_drop_down_rounded,
                          size: 20.sp,
                          color: PPaymobileColors.svgIconColor,
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (isCalendar)
            GestureDetector(
              onTap: () => focusedDay.value = DateTime(
                focusedDay.value.year,
                focusedDay.value.month + 1,
              ),
              child: Container(
                height: 24.h,
                width: 26.w,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: PPaymobileColors.mainScreenBackground,
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
            )
          else
            SizedBox(width: 26.w),
        ],
      );
    }

    Widget buildYearGrid() {
      return SizedBox(
        height: 220.h,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 1.8,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
          ),
          itemCount: years.length,
          itemBuilder: (context, index) {
            final year = years[index];
            final isSelected = year == focusedDay.value.year;
            return GestureDetector(
              onTap: () {
                focusedDay.value =
                    DateTime(year, focusedDay.value.month);
                switchToMonth();
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected
                      ? PPaymobileColors.backgroundColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Text(
                  '$year',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    fontSize: 13.sp,
                    fontWeight:
                        isSelected ? FontWeight.w600 : FontWeight.w400,
                    color: isSelected
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            );
          },
        ),
      );
    }

    Widget buildMonthGrid() {
      return SizedBox(
        height: 220.h,
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 2.2,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
          ),
          itemCount: 12,
          itemBuilder: (context, index) {
            final month = index + 1;
            final isSelected = month == focusedDay.value.month;
            return GestureDetector(
              onTap: () {
                focusedDay.value =
                    DateTime(focusedDay.value.year, month);
                switchToCalendar();
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected
                      ? PPaymobileColors.backgroundColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Text(
                  monthName(month).substring(0, 3),
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    fontSize: 14.sp,
                    fontWeight:
                        isSelected ? FontWeight.w600 : FontWeight.w400,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ),
            );
          },
        ),
      );
    }

    return Dialog(
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10).r),
      backgroundColor: PPaymobileColors.mainScreenBackground,
      child: Padding(
        padding: const EdgeInsets.all(16).r,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildHeader(),
            20.verticalSpace,
            if (mode.value == _PickerMode.calendar)
              TableCalendar(
                focusedDay: focusedDay.value,
                firstDay: DateTime(1940),
                lastDay: DateTime.now(),
                headerVisible: false,
                selectedDayPredicate: (day) =>
                    isSameDay(day, selectedDay.value),
                onDaySelected: (selected, focused) {
                  selectedDay.value = selected;
                  focusedDay.value = focused;
                },
                calendarStyle: CalendarStyle(
                  selectedDecoration: const BoxDecoration(
                    color: PPaymobileColors.backgroundColor,
                    shape: BoxShape.circle,
                  ),
                  todayDecoration: BoxDecoration(
                    color: PPaymobileColors.buttonColor.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  todayTextStyle: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'InstrumentSans',
                  ),
                ),
              )
            else if (mode.value == _PickerMode.year)
              buildYearGrid()
            else
              buildMonthGrid(),
            20.verticalSpace,
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
                              : '${selectedDay.value!.day.toString().padLeft(2, '0')}/${selectedDay.value!.month.toString().padLeft(2, '0')}/${selectedDay.value!.year}',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            fontSize: 12.sp,
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
                      : () => Navigator.pop(context, selectedDay.value),
                  child: Container(
                    height: 37.h,
                    width: 128.w,
                    padding: EdgeInsets.all(10).r,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5).r,
                      color: selectedDay.value == null
                          ? PPaymobileColors.buttonInactiveColor
                          : PPaymobileColors.backgroundColor,
                    ),
                    child: Center(
                      child: Text(
                        'Apply',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
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
