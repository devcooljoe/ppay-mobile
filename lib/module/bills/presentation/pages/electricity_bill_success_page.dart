import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';

@RoutePage()
class ElectricityBillSuccessPage extends HookConsumerWidget {
  const ElectricityBillSuccessPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: AppBar(
        backgroundColor: PPaymobileColors.mainScreenBackground,
        toolbarHeight: 56,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              122.verticalSpace,
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 120.w,
                  width: 120.w,
                  child: Image.asset(
                    'assets/images/big_check.png', // this is replaced with 'assets/images/big_pending.png' for pending and 'assets/images/big_fail.png' for failed
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              25.verticalSpace,
              Text(
                'Transaction Successful', // this is replaced with transaction pending for pending and transaction failed for failed
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              4.verticalSpace,
              Text(
                'N6,000 has been deducted from your main wallet', // this is replaced with 'Your electricity bill payment is been processed.' for pending and 'Electricity bill payment failed. Please try again' for failed
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              120.verticalSpace,
              PPButton(
                text: 'View Receipt',
                onPressed: () {
                  context.router.push(ElectricityReceiptRoute());
                },
              ),
              20.verticalSpace,
              10.verticalSpace,
              PPButton(
                text: 'Go To App',
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icon/arrow_forwardw.svg',
                  height: 24.h,
                  width: 24.h,
                  fit: BoxFit.contain,
                ),
              ),
              10.verticalSpace,
              PPButton(
                text: 'Try Again',
                onPressed: () {},
              ),
              20.verticalSpace,
              PPButton(
                text: 'Make another Payment',
                onPressed: () {},
                backgroundColor: PPaymobileColors.mainScreenBackground,
                icon: SvgPicture.asset(
                  'assets/icon/arrow_forward_1.svg',
                  height: 24.h,
                  width: 24.h,
                  fit: BoxFit.contain,
                ),
              ),
              10.verticalSpace,
              PPButton(
                text: 'Go to App',
                onPressed: () {},
                backgroundColor: PPaymobileColors.mainScreenBackground,
                icon: SvgPicture.asset(
                  'assets/icon/arrow_forward_1.svg',
                  height: 24.h,
                  width: 24.h,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
