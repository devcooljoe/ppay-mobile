import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/shared/utils/amount_formatter.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';

@RoutePage()
class GiftCardSuccessPage extends HookConsumerWidget {
  final String cardType;
  final double amountInNaira;
  final double amountInUSD;
  final String region;
  final double rate;

  const GiftCardSuccessPage({
    super.key,
    required this.cardType,
    required this.amountInNaira,
    required this.amountInUSD,
    required this.region,
    required this.rate,
  });

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
                child: Image.asset(
                  'assets/images/big_check.png',
                  fit: BoxFit.contain,
                ),
              ),
              25.verticalSpace,
              Text(
                'Transaction Successful',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.verticalSpace,
              Text(
                'You have successfully purchased a $cardType gift card. An email will be sent to you with the card details.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.svgIconColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              31.verticalSpace,
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 30.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 3.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24).r,
                    color: PPaymobileColors.doneColor,
                  ),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Amount Purchased: ',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: '₦${AmountFormatter.formatBalance(amountInNaira.toStringAsFixed(2))}',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              PPButton(
                text: 'Go To App',
                onPressed: () => context.router.replace(HomeRoute()),
                icon: SvgPicture.asset(
                  'assets/icon/arrow_forwardw.svg',
                  fit: BoxFit.contain,
                ),
              ),
              14.verticalSpace,
              PPButton(
                text: 'View Receipt',
                onPressed: () => context.router.push(GiftCardBuyReceiptRoute(
                  cardType: cardType,
                  amountInNaira: amountInNaira,
                  amountInUSD: amountInUSD,
                  region: region,
                  rate: rate,
                  purchasedAt: DateTime.now(),
                )),
              ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
