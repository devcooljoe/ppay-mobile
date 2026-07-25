import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/dashboard/providers/wallet_provider.dart';
import 'package:ppay_mobile/module/virtual_card/domain/entities/dollar_card_entity.dart';
import 'package:ppay_mobile/module/virtual_card/domain/utils/card_withdrawal_validator.dart';
import 'package:ppay_mobile/module/virtual_card/presentation/providers/virtual_card_providers.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/custom_keyboard.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/security_pin_bottomsheet.dart';

@RoutePage()
class WithdrawCardPage extends HookConsumerWidget {
  final DollarCardEntity card;

  const WithdrawCardPage({super.key, required this.card});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final amountText = useState('');
    final errorMessage = useState<String?>(null);

    final amount = double.tryParse(amountText.value) ?? 0.0;
    final nairaAmount = amount * card.rate;

    String formatNaira(double value) {
      final parts = value.toStringAsFixed(2).split('.');
      final intPart = parts[0].replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (m) => '${m[1]},',
      );
      return '₦$intPart.${parts[1]}';
    }

    void onKeyTap(String value) {
      if (value == '.' && amountText.value.contains('.')) return;
      if (value == '.' && amountText.value.isEmpty) return;
      amountText.value += value;
      errorMessage.value = null;
    }

    void onDelete() {
      if (amountText.value.isEmpty) return;
      amountText.value = amountText.value.substring(
        0,
        amountText.value.length - 1,
      );
      errorMessage.value = null;
    }

    Future<void> onContinue() async {
      final validationError = validateWithdrawalAmount(amount, card.balance);
      if (validationError != null) {
        errorMessage.value = validationError;
        return;
      }

      final verified = await showSecurityPinBottomsheet(context);
      if (!verified || !context.mounted) return;

      final success = await ref
          .read(withdrawDollarCardProvider.notifier)
          .call(cardId: card.id, amount: amount);
      final withdrawState = ref.read(withdrawDollarCardProvider);

      if (!context.mounted) return;

      if (!success) {
        MessageHandler.showErrorSnackBar(
          context,
          MessageHandler.getErrorMessage(withdrawState.error),
        );
        return;
      }

      ref.read(walletProvider.notifier).fetch();
      ref.read(getDollarCardsProvider.notifier).call();
      ref
          .read(getDollarCardProvider.notifier)
          .call(cardId: card.id, brand: card.brand);

      MessageHandler.showSuccessSnackBar(
        context,
        'Card withdrawn successfully',
      );
    }

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(title: 'Withdraw Card'),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                35.verticalSpace,
                Text(
                  'Please enter an amount you wish to move from your card to your wallet',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.svgIconColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                32.verticalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 23.h,
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45).r,
                        border: Border.all(
                          width: 1.w,
                          color: PPaymobileColors.textfiedBorder,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Card Balance:',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              color: PPaymobileColors.svgIconColor,
                            ),
                          ),
                          1.horizontalSpace,
                          Text(
                            '\$${card.balance.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    30.verticalSpace,
                    RichText(
                      text: TextSpan(
                        text: '\$',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: amountText.value.isEmpty
                                ? '0'
                                : amountText.value,
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: Colors.black,
                              fontSize: 56.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    15.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Rate: ${card.rate.toStringAsFixed(0)}/\$',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.backgroundColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        16.horizontalSpace,
                        SizedBox(
                          height: 8.w,
                          width: 8.w,
                          child: SvgPicture.asset(
                            'assets/icon/big_dot.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                        16.horizontalSpace,
                        Text(
                          'You Receive: ${formatNaira(nairaAmount)}',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.backgroundColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    16.verticalSpace,
                    if (errorMessage.value != null)
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.h),
                        child: Text(
                          errorMessage.value!,
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: PPaymobileColors.redTextfield,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20.0.h),
            child: CustomKeyboard(onKeyTap: onKeyTap, onDelete: onDelete),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: PPButton(
              text: 'Withdraw USD Card',
              onPressed: amount <= 0 ? null : () => onContinue(),
            ),
          ),
        ],
      ),
    );
  }
}
