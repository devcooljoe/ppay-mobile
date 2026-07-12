import 'package:flutter/material.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/module/settings/domain/entities/bank_account_entity.dart';
import 'package:ppay_mobile/module/dashboard/providers/wallet_provider.dart';
import 'package:ppay_mobile/shared/utils/amount_formatter.dart';
import 'package:ppay_mobile/shared/widgets/app_image.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/custom_keyboard.dart';
import 'package:ppay_mobile/shared/widgets/custom_keyboard_container.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';

@RoutePage()
class AmountAndInfoPage extends HookConsumerWidget {
  final BankAccountEntity account;

  const AmountAndInfoPage({super.key, required this.account});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rawAmount = useState('');
    final walletAsync = ref.watch(walletProvider);
    final wallet = walletAsync.value;

    void onKeyTap(String value) {
      final current = rawAmount.value;
      // Prevent multiple decimals
      if (value == '.' && current.contains('.')) return;
      // Prevent leading zeros
      if (value != '.' && current == '0') {
        rawAmount.value = value;
        return;
      }
      // Limit to 2 decimal places
      if (current.contains('.')) {
        final parts = current.split('.');
        if (parts[1].length >= 2) return;
      }
      rawAmount.value = current + value;
    }

    void onDelete() {
      if (rawAmount.value.isNotEmpty) {
        rawAmount.value =
            rawAmount.value.substring(0, rawAmount.value.length - 1);
      }
    }

    final amount = double.tryParse(rawAmount.value) ?? 0.0;
    final balance = double.tryParse(wallet?.balance ?? '0') ?? 0.0;
    final hasAmount = amount > 0;
    final hasEnoughBalance = amount <= balance;
    final canProceed = hasAmount && hasEnoughBalance;

    String displayAmount;
    if (rawAmount.value.isEmpty) {
      displayAmount = '₦0.00';
    } else if (rawAmount.value.endsWith('.')) {
      displayAmount = '₦${AmountFormatter.formatAmountWithCommas(amount)}.';
    } else {
      displayAmount = '₦${AmountFormatter.formatBalance(rawAmount.value)}';
    }

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: const PPAppBar(title: 'Sending To'),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                46.verticalSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 44.h,
                        width: 44.w,
                        padding: EdgeInsets.all(8.r),
                        decoration: BoxDecoration(
                          color: PPaymobileColors.anotherbuttonbgColor,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: account.bankLogo.isNotEmpty
                            ? AppImage(
                                imageUrl: account.bankLogo,
                                width: 28.w,
                                height: 28.h,
                                fit: BoxFit.contain,
                              )
                            : SvgPicture.asset(
                                'assets/icon/bank_black.svg',
                                fit: BoxFit.contain,
                              ),
                      ),
                      17.verticalSpace,
                      Text(
                        account.accountName,
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: Colors.black,
                        ),
                      ),
                      2.verticalSpace,
                      Text(
                        account.accountNumber,
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: PPaymobileColors.svgIconColor,
                        ),
                      ),
                      40.verticalSpace,
                      Text(
                        displayAmount,
                        style: TextStyle(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'InstrumentSans',
                          color: !hasEnoughBalance && hasAmount
                              ? PPaymobileColors.redTextfield
                              : Colors.black,
                        ),
                      ),
                      11.verticalSpace,
                      Container(
                        height: 24.h,
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45).r,
                          border: Border.all(
                            width: 1.w,
                            color: PPaymobileColors.textfiedBorder,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Wallet Balance:',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                color: PPaymobileColors.svgIconColor,
                              ),
                            ),
                            4.horizontalSpace,
                            Text(
                              wallet != null
                                  ? '₦${AmountFormatter.formatBalance(wallet.balance)}'
                                  : '₦••••',
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
                      if (!hasEnoughBalance && hasAmount) ...[
                        8.verticalSpace,
                        Text(
                          'Insufficient balance',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: PPaymobileColors.redTextfield,
                          ),
                        ),
                      ],
                      39.verticalSpace,
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          color: PPaymobileColors.deepBackgroundColor,
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 40.h,
                              width: 44.w,
                              padding: EdgeInsets.all(8.r),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2.r),
                                color: PPaymobileColors.anotherbuttonbgColor,
                              ),
                              child: account.bankLogo.isNotEmpty
                                  ? AppImage(
                                      imageUrl: account.bankLogo,
                                      width: 28.w,
                                      height: 28.h,
                                      fit: BoxFit.contain,
                                    )
                                  : SvgPicture.asset(
                                      'assets/icon/bank_black.svg',
                                      fit: BoxFit.contain,
                                    ),
                            ),
                            14.horizontalSpace,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    account.accountName,
                                    style: TextStyle(
                                      fontFamily: 'InstrumentSans',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                  4.verticalSpace,
                                  Row(
                                    children: [
                                      Text(
                                        account.accountNumber,
                                        style: TextStyle(
                                          fontFamily: 'InstrumentSans',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12.sp,
                                          color: PPaymobileColors.svgIconColor,
                                        ),
                                      ),
                                      8.horizontalSpace,
                                      SizedBox(
                                        height: 7.w,
                                        width: 7.w,
                                        child: SvgPicture.asset(
                                          'assets/icon/spacer.svg',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      8.horizontalSpace,
                                      Flexible(
                                        child: Text(
                                          account.bankName,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontFamily: 'InstrumentSans',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12.sp,
                                            color: PPaymobileColors.svgIconColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            TouchOpacity(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                height: 35.h,
                                width: 80.w,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.w,
                                  vertical: 7.h,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4).r,
                                  color: PPaymobileColors.mainScreenBackground,
                                  border: Border.all(
                                    width: 1.w,
                                    color: PPaymobileColors.textfiedBorder,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Change',
                                    style: TextStyle(
                                      color: PPaymobileColors.buttonColor,
                                      fontSize: 12.sp,
                                      fontFamily: 'InstrumentSans',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                KeyboardContainer(
                  child: Padding(
                    padding: EdgeInsets.all(30).r,
                    child: CustomKeyboard(
                      onKeyTap: onKeyTap,
                      onDelete: onDelete,
                    ),
                  ),
                ),
                24.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  child: PPButton(
                    text: 'Next',
                    icon: SizedBox(
                      height: 24.w,
                      width: 24.w,
                      child: SvgPicture.asset(
                        'assets/icon/arrow_forwardw.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                    onPressed: canProceed
                        ? () => context.router.push(
                              ConfirmTransactionRoute(
                                account: account,
                                amount: amount,
                              ),
                            )
                        : null,
                    backgroundColor: canProceed
                        ? PPaymobileColors.backgroundColor
                        : PPaymobileColors.buttonInactiveColor,
                  ),
                ),
                20.verticalSpace,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
