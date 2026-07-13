import 'package:flutter/material.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';

@RoutePage()
class CancelFlightSuccessfulPage extends HookConsumerWidget {
  const CancelFlightSuccessfulPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: const PPAppBar(showLeading: false),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              122.verticalSpace,
              Align(
                alignment: Alignment.center,
                child: SizedBox(height: 74.w, width: 74.w, child: Image.asset('assets/images/success1.png', fit: BoxFit.contain)),
              ),
              25.verticalSpace,
              Text('Flight Cancelled', textAlign: TextAlign.center, style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.greenTextColor, fontSize: 20.sp, fontWeight: FontWeight.w600)),
              4.verticalSpace,
              Text(
                textAlign: TextAlign.center,
                'Your flight booking has been successfully cancelled.',
                style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
              241.verticalSpace,
              PPButton(text: 'Book New Flight', onPressed: () => context.router.push(const FlightBookingRoute())),
              18.verticalSpace,
              PPButton(text: 'View Bookings', onPressed: () => context.router.push(const BookedFlightsRoute())),
            ],
          ),
        ),
      ),
    );
  }
}
