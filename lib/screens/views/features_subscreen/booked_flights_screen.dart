import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/active_flight_screen.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/past_flight_screens.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';

class BookedFlightsScreen extends StatefulWidget {
  const BookedFlightsScreen({super.key});

  @override
  State<BookedFlightsScreen> createState() => _BookedFlightsScreenState();
}

class _BookedFlightsScreenState extends State<BookedFlightsScreen> {
  @override
  Widget build(BuildContext context) {
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
        body: TabBarView(children: [ActiveFlightScreen(), PastFlightScreens()]),
      ),
    );
  }
}
