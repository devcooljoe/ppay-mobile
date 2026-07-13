import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/shared/utils/amount_formatter.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';

@RoutePage()
class CryptoTransactionSuccessfulPage extends HookConsumerWidget {
  final double cryptoAmount;
  final String currency;
  final double nairaAmount;
  final String logoUrl;
  final bool isBuy;

  const CryptoTransactionSuccessfulPage({
    super.key,
    required this.cryptoAmount,
    required this.currency,
    required this.nairaAmount,
    required this.logoUrl,
    required this.isBuy,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              const Spacer(),
              SizedBox(
                height: 120.w,
                width: 120.w,
                child: Image.asset('assets/images/big_check.png', fit: BoxFit.contain),
              ),
              24.verticalSpace,
              Text(
                isBuy ? 'Purchase Successful!' : 'Sale Successful!',
                style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 24.sp, fontWeight: FontWeight.w700),
              ),
              12.verticalSpace,
              Text(
                isBuy
                    ? '${cryptoAmount.toStringAsFixed(6)} ${currency.toUpperCase()} has been added to your wallet.'
                    : '${cryptoAmount.toStringAsFixed(6)} ${currency.toUpperCase()} sold for ₦${AmountFormatter.formatBalance(nairaAmount.toStringAsFixed(2))}.',
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 14.sp),
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
