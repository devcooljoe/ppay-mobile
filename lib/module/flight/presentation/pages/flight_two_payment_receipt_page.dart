import 'package:flutter/material.dart';
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
class FlightTwoPaymentReceiptPage extends HookConsumerWidget {
  const FlightTwoPaymentReceiptPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookingResult = ref.watch(flightBookingResultProvider);
    final confirmation = ref.watch(selectedConfirmationProvider);

    return Scaffold(
      backgroundColor: PPaymobileColors.deepBackgroundColor,
      appBar: AppBar(
        backgroundColor: PPaymobileColors.mainScreenBackground,
        toolbarHeight: 56,
        leadingWidth: 56.w,
        title: Text('Receipt', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w500)),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: TouchOpacity(onTap: () => Navigator.pop(context), child: SizedBox(height: 24.w, width: 24.w, child: SvgPicture.asset('assets/icon/arrow_back.svg', fit: BoxFit.scaleDown))),
        ),
      ),
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
                    Text('Your Reservation', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w600)),
                    24.verticalSpace,
                    if (bookingResult != null) ...[
                      Row(children: [
                        Text('BOOKING REF: ', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500)),
                        Expanded(child: Text(bookingResult.bookingReference, style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.buttonColor, fontSize: 16.sp, fontWeight: FontWeight.w500))),
                        TouchOpacity(onTap: () => Clipboard.setData(ClipboardData(text: bookingResult.bookingReference)), child: SizedBox(height: 18.w, width: 18.w, child: SvgPicture.asset('assets/icon/copy_black.svg', fit: BoxFit.contain))),
                      ]),
                      20.verticalSpace,
                    ],
                    if (confirmation != null) ...[
                      Text('Outbound', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w600)),
                      10.verticalSpace,
                      ...confirmation.outbound.map((seg) => Padding(
                        padding: EdgeInsets.only(bottom: 8.h),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text('${seg.airportFrom} → ${seg.airportTo}', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.buttonColor, fontSize: 14.sp, fontWeight: FontWeight.w500)),
                          4.verticalSpace,
                          Text('${FlightFormatUtils.formatDate(seg.departureTime)} • ${FlightFormatUtils.formatTime(seg.departureTime)}', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
                        ]),
                      )),
                      if (confirmation.inbound.isNotEmpty) ...[
                        16.verticalSpace,
                        Text('Inbound', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w600)),
                        10.verticalSpace,
                        ...confirmation.inbound.map((seg) => Padding(
                          padding: EdgeInsets.only(bottom: 8.h),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Text('${seg.airportFrom} → ${seg.airportTo}', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.buttonColor, fontSize: 14.sp, fontWeight: FontWeight.w500)),
                            4.verticalSpace,
                            Text('${FlightFormatUtils.formatDate(seg.departureTime)} • ${FlightFormatUtils.formatTime(seg.departureTime)}', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
                          ]),
                        )),
                      ],
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
