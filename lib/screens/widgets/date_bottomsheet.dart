import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';
import 'package:ppay_mobile/utils/date_utils.dart';
import 'package:table_calendar/table_calendar.dart';

class DateBottomsheet extends StatefulWidget {
  const DateBottomsheet({super.key});

  @override
  State<DateBottomsheet> createState() => _DateBottomsheetState();
}

class _DateBottomsheetState extends State<DateBottomsheet> {
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.790,
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
              child: ListView(
                children: [
                  Text(
                    'Select Date',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                      color: Colors.black,
                    ),
                  ),
                  20.verticalSpace,
                  Container(
                    height: 82.h,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    color: PPaymobileColors.anotherContainerbgColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Departure Date',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        10.verticalSpace,
                        Text(
                          selectedDay == null
                              ? 'Select date'
                              : "Wed ${selectedDay!.day}/${selectedDay!.month}/${selectedDay!.year}",
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  24.verticalSpace,
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _Header(
                        focusedDay: focusedDay,
                        onPrev: () => setState(() {
                          focusedDay = DateTime(
                            focusedDay.year,
                            focusedDay.month - 1,
                          );
                        }),
                        onNext: () => setState(() {
                          focusedDay = DateTime(
                            focusedDay.year,
                            focusedDay.month + 1,
                          );
                        }),
                      ),
                      22.verticalSpace,
                      TableCalendar(
                        focusedDay: focusedDay,
                        rowHeight: 66.h,
                        daysOfWeekHeight: 44.h,
                        calendarStyle: CalendarStyle(
                          cellPadding: EdgeInsets.zero,
                          cellMargin: EdgeInsets.zero,
                          defaultTextStyle: TextStyle(
                            fontFamily: 'InstrumentSans',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: Colors.black,
                          ),
                          todayTextStyle: TextStyle(
                            fontFamily: 'InstrumentSans',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: Colors.black,
                          ),
                          todayDecoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              color: PPaymobileColors.buttonColor,
                              width: 1.w,
                            ),
                          ),
                          selectedTextStyle: TextStyle(
                            fontFamily: 'InstrumentSans',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: PPaymobileColors.mainScreenBackground,
                          ),
                          selectedDecoration: BoxDecoration(
                            color: PPaymobileColors.buttonColor,
                          ),
                        ),
                        firstDay: DateTime(2000),
                        lastDay: DateTime(2100),
                        headerVisible: false,
                        selectedDayPredicate: (day) =>
                            isSameDay(day, selectedDay),
                        onDaySelected: (selected, focused) {
                          setState(() {
                            selectedDay = selected;
                            focusedDay = focused;
                          });
                        },
                      ),
                      24.verticalSpace,
                      TouchOpacity(
                        onTap: selectedDay == null
                            ? null
                            : () {
                                Navigator.pop(context, selectedDay);
                              },
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
                              'Select',
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
          ),
        ],
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //previous month
        TouchOpacity(
          onTap: onPrev,
          child: SizedBox(
            height: 24.h,
            width: 12.w,
            child: SvgPicture.asset(
              'assets/icon/arrow_back_black.svg',
              fit: BoxFit.contain,
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              "${monthName(focusedDay.month)} - ${focusedDay.year}",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                fontFamily: 'InstrumentSans',
                color: Colors.black,
              ),
            ),
          ),
        ),
        // next month
        TouchOpacity(
          onTap: isAtCurrentMonth ? null : onNext,
          child: SizedBox(
            height: 24.h,
            width: 12.w,
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
