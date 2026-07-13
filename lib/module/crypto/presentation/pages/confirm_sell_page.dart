import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/crypto/domain/entities/crypto_entity.dart';
import 'package:ppay_mobile/module/crypto/presentation/providers/crypto_providers.dart';
import 'package:ppay_mobile/module/dashboard/providers/wallet_provider.dart';
import 'package:ppay_mobile/shared/utils/amount_formatter.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/security_pin_bottomsheet.dart';

@RoutePage()
class ConfirmSellPage extends ConsumerWidget {
  final CryptoRateEntity rate;
  final CryptoWalletEntity wallet;
  final double cryptoAmount;
  final double nairaValue;

  const ConfirmSellPage({
    super.key,
    required this.rate,
    required this.wallet,
    required this.cryptoAmount,
    required this.nairaValue,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sellState = ref.watch(sellCryptoProvider);

    Future<void> onSell() async {
      final confirmed = await showSecurityPinBottomsheet(context);
      if (!confirmed) return;

      await ref.read(sellCryptoProvider.notifier).call(
        amount: cryptoAmount,
        walletAddressId: wallet.id,
      );

      if (!context.mounted) return;
      final state = ref.read(sellCryptoProvider);
      if (state.hasError) {
        MessageHandler.showErrorSnackBar(context, state.error.toString());
      } else {
        ref.read(walletProvider.notifier).fetch();
        ref.read(estimatedAssetValueProvider.notifier).refresh();
        context.router.replace(CryptoTransactionSuccessfulRoute(
          cryptoAmount: cryptoAmount,
          currency: rate.currency,
          nairaAmount: nairaValue,
          logoUrl: rate.logoUrl,
          isBuy: false,
        ));
      }
    }

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(title: 'Confirm Sale'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    32.verticalSpace,
                    Center(
                      child: CachedNetworkImage(
                        imageUrl: rate.logoUrl,
                        width: 64.w,
                        height: 64.w,
                        errorWidget: (_, __, ___) => Container(
                          width: 64.w,
                          height: 64.w,
                          decoration: BoxDecoration(color: PPaymobileColors.textfiedBorder, shape: BoxShape.circle),
                          child: Center(child: Text(rate.currency[0].toUpperCase(), style: TextStyle(color: Colors.white, fontSize: 24.sp, fontWeight: FontWeight.w700))),
                        ),
                      ),
                    ),
                    16.verticalSpace,
                    Center(
                      child: Text(
                        '${cryptoAmount.toStringAsFixed(6)} ${rate.currency.toUpperCase()}',
                        style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 28.sp, fontWeight: FontWeight.w700),
                      ),
                    ),
                    8.verticalSpace,
                    Center(
                      child: Text(
                        '≈ ₦${AmountFormatter.formatBalance(nairaValue.toStringAsFixed(2))}',
                        style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 14.sp),
                      ),
                    ),
                    32.verticalSpace,
                    _DetailRow(label: 'Asset', value: rate.name),
                    _DetailRow(label: 'You sell', value: '${cryptoAmount.toStringAsFixed(6)} ${rate.currency.toUpperCase()}'),
                    _DetailRow(label: 'You receive', value: '₦${AmountFormatter.formatBalance(nairaValue.toStringAsFixed(2))}'),
                    _DetailRow(
                      label: 'Sell rate',
                      value: '1 ${rate.currency.toUpperCase()} ≈ ₦${AmountFormatter.formatBalance(rate.sellRatePerDollar)}',
                    ),
                    32.verticalSpace,
                    Container(
                      padding: EdgeInsets.all(14).r,
                      decoration: BoxDecoration(
                        color: PPaymobileColors.deepBackgroundColor,
                        borderRadius: BorderRadius.circular(8).r,
                      ),
                      child: Text(
                        'The naira equivalent will be credited to your main wallet after the sale is processed.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 12.sp),
                      ),
                    ),
                  ],
                ),
              ),
              PPButton(
                text: sellState.isLoading ? 'Processing...' : 'Sell ${rate.currency.toUpperCase()}',
                onPressed: sellState.isLoading ? null : onSell,
              ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 14.sp)),
          Flexible(
            child: Text(value, textAlign: TextAlign.end, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}
