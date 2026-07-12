import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';

@RoutePage()
class CryptoReceiptPage extends HookConsumerWidget {
  const CryptoReceiptPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              SizedBox(
                height: 120.w,
                width: 120.w,
                child: Image.asset('assets/images/big_check.png', fit: BoxFit.contain),
              ),
              25.verticalSpace,
              Text(
                'Purchase Successful',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              8.verticalSpace,
              Text(
                'Your crypto purchase was successful. You can view the full transaction details in your transaction history.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.svgIconColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              PPButton(
                text: 'View Transaction History',
                onPressed: () => context.router.replace(CryptoTransactionsHistoryRoute()),
              ),
              8.verticalSpace,
              PPButton(
                text: 'Back to Home',
                onPressed: () => context.router.replace(HomeRoute()),
              ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
