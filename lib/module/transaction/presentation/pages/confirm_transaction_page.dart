import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/module/settings/domain/entities/bank_account_entity.dart';
import 'package:ppay_mobile/module/transaction/presentation/providers/transaction_providers.dart';
import 'package:ppay_mobile/shared/utils/amount_formatter.dart';
import 'package:ppay_mobile/shared/widgets/app_image.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pin_bottom_sheet.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/skeleton_loader.dart';

@RoutePage()
class ConfirmTransactionPage extends HookConsumerWidget {
  final BankAccountEntity account;
  final double amount;

  const ConfirmTransactionPage({
    super.key,
    required this.account,
    required this.amount,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feeState = ref.watch(calculateFeeProvider);

    useEffect(() {
      Future.microtask(() => ref.read(calculateFeeProvider.notifier).call(
            transactionType: 'wallet_withdrawal',
            amount: amount,
          ));
      return null;
    }, []);

    final fee = feeState.value ?? 0.0;
    final total = amount + fee;

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(
        title: 'Confirmation',
        onBackPressed: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
          child: ListView(
            children: [
              35.verticalSpace,
              Text(
                'Confirmation Transaction',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              2.verticalSpace,
              Text(
                'Please carefully review the details below',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.svgIconColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              41.verticalSpace,
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 18.h,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.w,
                    color: PPaymobileColors.deepBackgroundColor,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Transaction Details',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    24.verticalSpace,
                    _DetailRow(
                      label: 'Sending To:',
                      value: account.accountName,
                    ),
                    24.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Bank:',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.svgIconColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          children: [
                            if (account.bankLogo.isNotEmpty)
                              AppImage(
                                imageUrl: account.bankLogo,
                                width: 26.w,
                                height: 22.h,
                                fit: BoxFit.contain,
                              )
                            else
                              SvgPicture.asset(
                                'assets/icon/bank_black.svg',
                                width: 22.w,
                                height: 22.h,
                                fit: BoxFit.contain,
                              ),
                            8.horizontalSpace,
                            Text(
                              account.bankName,
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    24.verticalSpace,
                    _DetailRow(
                      label: 'Account No:',
                      value: account.accountNumber,
                    ),
                    24.verticalSpace,
                    _DetailRow(
                      label: 'Amount:',
                      value:
                          '₦${AmountFormatter.formatBalance(amount.toString())}',
                    ),
                    24.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Charges:',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.svgIconColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        feeState.isLoading
                            ? SkeletonLoader(
                                width: 60.w,
                                height: 16.h,
                                borderRadius: BorderRadius.circular(4.r),
                              )
                            : Text(
                                '₦${AmountFormatter.formatBalance(fee.toString())}',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                      ],
                    ),
                    20.verticalSpace,
                    Divider(
                      height: 1.h,
                      color: PPaymobileColors.deepBackgroundColor,
                    ),
                    20.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total:',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        feeState.isLoading
                            ? SkeletonLoader(
                                width: 80.w,
                                height: 20.h,
                                borderRadius: BorderRadius.circular(4.r),
                              )
                            : Text(
                                '₦${AmountFormatter.formatBalance(total.toString())}',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      ],
                    ),
                  ],
                ),
              ),
              129.verticalSpace,
              PPButton(
                text: 'Confirm Payment',
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (_) => PinBottomSheet(
                      onPinVerified: () {
                        context.router.push(
                          TransactionSuccessfulRoute(
                            account: account,
                            amount: amount,
                          ),
                        );
                        ref.read(withdrawProvider.notifier).call(
                              amount: amount,
                              accountNumber: account.accountNumber,
                              accountName: account.accountName,
                              bankCode: account.bankCode,
                              bankName: account.bankName,
                            );
                      },
                    ),
                  );
                },
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: PPaymobileColors.svgIconColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
