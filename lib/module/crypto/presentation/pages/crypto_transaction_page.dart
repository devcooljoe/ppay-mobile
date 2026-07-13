import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/crypto/domain/entities/crypto_entity.dart';
import 'package:ppay_mobile/module/crypto/presentation/providers/crypto_providers.dart';
import 'package:ppay_mobile/module/dashboard/providers/wallet_provider.dart';
import 'package:ppay_mobile/shared/utils/amount_formatter.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/custom_keyboard.dart';
import 'package:ppay_mobile/shared/widgets/custom_keyboard_container.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class CryptoTransactionPage extends HookConsumerWidget {
  final CryptoRateEntity rate;
  final CryptoWalletEntity wallet;
  final bool isForSelling;

  const CryptoTransactionPage({
    super.key,
    required this.rate,
    required this.wallet,
    this.isForSelling = false,
  });

  static const double _minBuyNaira = 6000;

  String _formatDisplay(String raw) {
    if (raw.isEmpty || raw == '0') return isForSelling ? '0' : '0.00';
    if (isForSelling) return raw;
    final number = int.tryParse(raw) ?? 0;
    return '${number.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}';
  }

  double _fontSize(String raw) {
    final len = _formatDisplay(raw).length;
    if (isForSelling) {
      if (len <= 5) return 58.sp;
      if (len <= 8) return 46.sp;
      return 38.sp;
    } else {
      if (len <= 6) return 58.sp;
      if (len <= 9) return 48.sp;
      if (len <= 12) return 40.sp;
      return 32.sp;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final amountText = useState('0');
    final walletState = ref.watch(walletProvider);

    final price = double.tryParse(rate.price) ?? 0;
    final nairaRate = price *
        (isForSelling
            ? (double.tryParse(rate.sellRatePerDollar) ?? 0)
            : (double.tryParse(rate.buyRatePerDollar) ?? 0));

    final amount = double.tryParse(amountText.value) ?? 0;
    final cryptoAmount = (!isForSelling && nairaRate > 0) ? amount / nairaRate : 0.0;
    final nairaValue = (isForSelling && nairaRate > 0) ? amount * nairaRate : 0.0;

    final walletBalance = double.tryParse(walletState.value?.balance ?? '0') ?? 0;
    final cryptoBalance = double.tryParse(wallet.balance) ?? 0;

    final isInsufficient = isForSelling
        ? (amount > 0 && amount > cryptoBalance)
        : (amount > 0 && amount > walletBalance);
    final isBelowMin = !isForSelling && amount > 0 && amount < _minBuyNaira;

    void onKeyTap(String value) {
      if (isForSelling) {
        if (value == '.' && amountText.value.contains('.')) return;
        if (value == '.' && amountText.value == '0') {
          amountText.value = '0.';
          return;
        }
        final parts = amountText.value.split('.');
        if (parts.length > 1 && parts[1].length >= 6) return;
        if (amountText.value.replaceAll('.', '').length >= 10) return;
      } else {
        if (value == '.') return;
        if (amountText.value == '0' && value == '0') return;
        if (amountText.value.length >= 8) return;
      }
      if (amountText.value == '0' && value != '.') {
        amountText.value = value;
      } else {
        amountText.value += value;
      }
    }

    void onDelete() {
      if (amountText.value.length > 1) {
        amountText.value = amountText.value.substring(0, amountText.value.length - 1);
      } else {
        amountText.value = '0';
      }
    }

    void onMax() {
      if (isForSelling) {
        amountText.value = cryptoBalance
            .toStringAsFixed(6)
            .replaceAll(RegExp(r'0+$'), '')
            .replaceAll(RegExp(r'\.$'), '');
        if (amountText.value.isEmpty) amountText.value = '0';
      } else {
        amountText.value = walletBalance.toStringAsFixed(0);
      }
    }

    void onContinue() {
      if (amount <= 0) {
        MessageHandler.showErrorSnackBar(context, 'Enter an amount');
        return;
      }
      if (isBelowMin) {
        MessageHandler.showErrorSnackBar(context, 'Minimum buy amount is ₦6,000');
        return;
      }
      if (isInsufficient) {
        MessageHandler.showErrorSnackBar(
          context,
          isForSelling
              ? 'Insufficient ${rate.currency.toUpperCase()} balance'
              : 'Insufficient wallet balance',
        );
        return;
      }
      if (isForSelling) {
        context.router.push(ConfirmSellRoute(
          rate: rate,
          wallet: wallet,
          cryptoAmount: amount,
          nairaValue: nairaValue,
        ));
      } else {
        context.router.push(ConfirmBuyRoute(
          rate: rate,
          wallet: wallet,
          nairaAmount: amount,
          cryptoAmount: cryptoAmount,
        ));
      }
    }

    final isValid = amount > 0 && !isBelowMin && !isInsufficient;

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(title: '${isForSelling ? 'Sell' : 'Buy'} ${rate.currency.toUpperCase()}'),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    69.verticalSpace,

                    // Balance row + MAX
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CachedNetworkImage(
                          imageUrl: rate.logoUrl,
                          width: 20.w,
                          height: 20.w,
                          errorWidget: (_, __, ___) => Container(
                            width: 20.w,
                            height: 20.w,
                            decoration: BoxDecoration(color: PPaymobileColors.textfiedBorder, shape: BoxShape.circle),
                            child: Center(child: Text(rate.currency[0].toUpperCase(), style: TextStyle(color: Colors.white, fontSize: 10.sp, fontWeight: FontWeight.w600))),
                          ),
                        ),
                        6.horizontalSpace,
                        if (isForSelling)
                          Text(
                            'Bal: ${cryptoBalance.toStringAsFixed(6)} ${rate.currency.toUpperCase()}',
                            style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 14.sp, color: PPaymobileColors.svgIconColor),
                          )
                        else ...[
                          Text('Bal: ', style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 14.sp, color: PPaymobileColors.svgIconColor)),
                          Text('₦', style: TextStyle(fontFamily: 'Roboto', fontSize: 14.sp, color: PPaymobileColors.svgIconColor)),
                          Text(
                            AmountFormatter.formatBalance(walletBalance.toStringAsFixed(0)),
                            style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 14.sp, color: PPaymobileColors.svgIconColor),
                          ),
                        ],
                        8.horizontalSpace,
                        TouchOpacity(
                          onTap: onMax,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                            decoration: BoxDecoration(
                              color: PPaymobileColors.buttonColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: Text('MAX', style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 12.sp, color: PPaymobileColors.buttonColor, fontWeight: FontWeight.w700)),
                          ),
                        ),
                      ],
                    ),

                    16.verticalSpace,

                    // Large amount display
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        if (!isForSelling)
                          Text(
                            '₦',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: (isInsufficient || isBelowMin) ? PPaymobileColors.redTextfield : Colors.black,
                              fontSize: _fontSize(amountText.value) * 0.6,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        Text(
                          _formatDisplay(amountText.value),
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: (isInsufficient || isBelowMin) ? PPaymobileColors.redTextfield : Colors.black,
                            fontSize: _fontSize(amountText.value),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if (isForSelling) ...[
                          8.horizontalSpace,
                          Text(
                            rate.currency.toUpperCase(),
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: PPaymobileColors.svgIconColor,
                              fontSize: _fontSize(amountText.value) * 0.45,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ],
                    ),

                    // Error messages
                    if (isBelowMin) ...[
                      8.verticalSpace,
                      Text(
                        'Minimum purchase is ₦6,000',
                        style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 12.sp, color: PPaymobileColors.redTextfield),
                      ),
                    ],
                    if (isInsufficient) ...[
                      8.verticalSpace,
                      Text(
                        isForSelling ? 'Insufficient ${rate.currency.toUpperCase()} balance' : 'Insufficient wallet balance',
                        style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 12.sp, color: PPaymobileColors.redTextfield),
                      ),
                    ],

                    16.verticalSpace,

                    // Conversion preview
                    _ConversionPreview(
                      rate: rate,
                      amount: amount,
                      nairaRate: nairaRate,
                      isForSelling: isForSelling,
                      cryptoAmount: cryptoAmount,
                      nairaValue: nairaValue,
                    ),
                  ],
                ),
              ),
            ),

            // Keypad + button
            KeyboardContainer(
              child: Column(
                children: [
                  CustomKeyboard(
                    onKeyTap: onKeyTap,
                    onDelete: onDelete,
                    showDecimal: isForSelling,
                  ),
                  16.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: PPButton(text: 'Continue', onPressed: isValid ? onContinue : null),
                  ),
                  20.verticalSpace,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ConversionPreview extends StatelessWidget {
  final CryptoRateEntity rate;
  final double amount;
  final double nairaRate;
  final bool isForSelling;
  final double cryptoAmount;
  final double nairaValue;

  const _ConversionPreview({
    required this.rate,
    required this.amount,
    required this.nairaRate,
    required this.isForSelling,
    required this.cryptoAmount,
    required this.nairaValue,
  });

  @override
  Widget build(BuildContext context) {
    if (amount <= 0) {
      return Text(
        isForSelling ? '~₦0.00' : '~0.000000 ${rate.currency.toUpperCase()}',
        style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 13.sp, color: PPaymobileColors.svgIconColor, fontWeight: FontWeight.w600),
        textAlign: TextAlign.center,
      );
    }

    final price = double.tryParse(rate.price) ?? 0;

    if (isForSelling) {
      final dollarValue = amount * price;
      return Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('~', style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 13.sp, color: PPaymobileColors.svgIconColor, fontWeight: FontWeight.w600)),
              Text('₦', style: TextStyle(fontFamily: 'Roboto', fontSize: 13.sp, color: PPaymobileColors.svgIconColor, fontWeight: FontWeight.w600)),
              Text(AmountFormatter.formatBalance(nairaValue.toStringAsFixed(2)),
                  style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 13.sp, color: PPaymobileColors.svgIconColor, fontWeight: FontWeight.w600)),
            ],
          ),
          4.verticalSpace,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('~\$', style: TextStyle(fontFamily: 'Roboto', fontSize: 13.sp, color: PPaymobileColors.svgIconColor, fontWeight: FontWeight.w600)),
              Text(dollarValue.toStringAsFixed(2),
                  style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 13.sp, color: PPaymobileColors.svgIconColor, fontWeight: FontWeight.w600)),
            ],
          ),
        ],
      );
    } else {
      final dollarValue = cryptoAmount * price;
      return Column(
        children: [
          Text(
            '~${cryptoAmount.toStringAsFixed(6)} ${rate.currency.toUpperCase()}',
            style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 13.sp, color: PPaymobileColors.svgIconColor, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          4.verticalSpace,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('~\$', style: TextStyle(fontFamily: 'Roboto', fontSize: 13.sp, color: PPaymobileColors.svgIconColor, fontWeight: FontWeight.w600)),
              Text(dollarValue.toStringAsFixed(2),
                  style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 13.sp, color: PPaymobileColors.svgIconColor, fontWeight: FontWeight.w600)),
            ],
          ),
        ],
      );
    }
  }
}
