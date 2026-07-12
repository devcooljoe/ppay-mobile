import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/bills/domain/entities/bill_type.dart';
import 'package:ppay_mobile/module/bills/presentation/pages/bill_success_page.dart';
import 'package:ppay_mobile/module/bills/presentation/providers/bills_providers.dart';
import 'package:ppay_mobile/module/dashboard/providers/wallet_provider.dart';
import 'package:ppay_mobile/shared/utils/amount_formatter.dart';
import 'package:ppay_mobile/shared/widgets/app_image.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/security_pin_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/skeleton_loader.dart';

class BillConfirmPage extends HookConsumerWidget {
  final BillConfirmArgs args;

  const BillConfirmPage({super.key, required this.args});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final purchaseState = ref.watch(purchaseBillProvider);
    final feeState = ref.watch(calculateFeeProvider);
    final formattedAmount =
        AmountFormatter.formatBalance(args.amount.toString());

    // Fetch fee on mount
    useEffect(() {
      Future.microtask(() => ref.read(calculateFeeProvider.notifier).call(
            transactionType: 'bill_payment',
            amount: args.amount,
          ));
      return null;
    }, []);

    final fee = feeState.value ?? 0.0;
    final total = args.amount + fee;
    final formattedFee = AmountFormatter.formatBalance(fee.toString());
    final formattedTotal = AmountFormatter.formatBalance(total.toString());

    Future<void> onConfirmTapped() async {
      final verified = await showSecurityPinBottomsheet(context);
      if (!verified) return;
      if (!context.mounted) return;

      await ref.read(purchaseBillProvider.notifier).call(
            billItemIdentifier: args.billItem.kudaIdentifier,
            customerIdentifier: args.customerIdentifier,
            phoneNumber: args.phoneNumber,
            amount: args.amount,
            customerFirstName: args.customerName.isNotEmpty
                ? args.customerName.split(' ').first
                : args.phoneNumber,
            billerName: args.biller.name,
            billerCategory: args.billerCategory,
            logoUrl: args.biller.billerIconUrl.isNotEmpty
                ? args.biller.billerIconUrl
                : null,
          );

      if (!context.mounted) return;

      final state = ref.read(purchaseBillProvider);
      if (state.hasError) {
        MessageHandler.showErrorSnackBar(
          context,
          MessageHandler.getErrorMessage(state.error),
        );
        return;
      }

      // Refresh wallet balance after successful purchase
      ref.read(walletProvider.notifier).fetch();

      final purchase = ref.read(purchaseBillProvider).value;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => BillSuccessPage(
            billType: args.billType,
            amount: formattedAmount,
            biller: args.biller,
            args: args,
            reference: purchase?.reference ?? '',
            fee: fee,
            purchasedAt: DateTime.now(),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(
        title: args.billType.label,
        onBackPressed: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              Text(
                'Confirm Transaction',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.verticalSpace,
              Text(
                'Please carefully review the details below',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.svgIconColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              41.verticalSpace,
              Container(
                width: double.infinity,
                padding:
                    EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.r),
                  border: Border.all(
                      width: 1.w, color: PPaymobileColors.textfiedBorder),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6.7.r,
                      color: PPaymobileColors.shadowColor,
                    ),
                  ],
                  color: PPaymobileColors.mainScreenBackground,
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
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    24.verticalSpace,
                    _DetailRow(
                      label: 'Provider',
                      valueWidget: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 28.w,
                            width: 28.w,
                            clipBehavior: Clip.hardEdge,
                            decoration:
                                const BoxDecoration(shape: BoxShape.circle),
                            child: AppImage(
                              imageUrl: args.biller.billerIconUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                          6.horizontalSpace,
                          Text(
                            args.biller.name,
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: Colors.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    20.verticalSpace,
                    _DetailRow(
                      label: args.billType.customerIdLabel,
                      value: args.customerIdentifier,
                    ),
                    if (args.customerName.isNotEmpty) ...[
                      20.verticalSpace,
                      _DetailRow(
                          label: 'Customer Name', value: args.customerName),
                    ],
                    20.verticalSpace,
                    _DetailRow(label: 'Package', value: args.billItem.name),
                    20.verticalSpace,
                    _DetailRow(label: 'Amount', value: '₦$formattedAmount'),
                    20.verticalSpace,
                    _DetailRow(
                      label: 'Charges',
                      valueWidget: feeState.isLoading
                          ? SkeletonLoader(
                              width: 60.w,
                              height: 14.h,
                              borderRadius: BorderRadius.circular(4.r),
                            )
                          : null,
                      value: feeState.isLoading ? null : '₦$formattedFee',
                    ),
                    17.verticalSpace,
                    Divider(
                        color: PPaymobileColors.textfiedBorder, height: 1.h),
                    20.verticalSpace,
                    _DetailRow(
                      label: 'Total',
                      valueWidget: feeState.isLoading
                          ? SkeletonLoader(
                              width: 80.w,
                              height: 18.h,
                              borderRadius: BorderRadius.circular(4.r),
                            )
                          : null,
                      value: feeState.isLoading ? null : '₦$formattedTotal',
                      isTotal: true,
                    ),
                  ],
                ),
              ),
              40.verticalSpace,
              PPButton(
                text: 'Confirm Payment',
                isLoading: purchaseState.isLoading,
                backgroundColor: PPaymobileColors.buttonColorandText,
                onPressed: onConfirmTapped,
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
  final String? value;
  final Widget? valueWidget;
  final bool isTotal;

  const _DetailRow({
    required this.label,
    this.value,
    this.valueWidget,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: isTotal ? Colors.black : PPaymobileColors.svgIconColor,
            fontSize: isTotal ? 18.sp : 15.sp,
            fontWeight: isTotal ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
        valueWidget ??
            Text(
              value ?? '',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: Colors.black,
                fontSize: isTotal ? 18.sp : 15.sp,
                fontWeight: isTotal ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
      ],
    );
  }
}
