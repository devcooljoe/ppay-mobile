import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/module/flight/domain/entities/flight_entity.dart';
import 'package:ppay_mobile/module/flight/presentation/providers/flight_providers.dart';
import 'package:ppay_mobile/module/flight/presentation/providers/flight_search_state.dart';
import 'package:ppay_mobile/module/flight/presentation/providers/selected_flight_provider.dart';
import 'package:ppay_mobile/module/flight/presentation/utils/flight_format_utils.dart';
import 'package:ppay_mobile/shared/widgets/app_image.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/empty_state.dart';
import 'package:ppay_mobile/shared/widgets/skeleton_loader.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class SearchResultPage extends HookConsumerWidget {
  const SearchResultPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchAsync = ref.watch(searchFlightsProvider);
    final searchState = ref.watch(flightSearchStateProvider);

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: AppBar(
        animateColor: true,
        backgroundColor: PPaymobileColors.mainScreenBackground,
        centerTitle: true,
        title: Text(
          'Search Result',
          style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w500),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: TouchOpacity(
            onTap: () => Navigator.pop(context),
            child: SizedBox(height: 24.w, width: 24.w, child: SvgPicture.asset('assets/icon/arrow_back.svg', fit: BoxFit.scaleDown)),
          ),
        ),
      ),
      body: SafeArea(
        child: searchAsync.when(
          loading: () => _buildSkeletons(),
          error: (e, _) => Center(
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(e.toString(), textAlign: TextAlign.center, style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 14.sp, color: PPaymobileColors.svgIconColor)),
                  24.verticalSpace,
                  TouchOpacity(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: 46.h,
                      width: 200.w,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(56).r, color: PPaymobileColors.buttonColorandText),
                      child: Center(child: Text('Go Back', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w600))),
                    ),
                  ),
                ],
              ),
            ),
          ),
          data: (flights) {
            if (flights == null || flights.isEmpty) {
              return EmptyState(imagePath: 'assets/images/flight_ticket.png', message: 'No flights found for your search');
            }
            return ListView(
              children: [
                38.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8).r, color: PPaymobileColors.anotheroptionbgColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(searchState.from, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w500)),
                                20.horizontalSpace,
                                SizedBox(height: 24.h, width: 24.h, child: SvgPicture.asset('assets/icon/arrow_forward_1.svg', fit: BoxFit.contain)),
                                20.horizontalSpace,
                                Text(searchState.to, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w500)),
                              ],
                            ),
                            8.verticalSpace,
                            Row(
                              children: [
                                Text(FlightFormatUtils.formatDate(searchState.departureDate), style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w400)),
                                8.horizontalSpace,
                                SizedBox(height: 7.h, width: 7.h, child: SvgPicture.asset('assets/icon/spacer.svg', fit: BoxFit.contain)),
                                8.horizontalSpace,
                                Text('${searchState.adults + searchState.children + searchState.infants} Seat(s)', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w400)),
                                8.horizontalSpace,
                                SizedBox(height: 7.h, width: 7.h, child: SvgPicture.asset('assets/icon/spacer.svg', fit: BoxFit.contain)),
                                8.horizontalSpace,
                                Text(ref.read(flightSearchStateProvider.notifier).cabinLabel, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w400)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                16.verticalSpace,
                Padding(
                  padding: EdgeInsets.only(left: 20.0.w),
                  child: Text(
                    'Found ${flights.length} available at best price',
                    style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w500),
                  ),
                ),
                16.verticalSpace,
                ...flights.map((flight) => Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 16.h),
                  child: _FlightCard(flight: flight, isRoundTrip: false),
                )),
                20.verticalSpace,
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildSkeletons() {
    return ListView(
      padding: EdgeInsets.all(20.w),
      children: List.generate(3, (_) => Padding(
        padding: EdgeInsets.only(bottom: 16.h),
        child: SkeletonLoader(width: double.infinity, height: 200.h, borderRadius: BorderRadius.circular(12.r)),
      )),
    );
  }
}

class _FlightCard extends ConsumerWidget {
  final FlightEntity flight;
  final bool isRoundTrip;

  const _FlightCard({required this.flight, required this.isRoundTrip});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final outbound = flight.outbound.isNotEmpty ? flight.outbound.first : null;
    if (outbound == null) return const SizedBox.shrink();

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
      decoration: BoxDecoration(color: PPaymobileColors.flightContainerbgColor, borderRadius: BorderRadius.circular(12.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  4.horizontalSpace,
                  Container(
                    height: 47.w, width: 47.w,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(100.r)),
                    clipBehavior: Clip.hardEdge,
                    child: AppImage(imageUrl: outbound.airlineDetails.logo, width: 47.w, height: 47.w, fit: BoxFit.cover),
                  ),
                  8.horizontalSpace,
                  Text(outbound.airlineDetails.name, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500)),
                ],
              ),
              if (flight.outboundStops == 0)
                Container(
                  height: 25.h,
                  padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 1.h),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(32.r), color: PPaymobileColors.anotherButtonColor),
                  child: Text('Direct', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.navContainerbgColor, fontSize: 12.sp, fontWeight: FontWeight.w500)),
                ),
            ],
          ),
          17.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(outbound.airportFrom, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 20.sp, fontWeight: FontWeight.w500)),
                  4.verticalSpace,
                  Text(FlightFormatUtils.formatTime(outbound.departureTime), style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w500)),
                ],
              ),
              Row(
                children: [
                  SizedBox(height: 13.h, width: 13.h, child: SvgPicture.asset('assets/icon/spacer.svg', fit: BoxFit.contain)),
                  5.horizontalSpace,
                  SizedBox(height: 2.h, width: 60.w, child: SvgPicture.asset('assets/icon/dashed_1.svg', fit: BoxFit.contain)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(FlightFormatUtils.formatDuration(flight.totalDuration), style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w500)),
                  6.verticalSpace,
                  SizedBox(height: 16.h, width: 16.h, child: SvgPicture.asset('assets/icon/airplane_1.svg', fit: BoxFit.contain)),
                  6.verticalSpace,
                  Text(FlightFormatUtils.stopsLabel(flight.outboundStops), style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.buttonColor, fontSize: 12.sp, fontWeight: FontWeight.w500)),
                ],
              ),
              Row(
                children: [
                  SizedBox(height: 2.h, width: 60.w, child: SvgPicture.asset('assets/icon/dashed_2.svg', fit: BoxFit.contain)),
                  5.horizontalSpace,
                  SizedBox(height: 13.h, width: 13.h, child: SvgPicture.asset('assets/icon/green_spacer.svg', fit: BoxFit.contain)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(outbound.airportTo, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 20.sp, fontWeight: FontWeight.w500)),
                  4.verticalSpace,
                  Text(FlightFormatUtils.formatTime(outbound.arrivalTime), style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w500)),
                ],
              ),
            ],
          ),
          16.verticalSpace,
          Divider(color: PPaymobileColors.onTapButtonColor, height: 1.h),
          19.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(outbound.cabinType, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w500)),
              Text('₦${FlightFormatUtils.formatAmount(flight.amount)}', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.buttonColor, fontSize: 18.sp, fontWeight: FontWeight.w500)),
            ],
          ),
          20.verticalSpace,
          TouchOpacity(
            onTap: () {
              ref.read(selectedFlightProvider.notifier).select(flight);
              context.router.push(const FlightDetailsRoute());
            },
            child: Container(
              height: 46.h,
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(56).r, color: PPaymobileColors.navContainerbgColor),
              child: Center(child: Text('Select', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.mainScreenBackground, fontSize: 16.sp, fontWeight: FontWeight.w600))),
            ),
          ),
        ],
      ),
    );
  }
}
