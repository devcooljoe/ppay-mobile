import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/module/bills/domain/entities/bill_entity.dart';
import 'package:ppay_mobile/module/bills/domain/entities/bill_type.dart';
import 'package:ppay_mobile/module/bills/presentation/providers/bills_providers.dart';
import 'package:ppay_mobile/module/bills/presentation/widgets/bill_input_decoration.dart';
import 'package:ppay_mobile/module/bills/presentation/widgets/bill_package_selector_widget.dart';
import 'package:ppay_mobile/module/bills/presentation/widgets/bill_provider_selector_widget.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/pp_label.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

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

    void selectBiller(BillerEntity biller) {
      selectedBiller.value = biller;
      selectedItem.value = null;
      userIdController.clear();
      ref.read(verifyBillCustomerProvider.notifier).reset();
    }

    Future<void> verifyUserId() async {
      if (selectedBiller.value == null) {
        MessageHandler.showErrorSnackBar(
            context, 'Please select a provider first');
        return;
      }
      if (userIdController.text.trim().isEmpty) {
        MessageHandler.showErrorSnackBar(
            context, 'Please enter your user ID');
        return;
      }

      final activeItems = selectedBiller.value!.billItems
          .where((i) => i.isActive)
          .toList();
      if (activeItems.isEmpty) {
        MessageHandler.showErrorSnackBar(
            context, 'No active packages for this provider');
        return;
      }

      await ref.read(verifyBillCustomerProvider.notifier).call(
            kudaBillItemIdentifier: activeItems.first.kudaIdentifier,
            customerIdentification: userIdController.text.trim(),
          );
    }

    void proceed() {
      if (selectedBiller.value == null) {
        MessageHandler.showErrorSnackBar(
            context, 'Please select a betting provider');
        return;
      }
      if (userIdController.text.trim().isEmpty) {
        MessageHandler.showErrorSnackBar(
            context, 'Please enter your user ID');
        return;
      }
      final customerName = verifyState.value?.customerName;
      if (customerName == null || customerName.isEmpty) {
        MessageHandler.showErrorSnackBar(
            context, 'Please verify your user ID first');
        return;
      }
      if (phoneController.text.trim().isEmpty) {
        MessageHandler.showErrorSnackBar(
            context, 'Please enter your phone number');
        return;
      }
      if (selectedItem.value == null) {
        MessageHandler.showErrorSnackBar(
            context, 'Please select a package');
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

            // Provider selector
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
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: userIdController,
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                        fontFamily: 'InstrumentSans', fontSize: 16.sp),
                    onChanged: (_) =>
                        ref.read(verifyBillCustomerProvider.notifier).reset(),
                    decoration: billInputDecoration(hint: 'Enter user ID'),
                  ),
                ),
                12.horizontalSpace,
                TouchOpacity(
                  onTap: verifyUserId,
                  child: Container(
                    height: 54.h,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: PPaymobileColors.buttonColorandText,
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Center(
                      child: verifyState.isLoading
                          ? SizedBox(
                              height: 18.w,
                              width: 18.w,
                              child: const CircularProgressIndicator(
                                  strokeWidth: 2, color: Colors.white),
                            )
                          : Text(
                              'Verify',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),

            if (verifyState.value != null &&
                verifyState.value!.customerName.isNotEmpty) ...[
              8.verticalSpace,
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: PPaymobileColors.doneColor,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icon/tick_circle.svg',
                        height: 16.w, width: 16.w),
                    8.horizontalSpace,
                    Expanded(
                      child: Text(
                        verifyState.value!.customerName,
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: PPaymobileColors.doneTextColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ] else if (verifyState.hasError) ...[
              8.verticalSpace,
              Text(
                'User ID not found. Please check and try again',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  fontSize: 13.sp,
                  color: PPaymobileColors.redTextfield,
                ),
              ),
            ],

            32.verticalSpace,
            const PPLabel(text: 'Phone Number'),
            8.verticalSpace,
            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              style:
                  TextStyle(fontFamily: 'InstrumentSans', fontSize: 16.sp),
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
