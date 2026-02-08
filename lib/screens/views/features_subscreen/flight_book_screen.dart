import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/flight_card_screen.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/search_card_screen.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class FlightBookScreen extends StatefulWidget {
  const FlightBookScreen({super.key});

  @override
  State<FlightBookScreen> createState() => _FlightBookScreenState();
}

class _FlightBookScreenState extends State<FlightBookScreen> {
  final ScrollController _scrollController = ScrollController();
  double _scrollOffset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _scrollOffset = _scrollController.offset;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final flexibleHeight = 383.h;
    final searchCardTop = 176.h;

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      body: Stack(
        children: [
          // Scrollable content
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              // SliverAppBar with background image
              SliverAppBar(
                pinned: true,
                floating: true,
                expandedHeight: flexibleHeight,
                backgroundColor: PPaymobileColors.backgroundColor,
                toolbarHeight: 56,
                leadingWidth: 56.w,
                centerTitle: true,
                title: Text(
                  'Flight',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.mainScreenBackground,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                leading: Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: SvgPicture.asset(
                      'assets/icon/arrow_back_white.svg',
                      height: 24.h,
                      width: 24.w,
                    ),
                  ),
                ),
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: Container(
                      height: 34.h,
                      width: 34.w,
                      decoration: BoxDecoration(
                        color: PPaymobileColors.flightbgColor,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Stack(
                        children: [
                          Center(
                            child: SvgPicture.asset(
                              'assets/icon/takeoff.svg',
                              height: 24.h,
                              width: 24.w,
                            ),
                          ),
                          Positioned(
                            top: 5.h,
                            right: 5.w,
                            child: SvgPicture.asset(
                              'assets/icon/newnotif.svg',
                              height: 9.h,
                              width: 9.w,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/flight_bg.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              // Spacer so content doesn’t hide under search card
              SliverToBoxAdapter(
                child: SizedBox(height: searchCardTop + 100.h),
              ),
              // Main content
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Upcoming Flights',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      20.verticalSpace,
                      FlightCardScreen(),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // SearchCardScreen overlapping the AppBar/flexible space
          Positioned(
            top: searchCardTop - _scrollOffset, // moves up as you scroll
            left: 20.w,
            right: 20.w,
            child: Opacity(
              opacity: ((_scrollOffset < searchCardTop)
                  ? 1 - (_scrollOffset / searchCardTop)
                  : 0), // disappears when fully scrolled
              child: SearchCardScreen(),
            ),
          ),
        ],
      ),
    );
  }
}
