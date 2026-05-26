import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class GiftcardPage extends HookConsumerWidget {
  const GiftcardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(title: 'GiftCard'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              39.verticalSpace,
              Text(
                'Start Your Gift Card Transaction. Buy or Sell Instantly',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              33.verticalSpace,
              TouchOpacity(
                onTap: () {
                  context.router.push(BuyGiftCardFeaturesRoute());
                },
                child: SizedBox(
                  height: 251.h,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 251.h,
                        width: double.infinity,
                        child: Image.asset(
                          'assets/images/buy_gift_card.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      Positioned(
                        left: 117.w,
                        bottom: 7.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Click to buy',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                4.verticalSpace,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 18.w,
                                      width: 18.w,
                                      child: SvgPicture.asset(
                                        'assets/icon/check.svg',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    8.horizontalSpace,
                                    Text(
                                      'Fast & Secure',
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        color: PPaymobileColors.svgIconColor,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            47.horizontalSpace,
                            SizedBox(
                              height: 44.h,
                              width: 122.w,
                              child: Image.asset(
                                'assets/images/explore.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              36.verticalSpace,
              TouchOpacity(
                onTap: () {
                  context.router.push(SellGiftCardFeaturesRoute());
                },
                child: SizedBox(
                  height: 251.h,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 251.h,
                        width: double.infinity,
                        child: Image.asset(
                          'assets/images/sell_gift_card.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      Positioned(
                        left: 117.w,
                        bottom: 7.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Click to sell',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                4.verticalSpace,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 18.w,
                                      width: 18.w,
                                      child: SvgPicture.asset(
                                        'assets/icon/check.svg',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    8.horizontalSpace,
                                    Text(
                                      'Fast & Secure',
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        color: PPaymobileColors.svgIconColor,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            47.horizontalSpace,
                            SizedBox(
                              height: 44.h,
                              width: 122.w,
                              child: Image.asset(
                                'assets/images/explore.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
