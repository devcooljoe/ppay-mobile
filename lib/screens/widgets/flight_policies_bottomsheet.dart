import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/baggage_screen.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/booking_policies_screen.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/refund_policy_screen.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class FlightPoliciesBottomsheet extends StatefulWidget {
  const FlightPoliciesBottomsheet({super.key});

  @override
  State<FlightPoliciesBottomsheet> createState() =>
      _FlightPoliciesBottomsheetState();
}

class _FlightPoliciesBottomsheetState extends State<FlightPoliciesBottomsheet> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.640,
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
              child: DefaultTabController(
                length: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Flight Policies',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    PreferredSize(
                      preferredSize: Size.fromHeight(20.h),
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
                          fontSize: 13.sp,
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
                          Tab(text: 'Booking Policies'),
                          Tab(text: 'Baggage'),
                          Tab(text: 'Refund Policies'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          BookingPoliciesScreen(),
                          BaggageScreen(),
                          RefundPolicyScreen(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
