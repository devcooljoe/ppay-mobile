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
import 'package:ppay_mobile/module/bills/presentation/widgets/bill_input_decoration.dart';
import 'package:ppay_mobile/module/bills/presentation/widgets/bill_package_selector_widget.dart';
import 'package:ppay_mobile/module/bills/presentation/widgets/bill_provider_selector_widget.dart';
import 'package:ppay_mobile/module/bills/presentation/widgets/bill_verification_status.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/pp_label.dart';

@RoutePage()
class BetPage extends HookConsumerWidget {
  const BetPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final billersAsync = ref.watch(bettingBillersProvider);
    final verifyState = ref.watch(verifyBillCustomerProvider);

    final selectedBiller = useState<BillerEntity?>(null);
    final selectedItem = useState<BillItemEntity?>(null);
    final userIdController = useTextEditingController();
    final phoneController = useTextEditingController();
    final isVerifying = useState(false);
    final debounceTimer = useRef<Timer?>(null);

    void selectBiller(BillerEntity biller) {
      selectedBiller.value = biller;
      selectedItem.value = null;
      userIdController.clear();
      ref.read(verifyBillCustomerProvider.notifier).reset();
    }

    void onUserIdChanged(String value) {
      ref.read(verifyBillCustomerProvider.notifier).reset();
      isVerifying.value = false;
      debounceTimer.value?.cancel();

      // Betting user IDs are typically 6+ characters
      if (value.trim().length < 6 || selectedBiller.value == null) return;

      final activeItems = selectedBiller.value!.billItems
          .where((i) => i.isActive)
          .toList();
      if (activeItems.isEmpty) return;

      isVerifying.value = true;
      debounceTimer.value = Timer(const Duration(milliseconds: 600), () {
        if (context.mounted) {
          ref.read(verifyBillCustomerProvider.notifier).call(
                kudaBillItemIdentifier: activeItems.first.kudaIdentifier,
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
        MessageHandler.showErrorSnackBar(
            context, 'Please select a betting provider');
        return;
      }
      if (userIdController.text.trim().isEmpty) {
        MessageHandler.showErrorSnackBar(context, 'Please enter your user ID');
        return;
      }
      final customerName = verifyState.value?.customerName;
      if (customerName == null || customerName.isEmpty) {
        MessageHandler.showErrorSnackBar(
            context, 'Please wait for user ID verification to complete');
        return;
      }
      if (phoneController.text.trim().isEmpty) {
        MessageHandler.showErrorSnackBar(
            context, 'Please enter your phone number');
        return;
      }
      if (selectedItem.value == null) {
        MessageHandler.showErrorSnackBar(context, 'Please select a package');
        return;
      }

      context.router.push(BillConfirmRoute(
        args: BillConfirmArgs(
          billType: BillType.betting,
          biller: selectedBiller.value!,
          billItem: selectedItem.value!,
          customerIdentifier: userIdController.text.trim(),
          customerName: customerName,
          phoneNumber: phoneController.text.trim(),
          amount: selectedItem.value!.amount,
          billerCategory: 'Betting',
        ),
      ));
    }

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: const PPAppBar(title: 'Betting'),
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
                fallbackAsset: 'assets/images/sporty.png',
                onSelected: selectBiller,
              ),
            ),
            32.verticalSpace,
            const PPLabel(text: 'User ID'),
            8.verticalSpace,
            TextFormField(
              controller: userIdController,
              keyboardType: TextInputType.text,
              style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 16.sp),
              onChanged: onUserIdChanged,
              decoration: billInputDecoration(hint: 'Enter user ID'),
            ),
            8.verticalSpace,
            BillVerificationStatus(
              isLoading: isVerifying.value,
              customerName: verifyState.value?.customerName,
              hasError: verifyState.hasError,
              errorMessage: 'User ID not found. Please check and try again',
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
            if (selectedBiller.value != null) ...[
              32.verticalSpace,
              const PPLabel(text: 'Select Package'),
              16.verticalSpace,
              BillPackageSelectorWidget(
                items: selectedBiller.value!.billItems,
                billerName: selectedBiller.value!.name,
                billType: BillType.betting,
                selectedItem: selectedItem.value,
                onSelected: (item) {
                  selectedItem.value = item;
                },
              ),
            ],
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


