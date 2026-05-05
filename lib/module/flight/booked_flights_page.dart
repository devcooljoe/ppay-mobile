import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/module/flight/active_flight_page.dart';
import 'package:ppay_mobile/module/flight/past_flight_screens.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class BookedFlightsPage extends HookConsumerWidget {
  const BookedFlightsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: PPaymobileColors.mainScreenBackground,
        appBar: AppBar(
          animateColor: true,
          backgroundColor: PPaymobileColors.mainScreenBackground,
          centerTitle: true,
          title: Text(
            'Booked Flights',
            style: TextStyle(
              fontFamily: 'InstrumentSans',
              color: Colors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          leading: Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: TouchOpacity(
              onTap: () => Navigator.pop(context),
              child: SizedBox(
                height: 24.w,
                width: 24.w,
                child: SvgPicture.asset(
                  'assets/icon/arrow_back.svg',
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(100.h),
            child: Column(
              children: [
                40.verticalSpace,
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(6).r),
                  child: Container(
                    height: 44.h,
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6).r,
                      color: PPaymobileColors.tabInactiveGrey,
                    ),
                    child: TabBar(
                      dividerColor: Colors.transparent,
                      labelStyle: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: PPaymobileColors.mainScreenBackground,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      unselectedLabelStyle: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        color: PPaymobileColors.tabColor,
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabs: [
                        Tab(text: 'Active Flight'),
                        Tab(text: 'Past Flight'),
                      ],
                    ),
                  ),
                ),
                16.verticalSpace,
              ],
            ),
          ),
        ),
        body: TabBarView(children: [ActiveFlightPage(), PastFlightScreens()]),
      ),
    );
  }
}
