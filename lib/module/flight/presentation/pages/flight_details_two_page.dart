import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/flight/domain/entities/flight_entity.dart';
import 'package:ppay_mobile/module/flight/presentation/providers/flight_providers.dart';
import 'package:ppay_mobile/module/flight/presentation/providers/selected_flight_provider.dart';
import 'package:ppay_mobile/module/flight/presentation/utils/flight_format_utils.dart';
import 'package:ppay_mobile/shared/widgets/app_image.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/flight_policies_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class FlightDetailsTwoPage extends HookConsumerWidget {
  const FlightDetailsTwoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flight = ref.watch(selectedFlightProvider);
    final confirmAsync = ref.watch(confirmFlightProvider);

    ref.listen(confirmFlightProvider, (_, next) {
      if (next.hasError) {
        MessageHandler.showErrorSnackBar(context, next.error.toString());
      } else if (next.hasValue && next.value != null) {
        ref.read(selectedConfirmationProvider.notifier).set(next.value!);
        context.router.push(const PassengerDetailsTwoRoute());
      }
    });

    if (flight == null) {
      return Scaffold(
        backgroundColor: PPaymobileColors.mainScreenBackground,
        body: Center(child: Text('No flight selected', style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 14.sp))),
      );
    }

    final outbound = flight.outbound.isNotEmpty ? flight.outbound.first : null;
    final inbound = flight.inbound.isNotEmpty ? flight.inbound.first : null;

    Widget _segmentSection(FlightSegmentEntity seg, String direction) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.0.w),
          child: Container(
            height: 33.h,
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.h),
            decoration: BoxDecoration(border: Border.all(color: PPaymobileColors.filterBorderColor, width: 1.w), borderRadius: BorderRadius.circular(4).r),
            child: Center(
              child: RichText(
                text: TextSpan(
                  text: '$direction ',
                  style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w500),
                  children: [TextSpan(text: FlightFormatUtils.formatDate(seg.departureTime), style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 12.sp, fontWeight: FontWeight.w400))],
                ),
              ),
            ),
          ),
        ),
        23.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Container(height: 42.w, width: 42.w, clipBehavior: Clip.hardEdge, decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)), child: AppImage(imageUrl: seg.airlineDetails.logo, width: 42.w, height: 42.w, fit: BoxFit.cover)),
                23.horizontalSpace,
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('${seg.airportFrom} → ${seg.airportTo}', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500)),
                  4.verticalSpace,
                  Text(seg.airlineDetails.name, style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.anotherGreyColor, fontSize: 12.sp, fontWeight: FontWeight.w500)),
                ]),
              ]),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(FlightFormatUtils.formatDuration(seg.duration), style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w500)),
                Text(seg.cabinType, style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.anotherGreyColor, fontSize: 12.sp, fontWeight: FontWeight.w500)),
                Text(seg.flightNumber, style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.buttonColor, fontSize: 14.sp, fontWeight: FontWeight.w500)),
              ]),
            ],
          ),
        ),
        36.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: 24.h, width: 24.h, child: SvgPicture.asset('assets/icon/takeoff_1.svg', fit: BoxFit.contain)),
            19.horizontalSpace,
            Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(FlightFormatUtils.formatTime(seg.departureTime), style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500)),
              4.verticalSpace,
              Text(FlightFormatUtils.formatDate(seg.departureTime), style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 12.sp, fontWeight: FontWeight.w500)),
            ]),
          ]),
        ),
        18.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: 24.h, width: 24.h, child: SvgPicture.asset('assets/icon/flight_down.svg', fit: BoxFit.contain)),
            19.horizontalSpace,
            Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(FlightFormatUtils.formatTime(seg.arrivalTime), style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500)),
              4.verticalSpace,
              Text(FlightFormatUtils.formatDate(seg.arrivalTime), style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 12.sp, fontWeight: FontWeight.w500)),
            ]),
          ]),
        ),
        34.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Baggage', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
              Text(seg.baggage, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w400)),
            ]),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Fare Rule', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
              TouchOpacity(
                onTap: () => showModalBottomSheet(context: context, isScrollControlled: true, backgroundColor: Colors.transparent, builder: (_) => const FlightPoliciesBottomsheet()),
                child: RichText(text: TextSpan(text: 'Non refundable ', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w400), children: [TextSpan(text: 'Read', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.buttonColor, fontSize: 12.sp, fontWeight: FontWeight.w400, decoration: TextDecoration.underline, decorationColor: PPaymobileColors.buttonColor))])),
              ),
            ]),
          ]),
        ),
      ],
    );

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: AppBar(
        animateColor: true,
        backgroundColor: PPaymobileColors.mainScreenBackground,
        centerTitle: true,
        title: Text('Flight Details', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w500)),
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: TouchOpacity(onTap: () => Navigator.pop(context), child: SizedBox(height: 24.w, width: 24.w, child: SvgPicture.asset('assets/icon/arrow_back.svg', fit: BoxFit.scaleDown))),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  35.verticalSpace,
                  if (outbound != null) _segmentSection(outbound, 'Outbound'),
                  if (inbound != null) ...[
                    21.verticalSpace,
                    Divider(color: PPaymobileColors.textfiedBorder, height: 1.h),
                    41.verticalSpace,
                    _segmentSection(inbound, 'Inbound'),
                  ],
                  29.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: RichText(
                      text: TextSpan(
                        text: 'Total Fee: ',
                        style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w400),
                        children: [TextSpan(text: '₦${FlightFormatUtils.formatAmount(flight.amount)}', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 20.sp, fontWeight: FontWeight.w500))],
                      ),
                    ),
                  ),
                  20.verticalSpace,
                ],
              ),
            ),
            Container(
              height: 85.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 17.h),
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: PPaymobileColors.textfieldGrey, width: 1.w)),
                color: PPaymobileColors.mainScreenBackground,
                boxShadow: [BoxShadow(offset: const Offset(0, 0), blurRadius: 4.r, color: const Color(0xFF626262).withValues(alpha: 0.25))],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('Total', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.anotherGreyColor, fontSize: 12.sp, fontWeight: FontWeight.w500)),
                    4.verticalSpace,
                    Text('₦${FlightFormatUtils.formatAmount(flight.amount)}', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500)),
                  ]),
                  TouchOpacity(
                    onTap: confirmAsync.isLoading ? null : () => ref.read(confirmFlightProvider.notifier).call(flight.id),
                    child: Container(
                      height: 46.h, width: 212.w,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(56).r, color: PPaymobileColors.buttonColorandText),
                      child: Center(
                        child: confirmAsync.isLoading
                            ? SizedBox(height: 20.w, width: 20.w, child: const CircularProgressIndicator(strokeWidth: 2, valueColor: AlwaysStoppedAnimation(Colors.white)))
                            : Text('Continue', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.mainScreenBackground, fontSize: 16.sp, fontWeight: FontWeight.w600)),
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
