import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/module/flight/presentation/providers/selected_flight_provider.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';

@RoutePage()
class FlightTwoPaymentSuccessPage extends HookConsumerWidget {
  const FlightTwoPaymentSuccessPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookingResult = ref.watch(flightBookingResultProvider);

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: const PPAppBar(showLeading: false),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              73.verticalSpace,
              Align(
                alignment: Alignment.center,
                child: SizedBox(height: 74.w, width: 74.w, child: Image.asset('assets/images/big_check.png', fit: BoxFit.contain)),
              ),
              25.verticalSpace,
              Text(
                'Round Trip Successfully Booked',
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 20.sp, fontWeight: FontWeight.w600, color: PPaymobileColors.greenTextColor),
              ),
              4.verticalSpace,
              Text(
                'You\'ll receive a notification once check-in opens so you can access your boarding pass.',
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 14.sp, fontWeight: FontWeight.w500, color: PPaymobileColors.svgIconColor),
              ),
              if (bookingResult != null) ...[
                16.verticalSpace,
                Text(
                  'Booking Reference: ${bookingResult.bookingReference}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 14.sp, fontWeight: FontWeight.w600, color: PPaymobileColors.buttonColor),
                ),
              ],
              241.verticalSpace,
              PPButton(
                text: 'View Receipt',
                onPressed: () => context.router.push(const FlightTwoPaymentReceiptRoute()),
              ),
              20.verticalSpace,
              PPButton(
                text: 'View Booked Flights',
                onPressed: () => context.router.push(const BookedFlightsRoute()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
