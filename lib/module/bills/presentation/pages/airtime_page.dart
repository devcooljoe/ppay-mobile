import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/module/bills/domain/entities/bill_entity.dart';
import 'package:ppay_mobile/module/bills/domain/entities/bill_type.dart';
import 'package:ppay_mobile/module/bills/presentation/providers/bills_providers.dart';
import 'package:ppay_mobile/module/bills/presentation/widgets/bill_input_decoration.dart';
import 'package:ppay_mobile/module/bills/presentation/widgets/bill_package_selector_widget.dart';
import 'package:ppay_mobile/module/bills/presentation/widgets/bill_provider_selector_widget.dart';
import 'package:ppay_mobile/module/dashboard/providers/wallet_provider.dart';
import 'package:ppay_mobile/shared/utils/amount_formatter.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/pp_label.dart';

@RoutePage()
class AirtimePage extends HookConsumerWidget {
  const AirtimePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final billersAsync = ref.watch(airtimeBillersProvider);
    final walletAsync = ref.watch(walletProvider);

    final selectedBiller = useState<BillerEntity?>(null);
    final selectedItem = useState<BillItemEntity?>(null);
    final phoneController = useTextEditingController();
    final amountController = useTextEditingController();

    final walletBalance = AmountFormatter.formatBalance(
      walletAsync.value?.balance ?? '0.00',
    );

    void selectBiller(BillerEntity biller) {
      selectedBiller.value = biller;
      selectedItem.value = null;
      amountController.text = '';
    }

    void selectItem(BillItemEntity item) {
      selectedItem.value = item;
      if (item.isFixedPrice) {
        amountController.text = item.amount.toStringAsFixed(2);
      } else {
        amountController.text = '';
      }
    }

    void proceed() {
      if (selectedBiller.value == null) {
        MessageHandler.showErrorSnackBar(
          context,
          'Please select a network provider',
        );
        return;
      }
      if (phoneController.text.trim().isEmpty ||
          phoneController.text.trim().length < 10) {
        MessageHandler.showErrorSnackBar(
          context,
          'Please enter a valid phone number',
        );
        return;
      }
      final amountText = amountController.text.trim().replaceAll(',', '');
      final amount = double.tryParse(amountText) ?? 0;
      if (amount <= 0) {
        MessageHandler.showErrorSnackBar(
          context,
          'Please enter a valid amount',
        );
        return;
      }

      final item =
          selectedItem.value ??
          BillItemEntity(
            id: '',
            name: 'Airtime',
            description: '',
            kudaIdentifier: selectedBiller.value!.billTypeId,
            amount: amount,
            isFixedPrice: false,
            billerId: selectedBiller.value!.id,
            isActive: true,
          );

      context.router.push(BillConfirmRoute(
        args: BillConfirmArgs(
          billType: BillType.airtime,
          biller: selectedBiller.value!,
          billItem: item,
          customerIdentifier: phoneController.text.trim(),
          customerName: '',
          phoneNumber: phoneController.text.trim(),
          amount: amount,
          billerCategory: 'Airtime',
        ),
      ));
    }

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: const PPAppBar(title: 'Airtime'),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          children: [
            36.verticalSpace,
            const PPLabel(text: 'Select Network'),
            22.verticalSpace,
            billersAsync.when(
              loading: () => const BillProviderSelectorSkeleton(),
              error: (e, _) => Text(
                'Failed to load providers',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.redTextfield,
                  fontSize: 14.sp,
                ),
              ),
              data: (billers) => BillProviderSelectorWidget(
                billers: billers,
                selectedBiller: selectedBiller.value,
                fallbackAsset: 'assets/images/mtn.png',
                onSelected: selectBiller,
              ),
            ),
            32.verticalSpace,
            const PPLabel(text: 'Phone Number'),
            8.verticalSpace,
            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 16.sp),
              decoration: billInputDecoration(hint: 'Enter phone number'),
            ),
            32.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const PPLabel(text: 'Amount'),
                Text(
                  'Balance: ₦$walletBalance',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.buttonColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            8.verticalSpace,
            TextFormField(
              controller: amountController,
              keyboardType: TextInputType.number,
              style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 16.sp),
              decoration: billInputDecoration(hint: '₦ Enter amount'),
            ),
            if (selectedBiller.value != null &&
                selectedBiller.value!.billItems.isNotEmpty) ...[
              24.verticalSpace,
              const PPLabel(text: 'Quick Amounts'),
              16.verticalSpace,
              BillPackageSelectorWidget(
                items: selectedBiller.value!.billItems,
                billerName: selectedBiller.value!.name,
                billType: BillType.airtime,
                selectedItem: selectedItem.value,
                onSelected: selectItem,
              ),
            ],
            40.verticalSpace,
            PPButton(
              text: 'Buy Airtime',
              backgroundColor: PPaymobileColors.buttonColorandText,
              onPressed: proceed,
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}
