import 'package:flutter/material.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/shared/utils/amount_formatter.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';

@RoutePage()
class SellGiftCardSuccessPage extends HookConsumerWidget {
  final String cardType;
  final double amountInUSD;
  final double nairaEquivalent;

  const SellGiftCardSuccessPage({
    super.key,
    required this.cardType,
    required this.amountInUSD,
    required this.nairaEquivalent,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: AppBar(
        backgroundColor: PPaymobileColors.mainScreenBackground,
        toolbarHeight: 56,
        leadingWidth: 56.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: TouchOpacity(
            onTap: () => context.router.replace(HomeRoute()),
            child: SizedBox(
              height: 24.w,
              width: 24.w,
              child: SvgPicture.asset(
                'assets/icon/arrow_back.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
      ),
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
                'Transaction Submitted',
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
                'Your $cardType gift card sale has been submitted. Once verified, the naira equivalent will be credited to your wallet.',
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
                        text: 'Amount Sold: ',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: '\$${amountInUSD.toStringAsFixed(2)} ≈ ₦${AmountFormatter.formatBalance(nairaEquivalent.toStringAsFixed(2))}',
                            style: TextStyle(
                              fontFamily: 'Gilroy',
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
              13.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Status',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  16.horizontalSpace,
                  SizedBox(
                    height: 24.h,
                    width: 95.w,
                    child: Image.asset(
                      'assets/images/another_pending.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              PPButton(
                text: 'View Receipt',
                onPressed: () => context.router.push(GiftcardSellReceiptRoute()),
              ),
              24.verticalSpace,
              PPButton(
                text: 'Go to App',
                onPressed: () => context.router.replace(HomeRoute()),
                icon: SvgPicture.asset(
                  'assets/icon/arrow_forward_1.svg',
                  fit: BoxFit.contain,
                ),
              ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
