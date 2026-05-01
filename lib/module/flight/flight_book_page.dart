import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/module/flight/flight_card_page.dart';
import 'package:ppay_mobile/module/virtual_card/search_card_page.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class FlightBookPage extends HookConsumerWidget {
  const FlightBookPage({super.key});

}

  final scrollController = ScrollController();

  bool isOpaque = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.offset >= 30) {
        isOpaque.value = true;
      } else {
        isOpaque.value = false;
      }
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: PPaymobileColors.buttonColorandText,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        animateColor: true,
        backgroundColor: isOpaque
            ? PPaymobileColors.buttonColorandText
            : Colors.transparent,
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
          child: TouchOpacity(
            onTap: () => context.router.pop(),
            child: SizedBox(
              height: 24.w,
              width: 24.w,
              child: SvgPicture.asset(
                'assets/icon/arrow_back_white.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Container(
              height: 34.w,
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
                      height: 24.w,
                      width: 24.w,
                    ),
                  ),
                  Positioned(
                    top: 5.h,
                    right: 5.w,
                    child: SvgPicture.asset(
                      'assets/icon/newnotif.svg',
                      height: 9.w,
                      width: 9.w,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: ScreenUtil().screenWidth,
              height: ScreenUtil().screenHeight * 0.5,
              color: Colors.white,
            ),
          ),
          SingleChildScrollView(
            controller: scrollController,
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 50.h),
                      width: double.infinity,
                      height: ScreenUtil().screenHeight * 0.35,
                      color: PPaymobileColors.buttonColorandText,
                      child: Image.asset(
                        'assets/images/flight_bg.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: ScreenUtil().screenHeight * 0.65,
                      color: Colors.white,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    160.verticalSpace,
                    Center(
                      child: SizedBox(
                        height: 480.h,
                        width: 400.w,
                        child: SearchCardPage(),
                      ),
                    ),
                    45.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        'Upcoming Flights',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'InstrumentSans',
                        ),
                      ),
                    ),
                    20.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: FlightCardPage(),
                    ),
                    20.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: FlightCardPage(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
              ),
      ),
    );  }
