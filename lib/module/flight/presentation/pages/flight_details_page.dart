import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/flight/domain/entities/flight_entity.dart';
import 'package:ppay_mobile/module/flight/presentation/providers/flight_providers.dart';
import 'package:ppay_mobile/module/flight/presentation/providers/flight_search_state.dart';
import 'package:ppay_mobile/module/flight/presentation/providers/selected_flight_provider.dart';
import 'package:ppay_mobile/module/flight/presentation/utils/flight_format_utils.dart';
import 'package:ppay_mobile/shared/widgets/app_image.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class FlightDetailsPage extends HookConsumerWidget {
  const FlightDetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flight = ref.watch(selectedFlightProvider);
    final searchState = ref.watch(flightSearchStateProvider);
    final confirmAsync = ref.watch(confirmFlightProvider);

    ref.listen(confirmFlightProvider, (_, next) {
      if (next.hasError) {
        MessageHandler.showErrorSnackBar(context, MessageHandler.getErrorMessage(next.error));
      } else if (next.hasValue && next.value != null) {
        ref.read(selectedConfirmationProvider.notifier).set(next.value!);
        context.router.push(const PassengerDetailsRoute());
      }
    });

    if (flight == null) {
      return Scaffold(
        backgroundColor: PPaymobileColors.mainScreenBackground,
        appBar: const PPAppBar(title: 'Flight Details'),
        body: Center(
          child: Text('No flight selected', style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 14.sp)),
        ),
      );
    }

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: const PPAppBar(title: 'Flight Details'),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                children: [
                  24.verticalSpace,
                  // Price summary card
                  _PriceSummaryCard(flight: flight, searchState: searchState),
                  24.verticalSpace,
                  // Outbound segments
                  if (flight.outbound.isNotEmpty) ...[
                    _SectionLabel(
                      label: 'Outbound',
                      date: FlightFormatUtils.formatDate(flight.outbound.first.departureTime),
                      stops: flight.outboundStops,
                      totalDuration: flight.totalDuration,
                    ),
                    12.verticalSpace,
                    ...List.generate(flight.outbound.length, (i) {
                      final seg = flight.outbound[i];
                      final isLast = i == flight.outbound.length - 1;
                      return Column(
                        children: [
                          _SegmentCard(segment: seg),
                          if (!isLast && seg.layover != null) ...[
                            _LayoverBadge(minutes: seg.layover!),
                          ],
                          if (!isLast) 8.verticalSpace,
                        ],
                      );
                    }),
                  ],
                  // Inbound segments
                  if (flight.inbound.isNotEmpty) ...[
                    24.verticalSpace,
                    _SectionLabel(
                      label: 'Return',
                      date: FlightFormatUtils.formatDate(flight.inbound.first.departureTime),
                      stops: flight.inboundStops,
                      totalDuration: flight.totalDuration,
                    ),
                    12.verticalSpace,
                    ...List.generate(flight.inbound.length, (i) {
                      final seg = flight.inbound[i];
                      final isLast = i == flight.inbound.length - 1;
                      return Column(
                        children: [
                          _SegmentCard(segment: seg),
                          if (!isLast && seg.layover != null) _LayoverBadge(minutes: seg.layover!),
                          if (!isLast) 8.verticalSpace,
                        ],
                      );
                    }),
                  ],
                  24.verticalSpace,
                  // Fare rules from first outbound segment
                  if (flight.outbound.isNotEmpty && flight.outbound.first.fareRules.isNotEmpty)
                    _FareRulesCard(
                      fareRules: flight.outbound.first.fareRules,
                      refundable: flight.outbound.first.refundable,
                    ),
                  24.verticalSpace,
                ],
              ),
            ),
            // Bottom bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              decoration: BoxDecoration(
                color: PPaymobileColors.mainScreenBackground,
                border: Border(top: BorderSide(color: PPaymobileColors.filterBorderColor, width: 1.w)),
                boxShadow: [BoxShadow(offset: const Offset(0, -2), blurRadius: 8.r, color: Colors.black.withValues(alpha: 0.06))],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Total', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.anotherGreyColor, fontSize: 12.sp, fontWeight: FontWeight.w500)),
                      4.verticalSpace,
                      Text('₦${FlightFormatUtils.formatAmount(flight.amount)}', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w600)),
                    ],
                  ),
                  TouchOpacity(
                    onTap: confirmAsync.isLoading ? null : () => ref.read(confirmFlightProvider.notifier).call(flight.id),
                    child: Container(
                      height: 46.h,
                      width: 200.w,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(56).r, color: PPaymobileColors.buttonColorandText),
                      child: Center(
                        child: confirmAsync.isLoading
                            ? SizedBox(height: 20.w, width: 20.w, child: const CircularProgressIndicator(strokeWidth: 2, valueColor: AlwaysStoppedAnimation(Colors.white)))
                            : Text('Continue', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PriceSummaryCard extends StatelessWidget {
  final FlightEntity flight;
  final FlightSearchParams searchState;
  const _PriceSummaryCard({required this.flight, required this.searchState});

  @override
  Widget build(BuildContext context) {
    final outbound = flight.outbound.isNotEmpty ? flight.outbound.first : null;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: PPaymobileColors.anotherContainerbgColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (outbound != null)
            Row(
              children: [
                Container(
                  height: 44.w, width: 44.w,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r), color: Colors.white),
                  child: AppImage(imageUrl: outbound.airlineDetails.logo, width: 44.w, height: 44.w, fit: BoxFit.contain),
                ),
                12.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(outbound.airlineDetails.name, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 15.sp, fontWeight: FontWeight.w600)),
                      4.verticalSpace,
                      Text('${outbound.airportFrom} → ${outbound.airportTo}', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.anotherGreyColor, fontSize: 13.sp, fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: flight.outboundStops == 0 ? PPaymobileColors.anotherButtonColor : const Color(0xFFFFF3E0),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    FlightFormatUtils.stopsLabel(flight.outboundStops),
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: flight.outboundStops == 0 ? PPaymobileColors.navContainerbgColor : Colors.orange,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          16.verticalSpace,
          Divider(color: PPaymobileColors.filterBorderColor, height: 1.h),
          16.verticalSpace,
          // Duration · Cabin · Flight number
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _InfoChip(icon: Icons.access_time_rounded, label: 'Duration', value: FlightFormatUtils.formatDuration(flight.totalDuration)),
              _InfoChip(icon: Icons.airline_seat_recline_normal_rounded, label: 'Cabin', value: _cabinLabel(searchState.cabin)),
              _InfoChip(icon: Icons.flight_rounded, label: 'Flight', value: outbound?.flightNumber ?? '—'),
            ],
          ),
          16.verticalSpace,
          Divider(color: PPaymobileColors.filterBorderColor, height: 1.h),
          16.verticalSpace,
          // Trip summary from search params
          _TripSummaryRow(searchState: searchState),
          16.verticalSpace,
          Divider(color: PPaymobileColors.filterBorderColor, height: 1.h),
          16.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Price', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.anotherGreyColor, fontSize: 13.sp, fontWeight: FontWeight.w500)),
              Text('₦${FlightFormatUtils.formatAmount(flight.amount)}', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.buttonColor, fontSize: 20.sp, fontWeight: FontWeight.w700)),
            ],
          ),
          if (flight.travelersPrice.isNotEmpty) ...[
            8.verticalSpace,
            ...flight.travelersPrice.map((tp) => Column(
              children: [
                if (tp.adult > 0) _PriceRow(label: 'Adult ×${searchState.adults}', amount: tp.adult),
                if (tp.child > 0) _PriceRow(label: 'Child ×${searchState.children}', amount: tp.child),
                if (tp.infant > 0) _PriceRow(label: 'Infant ×${searchState.infants}', amount: tp.infant),
              ],
            )),
          ],
        ],
      ),
    );
  }

  String _cabinLabel(String cabin) {
    switch (cabin) {
      case 'premium_economy': return 'Prem. Economy';
      case 'business': return 'Business';
      case 'first': return 'First Class';
      default: return 'Economy';
    }
  }
}

class _TripSummaryRow extends StatelessWidget {
  final FlightSearchParams searchState;
  const _TripSummaryRow({required this.searchState});

  @override
  Widget build(BuildContext context) {
    final totalPassengers = searchState.adults + searchState.children + searchState.infants;
    final passengerParts = <String>[];
    if (searchState.adults > 0) passengerParts.add('${searchState.adults} Adult${searchState.adults > 1 ? 's' : ''}');
    if (searchState.children > 0) passengerParts.add('${searchState.children} Child${searchState.children > 1 ? 'ren' : ''}');
    if (searchState.infants > 0) passengerParts.add('${searchState.infants} Infant${searchState.infants > 1 ? 's' : ''}');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Route with full labels
        if (searchState.fromLabel.isNotEmpty || searchState.toLabel.isNotEmpty)
          _SummaryItem(
            icon: Icons.route_rounded,
            label: 'Route',
            value: '${searchState.fromLabel.isNotEmpty ? searchState.fromLabel : searchState.from}  →  ${searchState.toLabel.isNotEmpty ? searchState.toLabel : searchState.to}',
          ),
        if (searchState.fromLabel.isNotEmpty || searchState.toLabel.isNotEmpty) 10.verticalSpace,
        // Dates
        Row(
          children: [
            Expanded(
              child: _SummaryItem(
                icon: Icons.calendar_today_rounded,
                label: 'Departure',
                value: searchState.departureDate.isNotEmpty ? FlightFormatUtils.formatDate(searchState.departureDate) : '—',
              ),
            ),
            if (searchState.returnDate != null && searchState.returnDate!.isNotEmpty) ...[
              16.horizontalSpace,
              Expanded(
                child: _SummaryItem(
                  icon: Icons.event_rounded,
                  label: 'Return',
                  value: FlightFormatUtils.formatDate(searchState.returnDate!),
                ),
              ),
            ],
          ],
        ),
        10.verticalSpace,
        // Passengers
        Row(
          children: [
            Expanded(
              child: _SummaryItem(
                icon: Icons.people_alt_rounded,
                label: 'Passengers',
                value: totalPassengers == 1 ? passengerParts.first : passengerParts.join(', '),
              ),
            ),
            16.horizontalSpace,
            Expanded(
              child: _SummaryItem(
                icon: Icons.luggage_rounded,
                label: 'Trip Type',
                value: searchState.tripType == 'round_trip' ? 'Round Trip' : 'One Way',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SummaryItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const _SummaryItem({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 15.sp, color: PPaymobileColors.buttonColor),
        8.horizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.anotherGreyColor, fontSize: 10.sp, fontWeight: FontWeight.w400)),
              3.verticalSpace,
              Text(value, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w600), overflow: TextOverflow.ellipsis, maxLines: 2),
            ],
          ),
        ),
      ],
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String label;
  final String date;
  final int stops;
  final int totalDuration;
  const _SectionLabel({required this.label, required this.date, required this.stops, required this.totalDuration});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          decoration: BoxDecoration(
            border: Border.all(color: PPaymobileColors.filterBorderColor, width: 1.w),
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: RichText(
            text: TextSpan(
              text: '$label  ',
              style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w600),
              children: [
                TextSpan(text: date, style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.anotherGreyColor, fontSize: 12.sp, fontWeight: FontWeight.w400)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _SegmentCard extends StatelessWidget {
  final FlightSegmentEntity segment;
  const _SegmentCard({required this.segment});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: PPaymobileColors.flightContainerbgColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Airline row
          Row(
            children: [
              Container(
                height: 36.w, width: 36.w,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r), color: Colors.white),
                child: AppImage(imageUrl: segment.airlineDetails.logo, width: 36.w, height: 36.w, fit: BoxFit.contain),
              ),
              10.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(segment.airlineDetails.name, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 13.sp, fontWeight: FontWeight.w600)),
                    Text('${segment.flightNumber}  ·  ${segment.cabinType}', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.anotherGreyColor, fontSize: 11.sp, fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
              Row(
                children: [
                  Icon(Icons.access_time_rounded, size: 12.sp, color: PPaymobileColors.buttonColor),
                  4.horizontalSpace,
                  Text(FlightFormatUtils.formatDuration(segment.duration), style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.buttonColor, fontSize: 12.sp, fontWeight: FontWeight.w600)),
                ],
              ),
            ],
          ),
          16.verticalSpace,
          // Route timeline
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left timeline
              Column(
                children: [
                  SizedBox(height: 20.h, width: 20.h, child: SvgPicture.asset('assets/icon/takeoff_1.svg', fit: BoxFit.contain)),
                  Container(width: 1.5.w, height: 40.h, color: PPaymobileColors.filterBorderColor),
                  SizedBox(height: 20.h, width: 20.h, child: SvgPicture.asset('assets/icon/flight_down.svg', fit: BoxFit.contain)),
                ],
              ),
              14.horizontalSpace,
              // Right details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(FlightFormatUtils.formatTime(segment.departureTime), style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w600)),
                        Text(segment.airportFrom, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    2.verticalSpace,
                    Text(FlightFormatUtils.formatDate(segment.departureTime), style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.anotherGreyColor, fontSize: 11.sp, fontWeight: FontWeight.w400)),
                    20.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(FlightFormatUtils.formatTime(segment.arrivalTime), style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w600)),
                        Text(segment.airportTo, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    2.verticalSpace,
                    Text(FlightFormatUtils.formatDate(segment.arrivalTime), style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.anotherGreyColor, fontSize: 11.sp, fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
            ],
          ),
          16.verticalSpace,
          Divider(color: PPaymobileColors.filterBorderColor, height: 1.h),
          12.verticalSpace,
          // Baggage & extras row
          Row(
            children: [
              Icon(Icons.luggage_outlined, size: 16.sp, color: PPaymobileColors.anotherGreyColor),
              6.horizontalSpace,
              Expanded(
                child: Text(segment.baggage.isNotEmpty ? segment.baggage : 'No baggage info', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.anotherGreyColor, fontSize: 11.sp, fontWeight: FontWeight.w400)),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                decoration: BoxDecoration(
                  color: segment.refundable ? const Color(0xFFE8F5E9) : const Color(0xFFFFEBEE),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  segment.refundable ? 'Refundable' : 'Non-refundable',
                  style: TextStyle(fontFamily: 'InstrumentSans', color: segment.refundable ? Colors.green.shade700 : Colors.red.shade700, fontSize: 10.sp, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          if (segment.bookingClass.isNotEmpty || segment.operatingAirline.isNotEmpty) ...[
            8.verticalSpace,
            Row(
              children: [
                if (segment.bookingClass.isNotEmpty)
                  _TagChip(label: 'Class: ${segment.bookingClass}'),
                if (segment.bookingClass.isNotEmpty && segment.operatingAirline.isNotEmpty)
                  8.horizontalSpace,
                if (segment.operatingAirline.isNotEmpty)
                  _TagChip(label: 'Operated by: ${segment.operatingAirline}'),
                if (segment.overnight) ...[
                  8.horizontalSpace,
                  _TagChip(label: '🌙 Overnight', color: const Color(0xFFEDE7F6)),
                ],
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _LayoverBadge extends StatelessWidget {
  final int minutes;
  const _LayoverBadge({required this.minutes});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.h),
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8E1),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: const Color(0xFFFFE082), width: 1.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.access_time, size: 14.sp, color: Colors.orange.shade700),
          6.horizontalSpace,
          Text(
            'Layover: ${FlightFormatUtils.formatDuration(minutes)}',
            style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.orange.shade700, fontSize: 12.sp, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class _FareRulesCard extends StatelessWidget {
  final List<String> fareRules;
  final bool refundable;
  const _FareRulesCard({required this.fareRules, required this.refundable});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: PPaymobileColors.anotherContainerbgColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Fare Rules', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w600)),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                decoration: BoxDecoration(
                  color: refundable ? const Color(0xFFE8F5E9) : const Color(0xFFFFEBEE),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  refundable ? 'Refundable' : 'Non-refundable',
                  style: TextStyle(fontFamily: 'InstrumentSans', color: refundable ? Colors.green.shade700 : Colors.red.shade700, fontSize: 11.sp, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          12.verticalSpace,
          ...fareRules.map((rule) => Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 4.h),
                  child: Container(width: 5.w, height: 5.w, decoration: BoxDecoration(color: PPaymobileColors.buttonColor, shape: BoxShape.circle)),
                ),
                8.horizontalSpace,
                Expanded(child: Text(rule, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black87, fontSize: 12.sp, fontWeight: FontWeight.w400))),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const _InfoChip({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 11.sp, color: PPaymobileColors.anotherGreyColor),
            4.horizontalSpace,
            Text(label, style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.anotherGreyColor, fontSize: 10.sp, fontWeight: FontWeight.w400)),
          ],
        ),
        4.verticalSpace,
        Text(value, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 13.sp, fontWeight: FontWeight.w600)),
      ],
    );
  }
}

class _PriceRow extends StatelessWidget {
  final String label;
  final double amount;
  const _PriceRow({required this.label, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.anotherGreyColor, fontSize: 12.sp, fontWeight: FontWeight.w400)),
          Text('₦${FlightFormatUtils.formatAmount(amount)}', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  final String label;
  final Color? color;
  const _TagChip({required this.label, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: color ?? PPaymobileColors.anotherContainerbgColor,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: PPaymobileColors.filterBorderColor, width: 1.w),
      ),
      child: Text(label, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black87, fontSize: 10.sp, fontWeight: FontWeight.w500)),
    );
  }
}
