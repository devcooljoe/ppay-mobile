import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';

@RoutePage()
class GiftCardSucessPage extends HookConsumerWidget {
  const GiftCardSucessPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              142.verticalSpace,
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
                'You have successfully purchased a gift card. An email will be sent to you recording the card details.',
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
                  width: 241.w,
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
                            text: '₦40,000.00',
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
              98.verticalSpace,
              PPButton(
                text: 'Go To App',
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icon/arrow_forwardw.svg',
                  fit: BoxFit.contain,
                ),
              ),
              14.verticalSpace,
              PPButton(
                text: 'View Receipt',
                onPressed: () => context.router.push(GiftCardBuyReceiptRoute()),
              ),
              // for other cases of transaction below
              15.verticalSpace,
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
                'Transaction Pending', // it is Transaction Failed for failed transaction
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
                'Your purchase of amazon gift card is processing. Please be patient as we process transaction.', // for transaction failed, it is is 'Your purchase of amazon gift card failed. Please try again.'
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
                  width: 241.w,
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 3.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24).r,
                    color: PPaymobileColors
                        .warningColor, // for transaction failed it is PPaymobileColors.dangerColor,
                  ),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Amount Purchased: ',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors
                              .black, // the text color is .dangerTextColor
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: '₦40,000.00',
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              color: Colors
                                  .black, // the text color is .dangerTextColor
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
              98.verticalSpace,
              PPButton(
                text: 'Try Again',
                onPressed: () {},
              ),
              24.verticalSpace,
              PPButton(
                text: 'Go to App',
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icon/arrow_forward_1.svg',
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
