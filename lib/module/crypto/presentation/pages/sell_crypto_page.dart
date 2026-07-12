import 'package:flutter/material.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/crypto/domain/entities/crypto_entity.dart';
import 'package:ppay_mobile/module/crypto/presentation/providers/crypto_providers.dart';
import 'package:ppay_mobile/shared/utils/amount_formatter.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/custom_keyboard.dart';
import 'package:ppay_mobile/shared/widgets/custom_keyboard_container.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/security_pin_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/skeleton_loader.dart';

@RoutePage()
class SellCryptoPage extends HookConsumerWidget {
  const SellCryptoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final amountText = useState('');
    final showKeyboard = useState(false);
    final selectedRate = useState<CryptoRateEntity?>(null);
    final ratesState = ref.watch(getCryptoRatesProvider);
    final walletState = ref.watch(getCryptoWalletProvider);
    final sellState = ref.watch(sellCryptoProvider);

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
        ref.read(getCryptoWalletProvider.notifier).call(rates.first.currency);
      }
      return null;
    }, [ratesState.value]);

    void onKeyTap(String value) {
      if (value == '.' && amountText.value.contains('.')) return;
      if (value == '.' && amountText.value.isEmpty) return;
      amountText.value += value;
    }

    void onDelete() {
      if (amountText.value.isNotEmpty) {
        amountText.value = amountText.value.substring(0, amountText.value.length - 1);
      }
    }

    final amount = double.tryParse(amountText.value) ?? 0;
    final rate = selectedRate.value;
    final cryptoBalance = double.tryParse(walletState.value?.balance ?? '0') ?? 0;
    final isInsufficient = amount > 0 && amount > cryptoBalance;
    final nairaEquivalent = rate != null
        ? amount * (double.tryParse(rate.sellRatePerDollar) ?? 0)
        : 0.0;

    Future<void> onSell() async {
      if (amount <= 0) {
        MessageHandler.showErrorSnackBar(context, 'Enter an amount');
        return;
      }
      if (isInsufficient) {
        MessageHandler.showErrorSnackBar(context, 'Insufficient crypto balance');
        return;
      }
      final wallet = walletState.value;
      if (wallet == null) {
        MessageHandler.showErrorSnackBar(context, 'Wallet address not found');
        return;
      }

      final confirmed = await showSecurityPinBottomsheet(context);
      if (!confirmed) return;

      await ref.read(sellCryptoProvider.notifier).call(
        amount: amount,
        walletAddressId: wallet.id,
      );

      if (!context.mounted) return;
      final state = ref.read(sellCryptoProvider);
      if (state.hasError) {
        MessageHandler.showErrorSnackBar(context, state.error.toString());
      } else {
        context.router.push(CryptoSellSucessfulRoute());
      }
    }

    void showCurrencyPicker() {
      final rates = ratesState.value ?? [];
      if (rates.isEmpty) return;
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (_) => _SellCurrencyPickerSheet(
          rates: rates,
          selected: selectedRate.value,
          onSelect: (r) {
            selectedRate.value = r;
            ref.read(getCryptoWalletProvider.notifier).call(r.currency);
          },
        ),
      );
    }

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(title: 'Sell Crypto', onBackPressed: () => Navigator.pop(context)),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => showKeyboard.value = false,
                  child: ListView(
                    children: [
                      37.verticalSpace,
                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: showCurrencyPicker,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              rate != null
                                  ? CachedNetworkImage(
                                      imageUrl: rate.logoUrl,
                                      width: 24.w,
                                      height: 24.w,
                                      errorWidget: (_, __, ___) => Container(
                                        width: 24.w,
                                        height: 24.w,
                                        decoration: BoxDecoration(
                                          color: PPaymobileColors.textfiedBorder,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    )
                                  : SkeletonLoader(width: 24.w, height: 24.w, borderRadius: BorderRadius.circular(100.r)),
                              8.horizontalSpace,
                              RichText(
                                text: TextSpan(
                                  text: 'Balance: ',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: PPaymobileColors.svgIconColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: walletState.isLoading
                                          ? '...'
                                          : '${AmountFormatter.formatBalance(walletState.value?.balance ?? '0')} ${rate?.currency.toUpperCase() ?? ''}',
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              8.horizontalSpace,
                              SvgPicture.asset('assets/icon/arrow_down.svg', width: 12.w, height: 12.w),
                            ],
                          ),
                        ),
                      ),
                      20.verticalSpace,
                      Center(
                        child: TouchOpacity(
                          onTap: () => showKeyboard.value = true,
                          child: RichText(
                            text: TextSpan(
                              text: '',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              children: [
                                TextSpan(
                                  text: amountText.value.isEmpty ? '0' : amountText.value,
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: isInsufficient ? PPaymobileColors.redTextfield : Colors.black,
                                    fontSize: 48.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: ' ${rate?.currency.toUpperCase() ?? ''}',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: PPaymobileColors.svgIconColor,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      if (isInsufficient) ...[
                        4.verticalSpace,
                        Center(
                          child: Text(
                            'Insufficient crypto balance',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: PPaymobileColors.redTextfield,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                      if (amount > 0 && rate != null) ...[
                        8.verticalSpace,
                        Center(
                          child: Text(
                            '≈ ₦${AmountFormatter.formatBalance(nairaEquivalent.toStringAsFixed(2))}',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: PPaymobileColors.svgIconColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                      45.verticalSpace,
                      if (rate != null)
                        Text(
                          '1 ${rate.currency.toUpperCase()} ≈ ₦${AmountFormatter.formatBalance(rate.sellRatePerDollar)}',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.svgIconColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      40.verticalSpace,
                      Text(
                        textAlign: TextAlign.center,
                        'The equivalent naira amount will be deposited into your main wallet',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: PPaymobileColors.svgIconColor,
                        ),
                      ),
                      12.verticalSpace,
                      PPButton(
                        text: sellState.isLoading ? 'Processing...' : 'Sell',
                        onPressed: sellState.isLoading ? null : onSell,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              height: showKeyboard.value ? 424.h : 0,
              child: showKeyboard.value
                  ? KeyboardContainer(
                      child: CustomKeyboard(onKeyTap: onKeyTap, onDelete: onDelete),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

class _SellCurrencyPickerSheet extends StatelessWidget {
  final List<CryptoRateEntity> rates;
  final CryptoRateEntity? selected;
  final ValueChanged<CryptoRateEntity> onSelect;

  const _SellCurrencyPickerSheet({
    required this.rates,
    required this.selected,
    required this.onSelect,
  });

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
              child: Center(
                child: SvgPicture.asset('assets/icon/cancel.svg', fit: BoxFit.scaleDown),
              ),
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
                    'Select Asset to Sell',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  16.verticalSpace,
                  Expanded(
                    child: ListView.separated(
                      itemCount: rates.length,
                      separatorBuilder: (_, __) => Divider(height: 1.h, color: PPaymobileColors.deepBackgroundColor),
                      itemBuilder: (context, index) {
                        final rate = rates[index];
                        final isSelected = selected?.id == rate.id;
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: CachedNetworkImage(
                            imageUrl: rate.logoUrl,
                            width: 40.w,
                            height: 40.w,
                            errorWidget: (_, __, ___) => Container(
                              width: 40.w,
                              height: 40.w,
                              decoration: BoxDecoration(
                                color: PPaymobileColors.textfiedBorder,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          title: Text(
                            rate.name,
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Text(
                            '${rate.currency.toUpperCase()} • Balance: ${rate.value}',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: PPaymobileColors.svgIconColor,
                              fontSize: 12.sp,
                            ),
                          ),
                          trailing: isSelected
                              ? Icon(Icons.check_circle, color: PPaymobileColors.buttonColor, size: 20.w)
                              : null,
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
