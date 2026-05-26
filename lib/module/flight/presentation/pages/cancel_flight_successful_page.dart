import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';

@RoutePage()
class CancelFlightSuccessfulPage extends HookConsumerWidget {
  const CancelFlightSuccessfulPage({super.key});

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
              122.verticalSpace,
              SizedBox(
                height: 74.w,
                width: 74.w,
                child: Image.asset(
                  'assets/images/success1.png',
                  fit: BoxFit.contain,
                ),
              ),
              25.verticalSpace,
              Text(
                'Flight Canceled',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.greenTextColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              4.verticalSpace,
              Text(
                textAlign: TextAlign.center,
                'Your flight booking for ID #45689 has been successfully canceled. A sum of ₦345,800.00 will be refunded to your wallet after confirmation.',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.svgIconColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              241.verticalSpace,
              PPButton(
                text: 'Book New Flight',
                onPressed: () {},
              ),
              18.verticalSpace,
              PPButton(
                text: 'Go Back',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
