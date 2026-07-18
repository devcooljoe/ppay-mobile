import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart' as msg_handler;
import 'package:ppay_mobile/module/crypto/domain/entities/crypto_entity.dart';
import 'package:ppay_mobile/module/crypto/presentation/providers/crypto_providers.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/skeleton_loader.dart';

@RoutePage()
class ReceiveCryptoPage extends HookConsumerWidget {
  const ReceiveCryptoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedRate = useState<CryptoRateEntity?>(null);
    final selectedNetwork = useState<String?>(null);
    final ratesState = ref.watch(getCryptoRatesProvider);
    final walletState = ref.watch(getCryptoWalletProvider);

    useEffect(() {
      Future.microtask(() {
        ref.read(getCryptoRatesProvider.notifier).call();
      });
      return null;
    }, []);

    useEffect(() {
      final rates = ratesState.value;
      if (rates != null && rates.isNotEmpty && selectedRate.value == null) {
        selectedRate.value = rates.first;
      }
      return null;
    }, [ratesState.value]);

    void fetchWallet() {
      final rate = selectedRate.value;
      if (rate == null) return;
      ref.read(getCryptoWalletProvider.notifier).call(
        rate.currency,
        network: selectedNetwork.value,
      );
    }

    void showAssetPicker() {
      final rates = ratesState.value ?? [];
      if (rates.isEmpty) return;
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (_) => _AssetPickerSheet(
          rates: rates,
          selected: selectedRate.value,
          onSelect: (r) {
            selectedRate.value = r;
            selectedNetwork.value = null;
          },
        ),
      );
    }

    void showNetworkPicker() {
      final rate = selectedRate.value;
      if (rate == null) return;
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (_) => _NetworkPickerSheet(
          currency: rate.currency,
          selected: selectedNetwork.value,
          onSelect: (n) => selectedNetwork.value = n,
        ),
      );
    }

    final wallet = walletState.value;

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(title: 'Receive Crypto'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              37.verticalSpace,
              Text(
                'Enter Details',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.verticalSpace,
              Text(
                'Select the crypto asset and network to get your unique wallet address',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              45.verticalSpace,
              Text(
                'Select Asset',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.verticalSpace,
              GestureDetector(
                onTap: showAssetPicker,
                child: Container(
                  height: 68.h,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.w, color: PPaymobileColors.textfiedBorder),
                    borderRadius: BorderRadius.circular(6).r,
                  ),
                  child: Row(
                    children: [
                      selectedRate.value != null
                          ? CachedNetworkImage(
                              imageUrl: selectedRate.value!.logoUrl,
                              width: 32.w,
                              height: 32.w,
                              errorWidget: (_, __, ___) => Container(
                                width: 32.w,
                                height: 32.w,
                                decoration: BoxDecoration(
                                  color: PPaymobileColors.textfiedBorder,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            )
                          : SkeletonLoader(width: 32.w, height: 32.w, borderRadius: BorderRadius.circular(100.r)),
                      12.horizontalSpace,
                      Expanded(
                        child: Text(
                          selectedRate.value?.name ?? 'Select asset',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SvgPicture.asset('assets/icon/arrow_down.svg', width: 12.w, height: 12.w, fit: BoxFit.scaleDown),
                    ],
                  ),
                ),
              ),
              45.verticalSpace,
              Text(
                'Select Network',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.verticalSpace,
              GestureDetector(
                onTap: showNetworkPicker,
                child: Container(
                  height: 68.h,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.w, color: PPaymobileColors.textfiedBorder),
                    borderRadius: BorderRadius.circular(6).r,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          selectedNetwork.value ?? 'Select network (optional)',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: selectedNetwork.value != null ? Colors.black : PPaymobileColors.svgIconColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SvgPicture.asset('assets/icon/arrow_down.svg', width: 12.w, height: 12.w, fit: BoxFit.scaleDown),
                    ],
                  ),
                ),
              ),
              if (wallet != null) ...[
                32.verticalSpace,
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20).r,
                  decoration: BoxDecoration(
                    color: PPaymobileColors.deepBackgroundColor,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Wallet Address',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: PPaymobileColors.svgIconColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      8.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              wallet.address,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          8.horizontalSpace,
                          TouchOpacity(
                            onTap: () {
                              Clipboard.setData(ClipboardData(text: wallet.address));
                              msg_handler.MessageHandler.showSuccessSnackBar(context, 'Address copied!');
                            },
                            child: SvgPicture.asset(
                              'assets/icon/paste_black1.svg',
                              width: 20.w,
                              height: 20.w,
                            ),
                          ),
                        ],
                      ),
                      if (wallet.network.isNotEmpty) ...[
                        8.verticalSpace,
                        Text(
                          'Network: ${wallet.network}',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.svgIconColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
              40.verticalSpace,
              walletState.isLoading
                  ? SkeletonLoader(width: double.infinity, height: 50.h, borderRadius: BorderRadius.circular(56.r))
                  : PPButton(
                      text: wallet != null ? 'Refresh Address' : 'Get Wallet Address',
                      onPressed: fetchWallet,
                    ),
              if (walletState.hasError) ...[
                8.verticalSpace,
                Text(
                  msg_handler.MessageHandler.getErrorMessage(walletState.error),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.redTextfield,
                    fontSize: 12.sp,
                  ),
                ),
              ],
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}

class _AssetPickerSheet extends StatelessWidget {
  final List<CryptoRateEntity> rates;
  final CryptoRateEntity? selected;
  final ValueChanged<CryptoRateEntity> onSelect;

  const _AssetPickerSheet({required this.rates, required this.selected, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.6,
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 60.w,
              width: 60.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30).r,
                color: PPaymobileColors.mainScreenBackground,
              ),
              child: Center(child: SvgPicture.asset('assets/icon/cancel.svg', fit: BoxFit.scaleDown)),
            ),
          ),
          8.verticalSpace,
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              decoration: BoxDecoration(
                color: PPaymobileColors.mainScreenBackground,
                borderRadius: BorderRadius.vertical(top: Radius.circular(36).r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select Asset',
                    style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  16.verticalSpace,
                  Expanded(
                    child: ListView.separated(
                      itemCount: rates.length,
                      separatorBuilder: (_, __) => Divider(height: 1.h, color: PPaymobileColors.deepBackgroundColor),
                      itemBuilder: (context, index) {
                        final rate = rates[index];
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: CachedNetworkImage(
                            imageUrl: rate.logoUrl,
                            width: 40.w,
                            height: 40.w,
                            errorWidget: (_, __, ___) => Container(
                              width: 40.w,
                              height: 40.w,
                              decoration: BoxDecoration(color: PPaymobileColors.textfiedBorder, shape: BoxShape.circle),
                            ),
                          ),
                          title: Text(rate.name, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
                          subtitle: Text(rate.currency.toUpperCase(), style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 12.sp)),
                          trailing: selected?.id == rate.id ? Icon(Icons.check_circle, color: PPaymobileColors.buttonColor, size: 20.w) : null,
                          onTap: () {
                            onSelect(rate);
                            Navigator.pop(context);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NetworkPickerSheet extends StatelessWidget {
  final String currency;
  final String? selected;
  final ValueChanged<String> onSelect;

  const _NetworkPickerSheet({required this.currency, required this.selected, required this.onSelect});

  List<String> get _networks {
    switch (currency.toLowerCase()) {
      case 'btc': return ['bitcoin', 'lightning'];
      case 'eth': return ['ethereum', 'erc20'];
      case 'usdt': return ['trc20', 'erc20', 'bep20'];
      case 'bnb': return ['bep20', 'bep2'];
      case 'sol': return ['solana'];
      default: return [currency.toLowerCase()];
    }
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.5,
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 60.w,
              width: 60.w,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30).r, color: PPaymobileColors.mainScreenBackground),
              child: Center(child: SvgPicture.asset('assets/icon/cancel.svg', fit: BoxFit.scaleDown)),
            ),
          ),
          8.verticalSpace,
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              decoration: BoxDecoration(
                color: PPaymobileColors.mainScreenBackground,
                borderRadius: BorderRadius.vertical(top: Radius.circular(36).r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Select Network', style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.black)),
                  16.verticalSpace,
                  Expanded(
                    child: ListView.separated(
                      itemCount: _networks.length,
                      separatorBuilder: (_, __) => Divider(height: 1.h, color: PPaymobileColors.deepBackgroundColor),
                      itemBuilder: (context, index) {
                        final network = _networks[index];
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(network.toUpperCase(), style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
                          trailing: selected == network ? Icon(Icons.check_circle, color: PPaymobileColors.buttonColor, size: 20.w) : null,
                          onTap: () {
                            onSelect(network);
                            Navigator.pop(context);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
