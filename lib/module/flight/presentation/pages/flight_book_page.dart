import 'package:flutter/material.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/module/flight/domain/entities/flight_entity.dart';
import 'package:ppay_mobile/module/flight/presentation/providers/flight_providers.dart';
import 'package:ppay_mobile/module/flight/presentation/utils/flight_format_utils.dart';
import 'package:ppay_mobile/shared/widgets/app_image.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/module/virtual_card/presentation/pages/search_card_page.dart';

@RoutePage()
class FlightBookPage extends HookConsumerWidget {
  const FlightBookPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final isOpaque = useState(false);
    final bookingsAsync = ref.watch(getFlightBookingsProvider);

    useEffect(() {
      void listener() {
        isOpaque.value = scrollController.offset >= 30;
      }
      scrollController.addListener(listener);
      return () => scrollController.removeListener(listener);
    }, [scrollController]);

    useEffect(() {
      Future.microtask(() => ref.read(getFlightBookingsProvider.notifier).call(status: 'active'));
      return null;
    }, []);

    return Scaffold(
      backgroundColor: PPaymobileColors.buttonColorandText,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        animateColor: true,
        backgroundColor: isOpaque.value
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
            onTap: () => Navigator.pop(context),
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
            child: TouchOpacity(
              onTap: () => context.router.push(const BookedFlightsRoute()),
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
                  ],
                ),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Upcoming Flights',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'InstrumentSans',
                            ),
                          ),
                          TouchOpacity(
                            onTap: () => context.router.push(const BookedFlightsRoute()),
                            child: Text(
                              'View All',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'InstrumentSans',
                                color: PPaymobileColors.buttonColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    20.verticalSpace,
                    bookingsAsync.when(
                      loading: () => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          children: List.generate(2, (_) => Padding(
                            padding: EdgeInsets.only(bottom: 16.h),
                            child: Container(
                              height: 120.h,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(13.r),
                              ),
                            ),
                          )),
                        ),
                      ),
                      error: (_, __) => const SizedBox.shrink(),
                      data: (bookings) {
                        if (bookings == null || bookings.isEmpty) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Text(
                              'No upcoming flights',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: PPaymobileColors.svgIconColor,
                                fontSize: 14.sp,
                              ),
                            ),
                          );
                        }
                        return Column(
                          children: bookings.take(3).map((booking) => Padding(
                            padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 16.h),
                            child: _UpcomingFlightCard(booking: booking),
                          )).toList(),
                        );
                      },
                    ),
                    20.verticalSpace,
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _UpcomingFlightCard extends ConsumerWidget {
  final FlightBookingEntity booking;
  const _UpcomingFlightCard({required this.booking});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TouchOpacity(
      onTap: () => context.router.push(BoardingPassRoute(bookingReference: booking.bookingReference)),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: PPaymobileColors.upcomingflightsbgColor,
          borderRadius: BorderRadius.circular(13.r),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Container(
                    height: 47.w, width: 47.w,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(100.r)),
                    clipBehavior: Clip.hardEdge,
                    child: AppImage(imageUrl: booking.airlineLogo, width: 47.w, height: 47.w, fit: BoxFit.cover),
                  ),
                  8.horizontalSpace,
                  Text(booking.airline.isNotEmpty ? booking.airline : 'Airline', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500)),
                ]),
                if (booking.duration > 0)
                  Row(children: [
                    SizedBox(height: 20.w, width: 20.w, child: SvgPicture.asset('assets/icon/time.svg', fit: BoxFit.contain)),
                    5.horizontalSpace,
                    Text(FlightFormatUtils.formatDuration(booking.duration), style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
                  ]),
              ],
            ),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  booking.departureTime.isNotEmpty ? FlightFormatUtils.formatTime(booking.departureTime) : '--:--',
                  style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 24.sp, fontWeight: FontWeight.w500),
                ),
                Text(
                  booking.arrivalTime.isNotEmpty ? FlightFormatUtils.formatTime(booking.arrivalTime) : '--:--',
                  style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 24.sp, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            17.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  SizedBox(height: 24.w, width: 24.w, child: SvgPicture.asset('assets/icon/takeoff_2.svg', fit: BoxFit.contain)),
                  15.horizontalSpace,
                  Text(booking.origin.isNotEmpty ? booking.origin : '--', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
                ]),
                Row(children: [
                  SizedBox(height: 24.w, width: 24.w, child: SvgPicture.asset('assets/icon/touchdown.svg', fit: BoxFit.contain)),
                  15.horizontalSpace,
                  Text(booking.destination.isNotEmpty ? booking.destination : '--', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
                ]),
              ],
            ),
            28.verticalSpace,
            Divider(color: PPaymobileColors.buttonColor, height: 1.h),
            17.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('₦${booking.totalAmount}', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.buttonColor, fontSize: 18.sp, fontWeight: FontWeight.w500)),
                  Text(booking.bookingReference, style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 11.sp, fontWeight: FontWeight.w500)),
                ]),
                Container(
                  height: 46.h, width: 121.w,
                  padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(55).r, color: PPaymobileColors.buttonColorandText),
                  child: Center(child: Text('View Pass', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.mainScreenBackground, fontSize: 14.sp, fontWeight: FontWeight.w600))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
