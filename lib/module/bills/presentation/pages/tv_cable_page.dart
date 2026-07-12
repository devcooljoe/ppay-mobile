import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/bills/domain/entities/bill_entity.dart';
import 'package:ppay_mobile/module/bills/domain/entities/bill_type.dart';
import 'package:ppay_mobile/module/bills/presentation/pages/bill_confirm_page.dart';
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
class TvCablePage extends HookConsumerWidget {
  const TvCablePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final billersAsync = ref.watch(tvBillersProvider);
    final verifyState = ref.watch(verifyBillCustomerProvider);

    final selectedBiller = useState<BillerEntity?>(null);
    final selectedItem = useState<BillItemEntity?>(null);
    final smartCardController = useTextEditingController();
    final phoneController = useTextEditingController();

    final requiresVerification =
        selectedBiller.value?.requiresCustomerVerification ?? false;
    final isVerified = verifyState.value != null &&
        verifyState.value!.customerName.isNotEmpty;

    void selectBiller(BillerEntity biller) {
      selectedBiller.value = biller;
      selectedItem.value = null;
      smartCardController.clear();
      ref.read(verifyBillCustomerProvider.notifier).reset();
    }

    Future<void> verifySmartCard() async {
      if (smartCardController.text.trim().isEmpty) {
        MessageHandler.showErrorSnackBar(
            context, 'Please enter smart card / IUC number');
        return;
      }
      final activeItems =
          selectedBiller.value!.billItems.where((i) => i.isActive).toList();
      if (activeItems.isEmpty) return;

      await ref.read(verifyBillCustomerProvider.notifier).call(
            kudaBillItemIdentifier: activeItems.first.kudaIdentifier,
            customerIdentification: smartCardController.text.trim(),
          );
    }

    void proceed() {
      if (selectedBiller.value == null) {
        MessageHandler.showErrorSnackBar(context, 'Please select a provider');
        return;
      }
      if (requiresVerification) {
        if (smartCardController.text.trim().isEmpty) {
          MessageHandler.showErrorSnackBar(
              context, 'Please enter smart card / IUC number');
          return;
        }
        if (!isVerified) {
          MessageHandler.showErrorSnackBar(
              context, 'Please verify your smart card / IUC number');
          return;
        }
      }
      if (selectedItem.value == null) {
        MessageHandler.showErrorSnackBar(
            context, 'Please select a subscription package');
        return;
      }
      if (phoneController.text.trim().isEmpty) {
        MessageHandler.showErrorSnackBar(
            context, 'Please enter your phone number');
        return;
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => BillConfirmPage(
            args: BillConfirmArgs(
              billType: BillType.tv,
              biller: selectedBiller.value!,
              billItem: selectedItem.value!,
              customerIdentifier: requiresVerification
                  ? smartCardController.text.trim()
                  : phoneController.text.trim(),
              customerName: requiresVerification
                  ? (verifyState.value?.customerName ?? '')
                  : '',
              phoneNumber: phoneController.text.trim(),
              amount: selectedItem.value!.amount,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: const PPAppBar(title: 'TV Cable'),
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
                fallbackAsset: 'assets/images/dstv_1.png',
                onSelected: selectBiller,
              ),
            ),

            // Smart card field — only for billers that require verification
            if (selectedBiller.value != null && requiresVerification) ...[
              32.verticalSpace,
              const PPLabel(text: 'Smart Card / IUC Number'),
              8.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: smartCardController,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                          fontFamily: 'InstrumentSans', fontSize: 16.sp),
                      onChanged: (_) =>
                          ref.read(verifyBillCustomerProvider.notifier).reset(),
                      decoration:
                          billInputDecoration(hint: 'Enter smart card number'),
                    ),
                  ),
                  12.horizontalSpace,
                  TouchOpacity(
                    onTap: verifySmartCard,
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
              if (isVerified) ...[
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
                  'Smart card not found. Please check and try again',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    fontSize: 13.sp,
                    color: PPaymobileColors.redTextfield,
                  ),
                ),
              ],
            ],

            // Show packages:
            // For verification-required billers: show after successful verify
            // For voucher billers: show immediately after biller selection
            if (selectedBiller.value != null &&
                (!requiresVerification || isVerified)) ...[
              32.verticalSpace,
              const PPLabel(text: 'Select Package'),
              16.verticalSpace,
              BillPackageSelectorWidget(
                items: selectedBiller.value!.billItems,
                billerName: selectedBiller.value!.name,
              billType: BillType.tv,
                selectedItem: selectedItem.value,
                onSelected: (item) => selectedItem.value = item,
              ),
            ],

            if (selectedBiller.value != null) ...[
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
            ],

            40.verticalSpace,
            PPButton(
              text: 'Subscribe',
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
