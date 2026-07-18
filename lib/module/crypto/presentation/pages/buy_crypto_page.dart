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
import 'package:ppay_mobile/module/dashboard/providers/wallet_provider.dart';
import 'package:ppay_mobile/shared/utils/amount_formatter.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/custom_keyboard.dart';
import 'package:ppay_mobile/shared/widgets/custom_keyboard_container.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/security_pin_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/skeleton_loader.dart';

@RoutePage()
class BuyCryptoPage extends HookConsumerWidget {
  const BuyCryptoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final amountText = useState('');
    final showKeyboard = useState(false);
    final selectedRate = useState<CryptoRateEntity?>(null);
    final walletState = ref.watch(walletProvider);
    final ratesState = ref.watch(getCryptoRatesProvider);
    final walletState2 = ref.watch(getCryptoWalletProvider);
    final buyState = ref.watch(buyCryptoProvider);

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
    final ratePerNaira = double.tryParse(rate?.buyRatePerDollar ?? '0') ?? 0;
    final cryptoAmount = ratePerNaira > 0 ? amount / ratePerNaira : 0.0;
    final walletBalance = double.tryParse(walletState.value?.balance ?? '0') ?? 0;
    final isInsufficient = amount > 0 && amount > walletBalance;

    Future<void> onBuy() async {
      if (amount <= 0) {
        MessageHandler.showErrorSnackBar(context, 'Enter an amount');
        return;
      }
      if (isInsufficient) {
        MessageHandler.showErrorSnackBar(context, 'Insufficient balance');
        return;
      }
      final wallet = walletState2.value;
      if (wallet == null) {
        MessageHandler.showErrorSnackBar(context, 'Wallet address not found');
        return;
      }

      final confirmed = await showSecurityPinBottomsheet(context);
      if (!confirmed) return;

      await ref.read(buyCryptoProvider.notifier).call(
        amount: amount,
        walletAddressId: wallet.id,
      );

      if (!context.mounted) return;
      final state = ref.read(buyCryptoProvider);
      if (state.hasError) {
        MessageHandler.showErrorSnackBar(context, MessageHandler.getErrorMessage(state.error));
      } else {
        ref.read(walletProvider.notifier).fetch();
        context.router.push(CryptoTransactionSuccessfulRoute(
          cryptoAmount: cryptoAmount,
          currency: rate?.currency ?? '',
          nairaAmount: amount,
          logoUrl: rate?.logoUrl ?? '',
          isBuy: true,
        ));
      }
    }

    void showCurrencyPicker() {
      final rates = ratesState.value ?? [];
      if (rates.isEmpty) return;
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (_) => _CurrencyPickerSheet(
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
      appBar: PPAppBar(title: 'Buy Crypto', onBackPressed: () => Navigator.pop(context)),
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
                        child: IntrinsicWidth(
                          child: Container(
                            height: 23.h,
                            padding: EdgeInsets.symmetric(horizontal: 17.w),
                            decoration: BoxDecoration(
                              border: Border.all(color: PPaymobileColors.textfiedBorder, width: 1.w),
                              borderRadius: BorderRadius.circular(12).r,
                            ),
                            child: Center(
                              child: RichText(
                                text: TextSpan(
                                  text: 'Wallet Balance: ',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: PPaymobileColors.svgIconColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '₦${AmountFormatter.formatBalance(walletState.value?.balance ?? '0')}',
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
                            ),
                          ),
                        ),
                      ),
                      20.verticalSpace,
                      Center(
                        child: TouchOpacity(
                          onTap: () => showKeyboard.value = true,
                          child: RichText(
                            text: TextSpan(
                              text: '₦',
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
                              ],
                            ),
                          ),
                        ),
                      ),
                      if (isInsufficient) ...[
                        4.verticalSpace,
                        Center(
                          child: Text(
                            'Insufficient balance',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: PPaymobileColors.redTextfield,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                      45.verticalSpace,
                      Text(
                        'You Get',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      4.verticalSpace,
                      SizedBox(
                        height: 68.h,
                        width: double.infinity,
                        child: TextFormField(
                          readOnly: true,
                          controller: TextEditingController(
                            text: amount > 0 ? cryptoAmount.toStringAsFixed(8) : '',
                          ),
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                              child: GestureDetector(
                                onTap: showCurrencyPicker,
                                child: Container(
                                  height: 44.h,
                                  width: 95.w,
                                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(37).r,
                                    color: PPaymobileColors.deepBackgroundColor,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      rate != null
                                          ? CachedNetworkImage(
                                              imageUrl: rate.logoUrl,
                                              width: 28.w,
                                              height: 28.w,
                                              errorWidget: (_, __, ___) => Container(
                                                width: 28.w,
                                                height: 28.w,
                                                decoration: BoxDecoration(
                                                  color: PPaymobileColors.textfiedBorder,
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                            )
                                          : SkeletonLoader(width: 28.w, height: 28.w, borderRadius: BorderRadius.circular(100.r)),
                                      8.horizontalSpace,
                                      SvgPicture.asset('assets/icon/arrow_down.svg', width: 12.w, height: 12.w),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            hintText: '0.00000000',
                            hintStyle: TextStyle(
                              fontFamily: 'InstrumentSans',
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                              color: PPaymobileColors.svgIconColor,
                            ),
                            suffixIcon: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 20.h),
                              child: Text(
                                rate?.currency.toUpperCase() ?? '',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1.w, color: PPaymobileColors.textfiedBorder),
                              borderRadius: BorderRadius.circular(6).r,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1.w, color: PPaymobileColors.textfiedBorder),
                              borderRadius: BorderRadius.circular(6).r,
                            ),
                          ),
                        ),
                      ),
                      6.verticalSpace,
                      if (rate != null)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '1 ${rate.currency.toUpperCase()} ≈ ₦${AmountFormatter.formatBalance(rate.buyRatePerDollar)}',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: PPaymobileColors.svgIconColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      40.verticalSpace,
                      PPButton(
                        text: buyState.isLoading ? 'Processing...' : 'Buy',
                        onPressed: buyState.isLoading ? null : onBuy,
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

class _CurrencyPickerSheet extends StatelessWidget {
  final List<CryptoRateEntity> rates;
  final CryptoRateEntity? selected;
  final ValueChanged<CryptoRateEntity> onSelect;

  const _CurrencyPickerSheet({
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
          Container(
            height: 60.w,
            width: 60.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30).r,
              color: PPaymobileColors.mainScreenBackground,
            ),
            child: Center(
              child: SvgPicture.asset('assets/icon/cancel.svg', fit: BoxFit.scaleDown),
            ),
          ).onTap(() => Navigator.pop(context)),
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
                            rate.currency.toUpperCase(),
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

extension on Widget {
  Widget onTap(VoidCallback onTap) => GestureDetector(onTap: onTap, child: this);
}
