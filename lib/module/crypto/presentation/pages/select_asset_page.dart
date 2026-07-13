import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/module/crypto/domain/entities/crypto_entity.dart';
import 'package:ppay_mobile/module/crypto/presentation/providers/crypto_providers.dart';
import 'package:ppay_mobile/module/crypto/presentation/widgets/receive_asset_bottom_sheet.dart';
import 'package:ppay_mobile/shared/utils/amount_formatter.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/skeleton_loader.dart';

@RoutePage()
class SelectAssetPage extends HookConsumerWidget {
  final bool isForSelling;
  final bool isForReceiving;

  const SelectAssetPage({
    super.key,
    this.isForSelling = false,
    this.isForReceiving = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ratesState = ref.watch(cryptoRatesProvider);
    final searchController = useTextEditingController();
    final query = useState('');

    useEffect(() {
      searchController.addListener(() => query.value = searchController.text.toLowerCase());
      return null;
    }, []);

    final rates = (ratesState.value ?? []).where((r) {
      if (query.value.isEmpty) return true;
      return r.name.toLowerCase().contains(query.value) ||
          r.currency.toLowerCase().contains(query.value);
    }).toList();

    String title() {
      if (isForReceiving) return 'Receive Crypto';
      if (isForSelling) return 'Sell Crypto';
      return 'Buy Crypto';
    }

    void onAssetTap(CryptoRateEntity rate) {
      if (isForReceiving) {
        showReceiveAssetBottomSheet(context, rate);
        return;
      }
      context.router.push(FetchWalletProgressRoute(
        currency: rate.currency,
        cryptoName: rate.name,
        logoUrl: rate.logoUrl,
        isForSelling: isForSelling,
        rate: rate,
      ));
    }

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(title: title()),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              child: SizedBox(
                height: 48.h,
                child: TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(12.r),
                      child: SvgPicture.asset('assets/icon/bank_search.svg', fit: BoxFit.scaleDown),
                    ),
                    hintText: 'Search asset',
                    hintStyle: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.textfiedBorder, fontSize: 14.sp),
                    filled: true,
                    fillColor: PPaymobileColors.deepBackgroundColor,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8).r, borderSide: BorderSide.none),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ratesState.isLoading
                  ? ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      itemCount: 6,
                      itemBuilder: (_, __) => Padding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        child: Row(children: [
                          SkeletonLoader(width: 44.w, height: 44.w, borderRadius: BorderRadius.circular(100.r)),
                          12.horizontalSpace,
                          Expanded(child: SkeletonLoader(width: double.infinity, height: 14.h)),
                          60.horizontalSpace,
                          SkeletonLoader(width: 60.w, height: 14.h),
                        ]),
                      ),
                    )
                  : ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      itemCount: rates.length,
                      separatorBuilder: (_, __) => Divider(height: 1.h, color: PPaymobileColors.deepBackgroundColor),
                      itemBuilder: (context, index) {
                        final rate = rates[index];
                        final price = double.tryParse(rate.price) ?? 0;
                        final rateVal = isForSelling
                            ? double.tryParse(rate.sellRatePerDollar) ?? 0
                            : double.tryParse(rate.buyRatePerDollar) ?? 0;
                        final priceInNaira = price * rateVal;

                        return ListTile(
                          contentPadding: EdgeInsets.symmetric(vertical: 6.h),
                          leading: CachedNetworkImage(
                            imageUrl: rate.logoUrl,
                            width: 44.w,
                            height: 44.w,
                            errorWidget: (_, __, ___) => Container(
                              width: 44.w,
                              height: 44.w,
                              decoration: BoxDecoration(color: PPaymobileColors.textfiedBorder, shape: BoxShape.circle),
                              child: Center(child: Text(rate.currency[0].toUpperCase(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16.sp))),
                            ),
                          ),
                          title: Text(rate.name, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
                          subtitle: Text(rate.currency.toUpperCase(), style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 12.sp)),
                          trailing: isForReceiving
                              ? null
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text('₦${AmountFormatter.formatBalance(priceInNaira.toStringAsFixed(2))}',
                                        style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 13.sp, fontWeight: FontWeight.w500)),
                                    if (isForSelling)
                                      Text('Bal: ${rate.value} ${rate.currency.toUpperCase()}',
                                          style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 11.sp)),
                                  ],
                                ),
                          onTap: () => onAssetTap(rate),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
