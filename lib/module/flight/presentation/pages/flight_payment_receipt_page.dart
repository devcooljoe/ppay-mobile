import 'package:flutter/material.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ppay_mobile/module/flight/presentation/providers/selected_flight_provider.dart';
import 'package:ppay_mobile/module/flight/presentation/utils/flight_format_utils.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class FlightPaymentReceiptPage extends HookConsumerWidget {
  const FlightPaymentReceiptPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookingResult = ref.watch(flightBookingResultProvider);
    final confirmation = ref.watch(selectedConfirmationProvider);

    return Scaffold(
      backgroundColor: PPaymobileColors.deepBackgroundColor,
      appBar: const PPAppBar(title: 'Receipt'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              16.verticalSpace,
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(6).r, color: PPaymobileColors.mainScreenBackground),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Your Reservation', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w600)),
                        Container(
                          height: 40.h, width: 94.w,
                          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                          decoration: BoxDecoration(color: PPaymobileColors.mainScreenBackground, border: Border.all(color: PPaymobileColors.textfiedBorder, width: 1.w), borderRadius: BorderRadius.circular(6).r),
                          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                            SizedBox(height: 20.h, width: 20.h, child: SvgPicture.asset('assets/icon/share.svg', fit: BoxFit.contain)),
                            6.horizontalSpace,
                            Text('Share', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
                          ]),
                        ),
                      ],
                    ),
                    24.verticalSpace,
                    if (bookingResult != null) ...[
                      Row(children: [
                        Text('BOOKING REF: ', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500)),
                        Expanded(
                          child: Text(bookingResult.bookingReference, style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.buttonColor, fontSize: 16.sp, fontWeight: FontWeight.w500)),
                        ),
                        TouchOpacity(
                          onTap: () => Clipboard.setData(ClipboardData(text: bookingResult.bookingReference)),
                          child: SizedBox(height: 18.w, width: 18.w, child: SvgPicture.asset('assets/icon/copy_black.svg', fit: BoxFit.contain)),
                        ),
                      ]),
                      20.verticalSpace,
                    ],
                    if (confirmation != null && confirmation.outbound.isNotEmpty) ...[
                      Text('Trip(s)', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w600)),
                      10.verticalSpace,
                      ...confirmation.outbound.map((seg) => Padding(
                        padding: EdgeInsets.only(bottom: 12.h),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text('${seg.airportFrom} → ${seg.airportTo}', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.buttonColor, fontSize: 14.sp, fontWeight: FontWeight.w500)),
                          4.verticalSpace,
                          Text('${FlightFormatUtils.formatDate(seg.departureTime)} • ${FlightFormatUtils.formatTime(seg.departureTime)}', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
                          4.verticalSpace,
                          Text('Flight: ${seg.flightNumber}', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
                        ]),
                      )),
                    ],
                  ],
                ),
              ),
              16.verticalSpace,
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 16.w, top: 23.w, right: 16.w, bottom: 12.h),
                color: PPaymobileColors.mainScreenBackground,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Payment Details', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w500)),
                    16.verticalSpace,
                    _Row(label: 'Payment from:', value: 'Wallet'),
                    19.verticalSpace,
                    if (bookingResult != null) ...[
                      _Row(label: 'Booking Reference:', value: bookingResult.bookingReference),
                      19.verticalSpace,
                    ],
                    if (confirmation != null) ...[
                      _Row(label: 'Flight Amount:', value: '₦${FlightFormatUtils.formatAmount(confirmation.amount)}'),
                      19.verticalSpace,
                      Divider(height: 1.h, color: PPaymobileColors.deepBackgroundColor),
                      27.verticalSpace,
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        Text('Total:', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w600)),
                        Text('₦${FlightFormatUtils.formatAmount(confirmation.amount)}', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w600)),
                      ]),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Row extends StatelessWidget {
  final String label;
  final String value;
  const _Row({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(label, style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 14.sp, fontWeight: FontWeight.w500)),
      Text(value, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
    ]);
  }
}
