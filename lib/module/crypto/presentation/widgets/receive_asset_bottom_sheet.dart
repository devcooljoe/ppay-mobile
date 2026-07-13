import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart' as msg;
import 'package:ppay_mobile/module/crypto/domain/entities/crypto_entity.dart';
import 'package:ppay_mobile/module/crypto/presentation/providers/crypto_providers.dart';
import 'package:ppay_mobile/module/crypto/presentation/utils/network_utils.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/skeleton_loader.dart';
import 'package:qr_flutter/qr_flutter.dart';

void showReceiveAssetBottomSheet(BuildContext context, CryptoRateEntity rate) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => UncontrolledProviderScope(
      container: ProviderScope.containerOf(context),
      child: _ReceiveAssetBottomSheet(rate: rate),
    ),
  );
}

class _ReceiveAssetBottomSheet extends HookConsumerWidget {
  final CryptoRateEntity rate;
  const _ReceiveAssetBottomSheet({required this.rate});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedNetwork = useState<String?>(null);
    final networks = NetworkUtils.getNetworksForCurrency(rate.currency);

    final walletAsync = selectedNetwork.value != null
        ? ref.watch(walletAddressProvider(rate.currency, selectedNetwork.value!.toLowerCase()))
        : null;

    void showNetworkPicker() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (_) => FractionallySizedBox(
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
                  decoration: BoxDecoration(color: PPaymobileColors.mainScreenBackground, borderRadius: BorderRadius.vertical(top: Radius.circular(36).r)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Select Network', style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.black)),
                      16.verticalSpace,
                      Expanded(
                        child: ListView.separated(
                          itemCount: networks.length,
                          separatorBuilder: (_, __) => Divider(height: 1.h, color: PPaymobileColors.deepBackgroundColor),
                          itemBuilder: (ctx, i) {
                            final network = networks[i];
                            return ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(network, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
                              trailing: selectedNetwork.value == network
                                  ? Icon(Icons.check_circle, color: PPaymobileColors.buttonColor, size: 20.w)
                                  : null,
                              onTap: () {
                                selectedNetwork.value = network;
                                Navigator.pop(ctx);
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
        ),
      );
    }

    return FractionallySizedBox(
      heightFactor: 0.85,
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
              decoration: BoxDecoration(color: PPaymobileColors.mainScreenBackground, borderRadius: BorderRadius.vertical(top: Radius.circular(36).r)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    children: [
                      CachedNetworkImage(
                        imageUrl: rate.logoUrl,
                        width: 36.w,
                        height: 36.w,
                        errorWidget: (_, __, ___) => Container(
                          width: 36.w,
                          height: 36.w,
                          decoration: BoxDecoration(color: PPaymobileColors.textfiedBorder, shape: BoxShape.circle),
                          child: Center(child: Text(rate.currency[0].toUpperCase(), style: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w600))),
                        ),
                      ),
                      12.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Receive ${rate.name}', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w600)),
                          Text(rate.currency.toUpperCase(), style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 12.sp)),
                        ],
                      ),
                    ],
                  ),
                  24.verticalSpace,

                  // Network selector
                  Text('Network', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
                  8.verticalSpace,
                  GestureDetector(
                    onTap: showNetworkPicker,
                    child: Container(
                      height: 52.h,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: BoxDecoration(
                        border: Border.all(color: PPaymobileColors.textfiedBorder, width: 1.w),
                        borderRadius: BorderRadius.circular(8).r,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              selectedNetwork.value ?? 'Select network',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: selectedNetwork.value != null ? Colors.black : PPaymobileColors.textfiedBorder,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SvgPicture.asset('assets/icon/arrow_down.svg', width: 12.w, height: 12.w),
                        ],
                      ),
                    ),
                  ),
                  24.verticalSpace,

                  // Wallet address area
                  Expanded(
                    child: selectedNetwork.value == null
                        ? Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.lock_outline, size: 48.w, color: PPaymobileColors.textfiedBorder),
                                12.verticalSpace,
                                Text('Select a network to view your wallet address',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 13.sp)),
                              ],
                            ),
                          )
                        : walletAsync == null
                            ? const SizedBox.shrink()
                            : walletAsync.when(
                                loading: () => Center(child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SkeletonLoader(width: 180.w, height: 180.w),
                                    16.verticalSpace,
                                    SkeletonLoader(width: double.infinity, height: 16.h),
                                  ],
                                )),
                                error: (e, _) => Center(
                                  child: Text(e.toString().replaceAll('Exception: ', ''),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.redTextfield, fontSize: 13.sp)),
                                ),
                                data: (wallet) => Column(
                                  children: [
                                    Center(
                                      child: QrImageView(
                                        data: wallet.address,
                                        version: QrVersions.auto,
                                        size: 180.w,
                                      ),
                                    ),
                                    16.verticalSpace,
                                    Container(
                                      padding: EdgeInsets.all(12).r,
                                      decoration: BoxDecoration(
                                        color: PPaymobileColors.deepBackgroundColor,
                                        borderRadius: BorderRadius.circular(8).r,
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(wallet.address,
                                                style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w500)),
                                          ),
                                          8.horizontalSpace,
                                          GestureDetector(
                                            onTap: () {
                                              Clipboard.setData(ClipboardData(text: wallet.address));
                                              msg.MessageHandler.showSuccessSnackBar(context, 'Address copied!');
                                            },
                                            child: SvgPicture.asset('assets/icon/paste_black1.svg', width: 20.w, height: 20.w),
                                          ),
                                        ],
                                      ),
                                    ),
                                    12.verticalSpace,
                                    Container(
                                      padding: EdgeInsets.all(12).r,
                                      decoration: BoxDecoration(
                                        color: Colors.orange.withOpacity(0.08),
                                        borderRadius: BorderRadius.circular(8).r,
                                        border: Border.all(color: Colors.orange.withOpacity(0.3)),
                                      ),
                                      child: Text(
                                        'Only send ${rate.currency.toUpperCase()} on the ${wallet.network.toUpperCase()} network to this address. Sending other assets may result in permanent loss.',
                                        style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.orange.shade800, fontSize: 11.sp),
                                      ),
                                    ),
                                    16.verticalSpace,
                                    PPButton(
                                      text: 'Copy Address',
                                      onPressed: () {
                                        Clipboard.setData(ClipboardData(text: wallet.address));
                                        msg.MessageHandler.showSuccessSnackBar(context, 'Address copied!');
                                      },
                                    ),
                                  ],
                                ),
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
