import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/shared/utils/date_utils.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';
import 'package:table_calendar/table_calendar.dart';

class DateBottomsheet extends HookConsumerWidget {
  const DateBottomsheet({super.key});

  static final _firstDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  static final _lastDay = DateTime(DateTime.now().year + 3, 12, 31);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusedDay = useState(_firstDay);
    final selectedDay = useState<DateTime?>(null);
    final showPicker = useState(false);
    final pickerYear = useState(_firstDay.year);
    final pickerMonth = useState(_firstDay.month);

    // Clamp focusedDay so it never goes before firstDay
    DateTime clampFocused(DateTime d) {
      final clamped = DateTime(d.year, d.month, 1);
      final firstMonth = DateTime(_firstDay.year, _firstDay.month, 1);
      return clamped.isBefore(firstMonth) ? _firstDay : d;
    }

    return Container(
      decoration: BoxDecoration(
        color: PPaymobileColors.mainScreenBackground,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          12.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Select Date',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                  color: Colors.black,
                ),
              ),
              TouchOpacity(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.close, size: 22.sp, color: Colors.black54),
              ),
            ],
          ),
          12.verticalSpace,
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10.h),
            decoration: BoxDecoration(
              color: PPaymobileColors.anotherContainerbgColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Center(
              child: Text(
                selectedDay.value == null
                    ? 'No date selected'
                    : _formatDisplay(selectedDay.value!),
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          12.verticalSpace,
          // Month/Year header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TouchOpacity(
                onTap: () {
                  final prev = DateTime(focusedDay.value.year, focusedDay.value.month - 1);
                  final firstMonth = DateTime(_firstDay.year, _firstDay.month, 1);
                  if (!prev.isBefore(firstMonth)) {
                    focusedDay.value = prev;
                  }
                },
                child: SizedBox(
                  height: 24.h,
                  width: 24.w,
                  child: SvgPicture.asset('assets/icon/arrow_back_black.svg', fit: BoxFit.contain),
                ),
              ),
              TouchOpacity(
                onTap: () {
                  pickerYear.value = focusedDay.value.year;
                  pickerMonth.value = focusedDay.value.month;
                  showPicker.value = !showPicker.value;
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${monthName(focusedDay.value.month)} ${focusedDay.value.year}',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
                      ),
                    ),
                    4.horizontalSpace,
                    Icon(
                      showPicker.value ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                      size: 18.sp,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              TouchOpacity(
                onTap: () {
                  focusedDay.value = DateTime(focusedDay.value.year, focusedDay.value.month + 1);
                },
                child: SizedBox(
                  height: 24.h,
                  width: 24.w,
                  child: SvgPicture.asset('assets/icon/arrow_forward.svg', fit: BoxFit.contain),
                ),
              ),
            ],
          ),
          8.verticalSpace,
          if (showPicker.value)
            _MonthYearPicker(
              selectedYear: pickerYear.value,
              selectedMonth: pickerMonth.value,
              minYear: _firstDay.year,
              onChanged: (y, m) {
                pickerYear.value = y;
                pickerMonth.value = m;
              },
              onConfirm: () {
                final candidate = DateTime(pickerYear.value, pickerMonth.value);
                focusedDay.value = clampFocused(candidate);
                showPicker.value = false;
              },
            )
          else
            TableCalendar(
              focusedDay: focusedDay.value,
              firstDay: _firstDay,
              lastDay: _lastDay,
              headerVisible: false,
              rowHeight: 40.h,
              daysOfWeekHeight: 32.h,
              calendarStyle: CalendarStyle(
                cellPadding: EdgeInsets.zero,
                cellMargin: EdgeInsets.zero,
                outsideDaysVisible: false,
                defaultTextStyle: TextStyle(
                  fontFamily: 'InstrumentSans',
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                  color: Colors.black,
                ),
                weekendTextStyle: TextStyle(
                  fontFamily: 'InstrumentSans',
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                  color: Colors.black,
                ),
                disabledTextStyle: TextStyle(
                  fontFamily: 'InstrumentSans',
                  fontSize: 13.sp,
                  color: Colors.grey.shade400,
                ),
                todayTextStyle: TextStyle(
                  fontFamily: 'InstrumentSans',
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                  color: Colors.black,
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: PPaymobileColors.buttonColor, width: 1.w),
                  shape: BoxShape.circle,
                ),
                selectedTextStyle: TextStyle(
                  fontFamily: 'InstrumentSans',
                  fontWeight: FontWeight.w600,
                  fontSize: 13.sp,
                  color: PPaymobileColors.mainScreenBackground,
                ),
                selectedDecoration: BoxDecoration(
                  color: PPaymobileColors.buttonColor,
                  shape: BoxShape.circle,
                ),
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: TextStyle(
                  fontFamily: 'InstrumentSans',
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade500,
                ),
                weekendStyle: TextStyle(
                  fontFamily: 'InstrumentSans',
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade500,
                ),
              ),
              selectedDayPredicate: (day) => isSameDay(day, selectedDay.value),
              onDaySelected: (selected, focused) {
                selectedDay.value = selected;
                focusedDay.value = focused;
              },
              onPageChanged: (focused) {
                focusedDay.value = clampFocused(focused);
              },
            ),
          12.verticalSpace,
          TouchOpacity(
            onTap: selectedDay.value == null
                ? null
                : () => Navigator.pop(context, selectedDay.value),
            child: Container(
              height: 48.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(65).r,
                color: selectedDay.value == null
                    ? PPaymobileColors.navContainerbgColor.withValues(alpha: 0.5)
                    : PPaymobileColors.navContainerbgColor,
              ),
              child: Center(
                child: Text(
                  'Select',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: PPaymobileColors.mainScreenBackground,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 16.h),
        ],
      ),
    );
  }

  String _formatDisplay(DateTime d) {
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return '${days[d.weekday - 1]}, ${d.day} ${months[d.month - 1]} ${d.year}';
  }
}

class _MonthYearPicker extends StatelessWidget {
  final int selectedYear;
  final int selectedMonth;
  final int minYear;
  final void Function(int year, int month) onChanged;
  final VoidCallback onConfirm;

  const _MonthYearPicker({
    required this.selectedYear,
    required this.selectedMonth,
    required this.minYear,
    required this.onChanged,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    const monthLabels = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    final years = List.generate(4, (i) => minYear + i);

    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: PPaymobileColors.anotherContainerbgColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: years.map((y) {
              final sel = y == selectedYear;
              return GestureDetector(
                onTap: () => onChanged(y, selectedMonth),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: sel ? PPaymobileColors.buttonColor : Colors.transparent,
                    borderRadius: BorderRadius.circular(20.r),
                    border: sel ? null : Border.all(color: Colors.grey.shade300),
                  ),
                  child: Text(
                    '$y',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: sel ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          10.verticalSpace,
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            alignment: WrapAlignment.center,
            children: List.generate(12, (i) {
              final m = i + 1;
              final sel = m == selectedMonth;
              return GestureDetector(
                onTap: () => onChanged(selectedYear, m),
                child: Container(
                  width: 52.w,
                  padding: EdgeInsets.symmetric(vertical: 7.h),
                  decoration: BoxDecoration(
                    color: sel ? PPaymobileColors.buttonColor : Colors.transparent,
                    borderRadius: BorderRadius.circular(20.r),
                    border: sel ? null : Border.all(color: Colors.grey.shade300),
                  ),
                  child: Center(
                    child: Text(
                      monthLabels[i],
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: sel ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
          10.verticalSpace,
          TouchOpacity(
            onTap: onConfirm,
            child: Container(
              height: 36.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: PPaymobileColors.buttonColor,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Center(
                child: Text(
                  'Done',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
