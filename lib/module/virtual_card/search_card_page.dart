import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/module/flight/multi_trip_page.dart';
import 'package:ppay_mobile/module/flight/one_way_trip_page.dart';
import 'package:ppay_mobile/module/flight/round_way_trip_page.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';

@RoutePage()
class SearchCardPage extends HookConsumerWidget {
  const SearchCardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 3,
      child: Container(
        height: 436.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
        decoration: BoxDecoration(
          color: PPaymobileColors.mainScreenBackground,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            width: 1.w,
            color: PPaymobileColors.textfiedBorder,
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 5.4.r,
              color: Color(0xff919191).withValues(alpha: 0.25),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PreferredSize(
              preferredSize: Size.fromHeight(23.h),
              child: TabBar(
                isScrollable: false,
                dividerColor: PPaymobileColors.deepBackgroundColor,
                // tabAlignment: TabAlignment.start,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: PPaymobileColors.buttonColor,
                indicatorWeight: 2,
                labelPadding: EdgeInsets.symmetric(horizontal: 12),
                indicatorPadding: EdgeInsets.zero,
                labelStyle: TextStyle(
                  fontFamily: 'InstrumentSans',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: PPaymobileColors.buttonColor,
                ),
                unselectedLabelStyle: TextStyle(
                  fontFamily: 'InstrumentSans',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                unselectedLabelColor: Colors.black,
                tabs: const [
                  Tab(text: 'One Way Trip'),
                  Tab(text: 'Round Trip'),
                  Tab(text: 'Multi Trip'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  OneWayTripPage(),
                  RoundWayTripPage(),
                  MultiTripPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
