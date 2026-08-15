import 'dart:async';

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
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/pp_label.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

import 'package:ppay_mobile/module/bills/presentation/widgets/bill_input_decoration.dart';
import 'package:ppay_mobile/module/bills/presentation/widgets/bill_provider_selector_widget.dart';
import 'package:ppay_mobile/module/bills/presentation/widgets/bill_verification_status.dart';

@RoutePage()
class ElectricityPage extends HookConsumerWidget {
  const ElectricityPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final billersAsync = ref.watch(electricityBillersProvider);
    final verifyState = ref.watch(verifyBillCustomerProvider);

    final selectedBiller = useState<BillerEntity?>(null);
    final selectedItem = useState<BillItemEntity?>(null);
    final meterController = useTextEditingController();
    final amountController = useTextEditingController();
    final phoneController = useTextEditingController();
    final isVerifying = useState(false);
    final debounceTimer = useRef<Timer?>(null);

    void selectBiller(BillerEntity biller) {
      selectedBiller.value = biller;
      selectedItem.value = null;
      meterController.clear();
      amountController.clear();
      ref.read(verifyBillCustomerProvider.notifier).reset();
    }

    void onMeterChanged(String value) {
      ref.read(verifyBillCustomerProvider.notifier).reset();
      isVerifying.value = false;
      debounceTimer.value?.cancel();

      // Nigerian prepaid/postpaid meter numbers are 11 digits
      if (value.trim().length < 11 || selectedItem.value == null) return;

      isVerifying.value = true;
      debounceTimer.value = Timer(const Duration(milliseconds: 600), () {
        if (context.mounted) {
          ref.read(verifyBillCustomerProvider.notifier).call(
                kudaBillItemIdentifier: selectedItem.value!.kudaIdentifier,
                customerIdentification: value.trim(),
              );
        }
      });
    }

    ref.listen(verifyBillCustomerProvider, (_, next) {
      isVerifying.value = next.isLoading;
    });

    void proceed() {
      if (selectedBiller.value == null) {
        MessageHandler.showErrorSnackBar(context, 'Please select a provider');
        return;
      }
      if (selectedItem.value == null) {
        MessageHandler.showErrorSnackBar(context, 'Please select meter type');
        return;
      }
      if (meterController.text.trim().isEmpty) {
        MessageHandler.showErrorSnackBar(context, 'Please enter meter number');
        return;
      }
      final customerName = verifyState.value?.customerName;
      if (customerName == null || customerName.isEmpty) {
        MessageHandler.showErrorSnackBar(
            context, 'Please wait for meter verification to complete');
        return;
      }
      if (phoneController.text.trim().isEmpty) {
        MessageHandler.showErrorSnackBar(
            context, 'Please enter your phone number');
        return;
      }
      final amountText = amountController.text.trim().replaceAll(',', '');
      final amount = double.tryParse(amountText) ?? 0;
      if (amount <= 0) {
        MessageHandler.showErrorSnackBar(
            context, 'Please enter a valid amount');
        return;
      }

      context.router.push(BillConfirmRoute(
        args: BillConfirmArgs(
          billType: BillType.electricity,
          biller: selectedBiller.value!,
          billItem: selectedItem.value!,
          customerIdentifier: meterController.text.trim(),
          customerName: customerName,
          phoneNumber: phoneController.text.trim(),
          amount: amount,
          billerCategory: 'Electricity',
        ),
      ));
    }

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: const PPAppBar(title: 'Electricity'),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          children: [
            36.verticalSpace,
            const PPLabel(text: 'Select Provider'),
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
                fallbackAsset: 'assets/images/ekedc.png',
                onSelected: selectBiller,
              ),
            ),
            if (selectedBiller.value != null) ...[
              32.verticalSpace,
              const PPLabel(text: 'Meter Type'),
              12.verticalSpace,
              Row(
                children: selectedBiller.value!.billItems
                    .where((item) => item.isActive)
                    .map((item) {
                  final isSelected = selectedItem.value?.id == item.id;
                  return Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: TouchOpacity(
                      onTap: () {
                        selectedItem.value = item;
                        meterController.clear();
                        ref.read(verifyBillCustomerProvider.notifier).reset();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 12.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          color: isSelected
                              ? PPaymobileColors.buttonColor
                                  .withValues(alpha: 0.12)
                              : PPaymobileColors.deepBackgroundColor,
                          border: isSelected
                              ? Border.all(
                                  color: PPaymobileColors.buttonColor,
                                  width: 1.5.w)
                              : Border.all(
                                  color: PPaymobileColors.textfiedBorder,
                                  width: 1.w),
                        ),
                        child: Text(
                          item.name,
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: isSelected
                                ? PPaymobileColors.buttonColor
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
            32.verticalSpace,
            const PPLabel(text: 'Meter Number'),
            8.verticalSpace,
            TextFormField(
              controller: meterController,
              keyboardType: TextInputType.number,
              style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 16.sp),
              onChanged: onMeterChanged,
              decoration: billInputDecoration(hint: 'Enter meter number'),
            ),
            8.verticalSpace,
            BillVerificationStatus(
              isLoading: isVerifying.value,
              customerName: verifyState.value?.customerName,
              hasError: verifyState.hasError,
              errorMessage: 'Meter number not found. Please check and try again',
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
            const PPLabel(text: 'Amount'),
            8.verticalSpace,
            TextFormField(
              controller: amountController,
              keyboardType: TextInputType.number,
              style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 16.sp),
              decoration: billInputDecoration(hint: '₦ Enter amount'),
            ),
            40.verticalSpace,
            PPButton(
              text: 'Make Payment',
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


