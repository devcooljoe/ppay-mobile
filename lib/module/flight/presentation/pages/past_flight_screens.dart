import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/module/flight/domain/entities/flight_entity.dart';
import 'package:ppay_mobile/module/flight/presentation/providers/flight_providers.dart';
import 'package:ppay_mobile/module/flight/presentation/utils/flight_format_utils.dart';
import 'package:ppay_mobile/shared/widgets/app_image.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/empty_state.dart';
import 'package:ppay_mobile/shared/widgets/skeleton_loader.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

class PastFlightScreens extends HookConsumerWidget {
  const PastFlightScreens({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookingsAsync = ref.watch(getFlightBookingsProvider);

    useEffect(() {
      Future.microtask(() => ref.read(getFlightBookingsProvider.notifier).call(status: 'past'));
      return null;
    }, []);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      color: PPaymobileColors.deepBackgroundColor,
      child: bookingsAsync.when(
        loading: () => ListView(
          children: [
            24.verticalSpace,
            ...List.generate(2, (_) => Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: SkeletonLoader(width: double.infinity, height: 200.h, borderRadius: BorderRadius.circular(12.r)),
            )),
          ],
        ),
        error: (e, _) => Center(child: Text(e.toString(), style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 14.sp, color: PPaymobileColors.svgIconColor))),
        data: (bookings) {
          if (bookings == null || bookings.isEmpty) {
            return EmptyState(imagePath: 'assets/images/flight_ticket.png', message: 'No past flights');
          }
          return ListView(
            children: [
              24.verticalSpace,
              Text('${bookings.length} past flight${bookings.length > 1 ? 's' : ''}', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w500)),
              12.verticalSpace,
              ...bookings.map((booking) => Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: _PastBookingCard(booking: booking),
              )),
            ],
          );
        },
      ),
    );
  }
}

class _PastBookingCard extends HookWidget {
  final FlightBookingEntity booking;
  const _PastBookingCard({required this.booking});

  @override
  Widget build(BuildContext context) {
    final isExpanded = useState(false);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
      decoration: BoxDecoration(color: PPaymobileColors.mainScreenBackground, borderRadius: BorderRadius.circular(12.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                4.horizontalSpace,
                Container(height: 47.w, width: 47.w, decoration: BoxDecoration(borderRadius: BorderRadius.circular(100.r)), clipBehavior: Clip.hardEdge, child: AppImage(imageUrl: booking.airlineLogo, width: 47.w, height: 47.w, fit: BoxFit.cover)),
                12.horizontalSpace,
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(booking.airline, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500)),
                  Text(booking.bookingReference, style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 10.sp, fontWeight: FontWeight.w500)),
                ]),
              ]),
              _StatusBadge(status: booking.status),
            ],
          ),
          17.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(booking.origin, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 20.sp, fontWeight: FontWeight.w500)),
                4.verticalSpace,
                Text(FlightFormatUtils.formatTime(booking.departureTime), style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w500)),
                4.verticalSpace,
                Text(FlightFormatUtils.formatDate(booking.departureTime), style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w500)),
              ]),
              Row(children: [
                SizedBox(height: 13.h, width: 13.h, child: SvgPicture.asset('assets/icon/spacer.svg', fit: BoxFit.contain)),
                5.horizontalSpace,
                SizedBox(height: 2.h, width: 58.w, child: SvgPicture.asset('assets/icon/dashed_1.svg', fit: BoxFit.contain)),
              ]),
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Text(FlightFormatUtils.formatDuration(booking.duration), style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w500)),
                6.verticalSpace,
                SizedBox(height: 16.h, width: 16.h, child: SvgPicture.asset('assets/icon/airplane_1.svg', fit: BoxFit.contain)),
                6.verticalSpace,
                Text(booking.inbound.isEmpty ? 'One Way' : 'Round Trip', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.buttonColor, fontSize: 12.sp, fontWeight: FontWeight.w500)),
              ]),
              Row(children: [
                SizedBox(height: 2.h, width: 58.w, child: SvgPicture.asset('assets/icon/dashed_2.svg', fit: BoxFit.contain)),
                5.horizontalSpace,
                SizedBox(height: 13.h, width: 13.h, child: SvgPicture.asset('assets/icon/green_spacer.svg', fit: BoxFit.contain)),
              ]),
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text(booking.destination, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 20.sp, fontWeight: FontWeight.w500)),
                4.verticalSpace,
                Text(FlightFormatUtils.formatTime(booking.arrivalTime), style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w500)),
                4.verticalSpace,
                Text(FlightFormatUtils.formatDate(booking.arrivalTime), style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w500)),
              ]),
            ],
          ),
          18.verticalSpace,
          TouchOpacity(
            onTap: () => isExpanded.value = !isExpanded.value,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('${booking.passengers.length} Passenger${booking.passengers.length > 1 ? 's' : ''}', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w500)),
              6.horizontalSpace,
              SizedBox(height: 12.h, width: 24.w, child: SvgPicture.asset(isExpanded.value ? 'assets/icon/arrow_up.svg' : 'assets/icon/arrow_down.svg', fit: BoxFit.contain)),
            ]),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            child: ClipRect(
              child: isExpanded.value
                  ? Column(
                      children: [
                        30.verticalSpace,
                        ...booking.passengers.map((p) => Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                            Row(children: [
                              SizedBox(height: 24.h, width: 24.h, child: SvgPicture.asset('assets/icon/b_person.svg', fit: BoxFit.contain)),
                              7.horizontalSpace,
                              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                Text(p.type, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 10.sp, fontWeight: FontWeight.w500)),
                                4.verticalSpace,
                                Text(p.name, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w500)),
                              ]),
                            ]),
                          ]),
                        )),
                      ],
                    )
                  : const SizedBox.shrink(),
            ),
          ),
          8.verticalSpace,
          Row(children: [
            SizedBox(
              height: 19.w, width: 19.w,
              child: SvgPicture.asset(
                booking.status == 'cancelled' ? 'assets/icon/cancel_2.svg' : 'assets/icon/check.svg',
                fit: BoxFit.contain,
              ),
            ),
            5.horizontalSpace,
            Text(
              booking.status == 'cancelled' ? 'Flight Cancelled' : 'Flight Completed',
              style: TextStyle(fontFamily: 'InstrumentSans', color: booking.status == 'cancelled' ? PPaymobileColors.redTextfield : const Color(0xff259E07), fontSize: 12.sp, fontWeight: FontWeight.w500),
            ),
          ]),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String status;
  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    Color bg;
    Color text;
    switch (status.toLowerCase()) {
      case 'cancelled':
        bg = const Color(0xFFFFEBEE); text = const Color(0xFFC62828); break;
      case 'failed':
        bg = const Color(0xFFFFEBEE); text = const Color(0xFFC62828); break;
      default:
        bg = const Color(0xFFF5F5F5); text = Colors.black54;
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.r), color: bg),
      child: Text(status, style: TextStyle(fontFamily: 'InstrumentSans', color: text, fontSize: 11.sp, fontWeight: FontWeight.w500)),
    );
  }
}
