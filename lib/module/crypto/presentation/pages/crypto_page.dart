import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/shared/models/crypto_transactions_model.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/crypto_action_button.dart';
import 'package:ppay_mobile/shared/widgets/crypto_asset_card.dart';
import 'package:ppay_mobile/shared/widgets/section_header.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';

@RoutePage()
class CryptoPage extends HookConsumerWidget {
  const CryptoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(
        title: 'Crypto',
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 43.w,
                right: 43.w,
                bottom: 38.h,
                top: 28.h,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                color: PPaymobileColors.backgroundColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Total Asset Balance',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.mainScreenBackground,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  2.verticalSpace,
                  Text(
                    '₦680,000.90',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.mainScreenBackground,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  2.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 13.w,
                        width: 13.w,
                        child: SvgPicture.asset(
                          'assets/icon/colored_arrow_up.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                      3.horizontalSpace,
                      Text(
                        '0.09%',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: PPaymobileColors.cryptoNumbersColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  24.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CryptoActionButton(
                        iconPath: 'assets/icon/add_white.svg',
                        label: 'Buy',
                        onTap: () => context.router.push(BuyCryptoRoute()),
                      ),
                      56.horizontalSpace,
                      CryptoActionButton(
                        iconPath: 'assets/icon/minus_white.svg',
                        label: 'Sell',
                        onTap: () => context.router.push(SellCryptoRoute()),
                      ),
                      56.horizontalSpace,
                      CryptoActionButton(
                        iconPath: 'assets/icon/fund.svg',
                        label: 'Receive',
                        onTap: () => context.router.push(ReceiveCryptoRoute()),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            24.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionHeader(
                    title: 'Assets',
                    actionText: 'See all',
                    onActionTap: () => context.router.push(AssetsRoute()),
                  ),
                  21.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CryptoAssetCard(
                        imagePath: 'assets/images/bitcoin.png',
                        symbol: 'BTC',
                        name: 'Bitcoin',
                        price: '₦3,100,000',
                        amount: '0.000005 BTC',
                        percentageChange: '0.09%',
                        percentageIconPath: 'assets/icon/colored_arrow_green_up.svg',
                        percentageColor: PPaymobileColors.doneTextColor,
                      ),
                      16.horizontalSpace,
                      CryptoAssetCard(
                        imagePath: 'assets/images/ethereum.png',
                        symbol: 'ETH',
                        name: 'Ethereum',
                        price: '₦54,000.90',
                        amount: '0.000005 ETH',
                        percentageChange: '0.09%',
                        percentageIconPath: 'assets/icon/colored_arrow_down.svg',
                        percentageColor: PPaymobileColors.cryptoNumbersColor,
                      ),
                      16.horizontalSpace,
                      CryptoAssetCard(
                        imagePath: 'assets/images/solana.png',
                        symbol: 'SOL',
                        name: 'Solana',
                        price: '₦65,000.20',
                        amount: '0.000005 SOL',
                        percentageChange: '0.09%',
                        percentageIconPath: 'assets/icon/colored_arrow_down.svg',
                        percentageColor: PPaymobileColors.cryptoNumbersColor,
                      ),
                    ],
                  ),
                  37.verticalSpace,
                  SectionHeader(
                    title: 'Transactions',
                    actionText: 'See all',
                    onActionTap: () => context.router.push(CryptoTransactionsHistoryRoute()),
                  ),
                  37.verticalSpace,
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (_, _) => 24.verticalSpace,
                    itemCount: cryptoTransaction.length,
                    itemBuilder: (context, cryptoIndex) {
                      final crypto = cryptoTransaction[cryptoIndex];

                      return SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 45.w,
                                  width: 45.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    crypto.containerImage,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                5.horizontalSpace,
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      crypto.cryptoTitle,
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      crypto.cryptosubTitle,
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  crypto.cryptoPrice,
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  crypto.cryptoStatus,
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: crypto.cryptoStatusColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
