import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';

@RoutePage()
class MultiPaymentSuccessPage extends HookConsumerWidget {
  const MultiPaymentSuccessPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: AppBar(automaticallyImplyLeading: false),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              73.verticalSpace,
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 74.w,
                  width: 74.w,
                  child: Image.asset(
                    'assets/images/big_check.png', // this is replaced with 'assets/images/big_pending.png' for pending and 'assets/images/big_fail.png' for failed
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              25.verticalSpace,
              Text(
                'Flight Successfully Booked', // this is replaced with 'Pending Flight Booking' for pending and 'Flight Booking Failed' for failed
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: PPaymobileColors.greenTextColor,
                ),
              ),
              4.verticalSpace,
              Text(
                'You’ll receive a notification once check-in opens so you can access your boarding pass.  ', // this is replaced with 'Your flight booking is being processed. Please hold as we complete your transaction  ' for pending and 'Your transaction was not successful. Please try again or click the button to go back' for failed
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: PPaymobileColors.svgIconColor,
                ),
              ),
              241.verticalSpace,
              PPButton(
                text: 'View Receipt',
                onPressed: () => context.router.push(MultiPaymentReceiptRoute()),
              ),
              20.verticalSpace,
              PPButton(
                text: 'Book Another Flight',
                onPressed: () => context.router.push(BookedFlightsRoute()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
