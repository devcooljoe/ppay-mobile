import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/feature_card.dart';

@RoutePage()
class FeaturesPage extends HookConsumerWidget {
  const FeaturesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: AppBar(
        backgroundColor: PPaymobileColors.mainScreenBackground,
        toolbarHeight: 56,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Features',
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              42.verticalSpace,
              Text(
                'Explore Features',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              6.verticalSpace,
              Text(
                'Pay bills, trade crypto, manage giftcards, shop, book flights, and use your virtual dollar card all for you',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.svgIconColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              40.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FeatureCard(
                    iconPath: 'assets/icon/gift_card_green.svg',
                    label: 'Giftcard',
                    onTap: () => context.router.push(GiftcardRoute()),
                  ),
                  16.horizontalSpace,
                  FeatureCard(
                    iconPath: 'assets/icon/bills_green.svg',
                    label: 'Bills',
                    onTap: () => context.router.push(BillsRoute()),
                  ),
                  16.horizontalSpace,
                  FeatureCard(
                    iconPath: 'assets/icon/virtual_card.svg',
                    label: 'Virtual Card',
                    onTap: () => context.router.push(VirtualCardRoute()),
                  ),
                ],
              ),
              40.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FeatureCard(
                    iconPath: 'assets/icon/crypto.svg',
                    label: 'Crypto',
                    onTap: () => context.router.push(CryptoRoute()),
                  ),
                  16.horizontalSpace,
                  FeatureCard(
                    iconPath: 'assets/icon/airplane_green.svg',
                    label: 'Flight Booking',
                    onTap: () => context.router.push(FlightBookRoute()),
                  ),
                  16.horizontalSpace,
                  FeatureCard(
                    iconPath: 'assets/icon/cart_green.svg',
                    label: 'Shopping',
                    onTap: () => context.router.push(ShoppingRoute()),
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
