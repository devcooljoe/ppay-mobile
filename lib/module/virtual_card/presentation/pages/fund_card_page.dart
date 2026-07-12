import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/module/dashboard/providers/wallet_provider.dart';
import 'package:ppay_mobile/module/virtual_card/presentation/providers/virtual_card_providers.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/confirm_fund_card_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/custom_keyboard.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';

@RoutePage()
class FundCardPage extends HookConsumerWidget {
  const FundCardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final amountText = useState('');
    final walletState = ref.watch(walletProvider);
    final cardState = ref.watch(getDollarCardProvider);

    final wallet = walletState.value;
    final card = cardState.value;
    final rate = card?.rate ?? 0.0;
    final walletBalance = double.tryParse(wallet?.balance ?? '0') ?? 0.0;

    final amount = double.tryParse(amountText.value) ?? 0.0;
    final nairaAmount = amount * rate;

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

    String formatNaira(double value) {
      final parts = value.toStringAsFixed(2).split('.');
      final intPart = parts[0].replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},');
      return '₦$intPart.${parts[1]}';
    }

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(title: 'Fund Card'),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                35.verticalSpace,
                Text('Enter Details', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 20.sp, fontWeight: FontWeight.w500)),
                Text('Please enter an amount you wish to pull from your wallet', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 14.sp, fontWeight: FontWeight.w400)),
                32.verticalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 23.h,
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(45).r, border: Border.all(width: 1.w, color: PPaymobileColors.textfiedBorder)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Wallet Balance:', style: TextStyle(fontFamily: 'InstrumentSans', fontWeight: FontWeight.w500, fontSize: 14.sp, color: PPaymobileColors.svgIconColor)),
                          1.horizontalSpace,
                          Text(
                            wallet != null ? formatNaira(walletBalance) : '...',
                            style: TextStyle(fontFamily: 'InstrumentSans', fontWeight: FontWeight.w500, fontSize: 12.sp, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    30.verticalSpace,
                    RichText(
                      text: TextSpan(
                        text: '\$',
                        style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w500),
                        children: [
                          TextSpan(
                            text: amountText.value.isEmpty ? '0' : amountText.value,
                            style: TextStyle(fontFamily: 'Gilroy', color: Colors.black, fontSize: 56.sp, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    15.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Rate: ${rate.toStringAsFixed(0)}/\$',
                          style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.backgroundColor, fontSize: 12.sp, fontWeight: FontWeight.w500),
                        ),
                        16.horizontalSpace,
                        SizedBox(height: 8.w, width: 8.w, child: SvgPicture.asset('assets/icon/big_dot.svg', fit: BoxFit.contain)),
                        16.horizontalSpace,
                        Text(
                          'You Pay: ${formatNaira(nairaAmount)}',
                          style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.backgroundColor, fontSize: 12.sp, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    29.verticalSpace,
                    PPButton(
                      text: 'Fund USD Card',
                      onPressed: amount <= 0
                          ? null
                          : () async {
                              await showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (_) => ConfirmFundCardBottomsheet(
                                  amountUsd: amount,
                                  nairaAmount: nairaAmount,
                                  rate: rate,
                                  walletBalance: walletBalance,
                                ),
                              );
                            },
                      backgroundColor: PPaymobileColors.deepBackgroundColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
          20.verticalSpace,
          Padding(
            padding: EdgeInsets.only(bottom: 20.0.h),
            child: CustomKeyboard(onKeyTap: onKeyTap, onDelete: onDelete),
          ),
        ],
      ),
    );
  }
}
