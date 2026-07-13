import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/module/crypto/presentation/providers/crypto_providers.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/skeleton_loader.dart';

@RoutePage()
class ManageAssetsPage extends HookConsumerWidget {
  const ManageAssetsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ratesState = ref.watch(allCryptoRatesProvider);
    final settings = ref.watch(assetSettingsProvider);
    final searchController = useTextEditingController();
    final query = useState('');

    useEffect(() {
      searchController.addListener(() => query.value = searchController.text.toLowerCase());
      // Ensure all rates are loaded
      Future.microtask(() => ref.read(allCryptoRatesProvider.notifier).fetch());
      return null;
    }, []);

    final rates = (ratesState.value ?? []).where((r) {
      if (query.value.isEmpty) return true;
      return r.name.toLowerCase().contains(query.value) || r.currency.toLowerCase().contains(query.value);
    }).toList();

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(title: 'Manage Assets'),
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
                          SkeletonLoader(width: 48.w, height: 28.h, borderRadius: BorderRadius.circular(14.r)),
                        ]),
                      ),
                    )
                  : ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      itemCount: rates.length,
                      separatorBuilder: (_, __) => Divider(height: 1.h, color: PPaymobileColors.deepBackgroundColor),
                      itemBuilder: (context, index) {
                        final rate = rates[index];
                        final isEnabled = settings[rate.currency] ?? true;
                        return ListTile(
                          contentPadding: EdgeInsets.symmetric(vertical: 4.h),
                          leading: CachedNetworkImage(
                            imageUrl: rate.logoUrl,
                            width: 44.w,
                            height: 44.w,
                            errorWidget: (_, __, ___) => Container(
                              width: 44.w,
                              height: 44.w,
                              decoration: BoxDecoration(color: PPaymobileColors.textfiedBorder, shape: BoxShape.circle),
                              child: Center(child: Text(rate.currency[0].toUpperCase(), style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w600))),
                            ),
                          ),
                          title: Text(rate.name, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
                          subtitle: Text(rate.currency.toUpperCase(), style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 12.sp)),
                          trailing: Switch(
                            value: isEnabled,
                            activeColor: PPaymobileColors.buttonColor,
                            onChanged: (val) => ref.read(assetSettingsProvider.notifier).toggleAsset(rate.currency, val),
                          ),
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
