import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/module/crypto/domain/entities/crypto_entity.dart';
import 'package:ppay_mobile/module/crypto/presentation/providers/crypto_providers.dart';
import 'package:ppay_mobile/shared/utils/amount_formatter.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/crypto_action_button.dart';
import 'package:ppay_mobile/shared/widgets/section_header.dart';
import 'package:ppay_mobile/shared/widgets/skeleton_loader.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';

@RoutePage()
class CryptoPage extends HookConsumerWidget {
  const CryptoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ratesState = ref.watch(getCryptoRatesProvider);
    final assetValueState = ref.watch(getEstimatedAssetValueProvider);

    useEffect(() {
      Future.microtask(() {
        ref.read(getCryptoRatesProvider.notifier).call();
        ref.read(getEstimatedAssetValueProvider.notifier).call();
      });
      return null;
    }, []);

    final rates = ratesState.value ?? [];
    final totalUSD = assetValueState.value?.totalValueUSD ?? '0';
    final displayRates = rates.take(3).toList();

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(title: 'Crypto'),
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
              decoration: BoxDecoration(color: PPaymobileColors.backgroundColor),
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
                  assetValueState.isLoading
                      ? SkeletonLoader(width: 180.w, height: 36.h)
                      : Text(
                          '\$${AmountFormatter.formatBalance(totalUSD)}',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.mainScreenBackground,
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w600,
                          ),
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
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionHeader(
                    title: 'Assets',
                    actionText: 'See all',
                    onActionTap: () => context.router.push(AssetsRoute()),
                  ),
                  21.verticalSpace,
                  ratesState.isLoading
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            3,
                            (_) => SkeletonLoader(
                              width: 110.w,
                              height: 120.h,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                        )
                      : displayRates.isEmpty
                          ? const SizedBox.shrink()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: displayRates
                                  .map((rate) => _CryptoAssetCard(rate: rate))
                                  .toList(),
                            ),
                  37.verticalSpace,
                  SectionHeader(
                    title: 'Market Rates',
                    actionText: 'See all',
                    onActionTap: () => context.router.push(AllTokensRoute()),
                  ),
                  20.verticalSpace,
                  ratesState.isLoading
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 4,
                          itemBuilder: (_, __) => Padding(
                            padding: EdgeInsets.only(bottom: 24.h),
                            child: Row(
                              children: [
                                SkeletonLoader(width: 45.w, height: 45.w, borderRadius: BorderRadius.circular(100.r)),
                                12.horizontalSpace,
                                Expanded(child: SkeletonLoader(width: double.infinity, height: 14.h)),
                                SkeletonLoader(width: 80.w, height: 14.h),
                              ],
                            ),
                          ),
                        )
                      : ratesState.hasError
                          ? Center(
                              child: TextButton(
                                onPressed: () => ref.read(getCryptoRatesProvider.notifier).call(),
                                child: const Text('Retry'),
                              ),
                            )
                          : ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              separatorBuilder: (_, __) => 24.verticalSpace,
                              itemCount: rates.length,
                              itemBuilder: (context, index) {
                                final rate = rates[index];
                                return _CryptoRateRow(rate: rate);
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

class _CryptoAssetCard extends StatelessWidget {
  final CryptoRateEntity rate;
  const _CryptoAssetCard({required this.rate});

  @override
  Widget build(BuildContext context) {
    final change = double.tryParse(rate.percentChangePerHour) ?? 0;
    final isPositive = change >= 0;
    return Container(
      width: 110.w,
      padding: EdgeInsets.all(10).r,
      decoration: BoxDecoration(
        color: PPaymobileColors.deepBackgroundColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: rate.logoUrl,
            width: 32.w,
            height: 32.w,
            errorWidget: (_, __, ___) => Container(
              width: 32.w,
              height: 32.w,
              decoration: BoxDecoration(
                color: PPaymobileColors.textfiedBorder,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  rate.currency.substring(0, 1).toUpperCase(),
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          6.verticalSpace,
          Text(
            rate.currency.toUpperCase(),
            style: TextStyle(
              fontFamily: 'InstrumentSans',
              color: Colors.black,
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          2.verticalSpace,
          Text(
            '₦${AmountFormatter.formatBalance(rate.rate)}',
            style: TextStyle(
              fontFamily: 'InstrumentSans',
              color: Colors.black,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          4.verticalSpace,
          Row(
            children: [
              SvgPicture.asset(
                isPositive
                    ? 'assets/icon/colored_arrow_green_up.svg'
                    : 'assets/icon/colored_arrow_down.svg',
                width: 10.w,
                height: 10.w,
              ),
              3.horizontalSpace,
              Text(
                '${change.abs().toStringAsFixed(2)}%',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: isPositive
                      ? PPaymobileColors.doneTextColor
                      : PPaymobileColors.cryptoNumbersColor,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CryptoRateRow extends StatelessWidget {
  final CryptoRateEntity rate;
  const _CryptoRateRow({required this.rate});

  @override
  Widget build(BuildContext context) {
    final change = double.tryParse(rate.percentChangePerHour) ?? 0;
    final isPositive = change >= 0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CachedNetworkImage(
              imageUrl: rate.logoUrl,
              width: 45.w,
              height: 45.w,
              errorWidget: (_, __, ___) => Container(
                width: 45.w,
                height: 45.w,
                decoration: BoxDecoration(
                  color: PPaymobileColors.textfiedBorder,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    rate.currency.substring(0, 1).toUpperCase(),
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            12.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  rate.name,
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                4.verticalSpace,
                Text(
                  rate.currency.toUpperCase(),
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '₦${AmountFormatter.formatBalance(rate.rate)}',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            4.verticalSpace,
            Text(
              '${isPositive ? '+' : ''}${change.toStringAsFixed(2)}%',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: isPositive
                    ? PPaymobileColors.doneTextColor
                    : PPaymobileColors.cryptoNumbersColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
