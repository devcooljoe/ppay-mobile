import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/module/crypto/domain/entities/crypto_entity.dart';
import 'package:ppay_mobile/module/crypto/presentation/providers/crypto_providers.dart';
import 'package:ppay_mobile/shared/utils/amount_formatter.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/crypto_action_button.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/section_header.dart';
import 'package:ppay_mobile/shared/widgets/skeleton_loader.dart';

@RoutePage()
class CryptoPage extends HookConsumerWidget {
  const CryptoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ratesState = ref.watch(cryptoRatesProvider);
    final assetValueState = ref.watch(estimatedAssetValueProvider);
    final visibilityState = ref.watch(balanceVisibilityProvider);

    useEffect(() {
      Future.microtask(() async {
        await ref.read(cryptoRatesProvider.notifier).refresh();
        ref.read(estimatedAssetValueProvider.notifier).refresh();
      });
      return null;
    }, []);

    final rates = ratesState.value ?? [];
    final totalUSD = assetValueState.value?.totalValueUSD ?? '0';
    final sortedRates = [...rates]..sort((a, b) {
        final aVal = double.tryParse(a.value) ?? 0;
        final bVal = double.tryParse(b.value) ?? 0;
        return bVal.compareTo(aVal);
      });

    Future<void> onRefresh() async {
      await Future.wait([
        ref.read(cryptoRatesProvider.notifier).refresh(),
        ref.read(estimatedAssetValueProvider.notifier).refresh(),
      ]);
    }

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(title: 'Crypto'),
      body: SafeArea(
        child: RefreshIndicator(
          color: PPaymobileColors.buttonColor,
          onRefresh: onRefresh,
          child: ListView(
            children: [
              // Header card
              Container(
                padding: EdgeInsets.only(left: 43.w, right: 43.w, bottom: 38.h, top: 28.h),
                width: double.infinity,
                decoration: BoxDecoration(color: PPaymobileColors.backgroundColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Est. Asset Value',
                            style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.mainScreenBackground, fontSize: 12.sp, fontWeight: FontWeight.w500)),
                        8.horizontalSpace,
                        GestureDetector(
                          onTap: () => ref.read(balanceVisibilityProvider.notifier).toggle(),
                          child: Icon(visibilityState ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                              color: PPaymobileColors.mainScreenBackground, size: 16.w),
                        ),
                      ],
                    ),
                    4.verticalSpace,
                    assetValueState.isLoading
                        ? SkeletonLoader(width: 180.w, height: 36.h)
                        : Text(
                            visibilityState ? '\$${AmountFormatter.formatBalance(totalUSD)}' : '••••••••',
                            style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.mainScreenBackground, fontSize: 32.sp, fontWeight: FontWeight.w600),
                          ),
                    24.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CryptoActionButton(
                          iconPath: 'assets/icon/add_white.svg',
                          label: 'Buy',
                          onTap: () => context.router.push(SelectAssetRoute(isForSelling: false)),
                        ),
                        56.horizontalSpace,
                        CryptoActionButton(
                          iconPath: 'assets/icon/minus_white.svg',
                          label: 'Sell',
                          onTap: () => context.router.push(SelectAssetRoute(isForSelling: true)),
                        ),
                        56.horizontalSpace,
                        CryptoActionButton(
                          iconPath: 'assets/icon/fund.svg',
                          label: 'Receive',
                          onTap: () => context.router.push(SelectAssetRoute(isForReceiving: true)),
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
                      title: 'Your Assets',
                      actionText: 'Manage',
                      onActionTap: () => context.router.push(ManageAssetsRoute()),
                    ),
                    21.verticalSpace,
                    ratesState.isLoading
                        ? SizedBox(
                            height: 120.h,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: 4,
                              separatorBuilder: (_, __) => 12.horizontalSpace,
                              itemBuilder: (_, __) => SkeletonLoader(width: 110.w, height: 120.h, borderRadius: BorderRadius.circular(8.r)),
                            ),
                          )
                        : sortedRates.isEmpty
                            ? Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 16.h),
                                  child: Text('No assets enabled. Tap Manage to add assets.',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 13.sp)),
                                ),
                              )
                            : SizedBox(
                                height: 120.h,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: sortedRates.length,
                                  separatorBuilder: (_, __) => 12.horizontalSpace,
                                  itemBuilder: (_, i) => _CryptoAssetCard(rate: sortedRates[i]),
                                ),
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
                              child: Row(children: [
                                SkeletonLoader(width: 45.w, height: 45.w, borderRadius: BorderRadius.circular(100.r)),
                                12.horizontalSpace,
                                Expanded(child: SkeletonLoader(width: double.infinity, height: 14.h)),
                                SkeletonLoader(width: 80.w, height: 14.h),
                              ]),
                            ),
                          )
                        : ratesState.hasError
                            ? Center(
                                child: TextButton(
                                  onPressed: () => ref.read(cryptoRatesProvider.notifier).refresh(),
                                  child: const Text('Retry'),
                                ),
                              )
                            : ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                separatorBuilder: (_, __) => 24.verticalSpace,
                                itemCount: rates.length,
                                itemBuilder: (context, index) => _CryptoRateRow(rate: rates[index]),
                              ),
                  ],
                ),
              ),
            ],
          ),
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
    final value = double.tryParse(rate.value) ?? 0;
    final price = double.tryParse(rate.price) ?? 0;
    final rateVal = double.tryParse(rate.rate) ?? 0;
    final nairaValue = value * price * rateVal;

    return Container(
      width: 110.w,
      padding: EdgeInsets.all(10).r,
      decoration: BoxDecoration(color: PPaymobileColors.deepBackgroundColor, borderRadius: BorderRadius.circular(8.r)),
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
              decoration: BoxDecoration(color: PPaymobileColors.textfiedBorder, shape: BoxShape.circle),
              child: Center(child: Text(rate.currency[0].toUpperCase(), style: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w600))),
            ),
          ),
          6.verticalSpace,
          Text(rate.name, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w600), maxLines: 1, overflow: TextOverflow.ellipsis),
          2.verticalSpace,
          Text('${value.toStringAsFixed(6)} ${rate.currency.toUpperCase()}',
              style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 10.sp), maxLines: 1, overflow: TextOverflow.ellipsis),
          4.verticalSpace,
          Text('₦${AmountFormatter.formatBalance(nairaValue.toStringAsFixed(0))}',
              style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 11.sp, fontWeight: FontWeight.w500), maxLines: 1, overflow: TextOverflow.ellipsis),
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
    final price = double.tryParse(rate.price) ?? 0;
    final rateVal = double.tryParse(rate.rate) ?? 0;
    final priceInNaira = price * rateVal;

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
                decoration: BoxDecoration(color: PPaymobileColors.textfiedBorder, shape: BoxShape.circle),
                child: Center(child: Text(rate.currency[0].toUpperCase(), style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w600))),
              ),
            ),
            12.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(rate.name, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
                4.verticalSpace,
                Text(rate.currency.toUpperCase(), style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 12.sp)),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('₦${AmountFormatter.formatBalance(priceInNaira.toStringAsFixed(0))}',
                style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
            4.verticalSpace,
            Text('${isPositive ? '+' : ''}${change.toStringAsFixed(2)}%',
                style: TextStyle(fontFamily: 'InstrumentSans', color: isPositive ? PPaymobileColors.doneTextColor : PPaymobileColors.cryptoNumbersColor, fontSize: 12.sp)),
          ],
        ),
      ],
    );
  }
}
