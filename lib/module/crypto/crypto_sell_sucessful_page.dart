import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/module/crypto/sell_crypto_page.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';

@RoutePage()
class CryptoSellSucessfulPage extends HookConsumerWidget {
  const CryptoSellSucessfulPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  122.verticalSpace,
                  SizedBox(
                    height: 120.w,
                    width: 120.w,
                    child: Image.asset(
                      'assets/images/big_check.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  25.verticalSpace,
                  Text(
                    'Transaction Sucessful',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  4.verticalSpace,
                  Text(
                    'You successfully sold 0.000013 worth of BTC',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.svgIconColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  10.verticalSpace,
                  SizedBox(
                    height: 120.w,
                    width: 120.w,
                    child: Image.asset(
                      'assets/images/big_fail.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  25.verticalSpace,
                  Text(
                    'Transfer Failed',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  4.verticalSpace,
                  Text(
                    'Your sale of 0.000023BTC was not successful. Please try again',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.svgIconColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  10.verticalSpace,
                  SizedBox(
                    height: 120.w,
                    width: 120.w,
                    child: Image.asset(
                      'assets/images/big_pending.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  25.verticalSpace,
                  Text(
                    'Transfer Pending',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  4.verticalSpace,
                  Text(
                    'Your Purchase of 0.000023BTC is being processed.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.svgIconColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  200.verticalSpace,
                  Text(
                    '₦150,000.00 has been deducted to your main wallet',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.svgIconColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  14.verticalSpace,
                  PPButton(
                    text: 'Make another Trade',
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SellCryptoPage(),
                      ),
                    ),
                  ),
                  8.verticalSpace,
                  PPButton(
                    text: 'View Asset',
                    onPressed: () => context.router.pushAndPopUntil(
                      HomeRoute(),
                      predicate: (route) => false,
                    ),
                  ),
                  8.verticalSpace,
                  PPButton(
                    text: 'Try Again',
                    onPressed: () {},
                  ),
                  12.verticalSpace,
                  PPButton(
                    text: 'View Receipt',
                    onPressed: () => context.router.push(CryptoSellReceiptRoute()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
