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
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/pp_label.dart';

@RoutePage()
class DataPage extends HookConsumerWidget {
  const DataPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final billersAsync = ref.watch(dataBillersProvider);

    final selectedBiller = useState<BillerEntity?>(null);
    final selectedItem = useState<BillItemEntity?>(null);
    final phoneController = useTextEditingController();

    void proceed() {
      if (selectedBiller.value == null) {
        MessageHandler.showErrorSnackBar(context, 'Please select a network provider');
        return;
      }
      if (phoneController.text.trim().isEmpty ||
          phoneController.text.trim().length < 10) {
        MessageHandler.showErrorSnackBar(context, 'Please enter a valid phone number');
        return;
      }
      if (selectedItem.value == null) {
        MessageHandler.showErrorSnackBar(context, 'Please select a data plan');
        return;
      }

      context.router.push(BillConfirmRoute(
        args: BillConfirmArgs(
          billType: BillType.data,
          biller: selectedBiller.value!,
          billItem: selectedItem.value!,
          customerIdentifier: phoneController.text.trim(),
          customerName: '',
          phoneNumber: phoneController.text.trim(),
          amount: selectedItem.value!.amount,
          billerCategory: 'Internet Data',
        ),
      ));
    }

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: const PPAppBar(title: 'Data'),
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
                onSelected: (biller) {
                  selectedBiller.value = biller;
                  selectedItem.value = null;
                },
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
            if (selectedBiller.value != null) ...[
              32.verticalSpace,
              const PPLabel(text: 'Select Data Plan'),
              16.verticalSpace,
              BillPackageSelectorWidget(
                items: selectedBiller.value!.billItems,
                billerName: selectedBiller.value!.name,
              billType: BillType.data,
                selectedItem: selectedItem.value,
                onSelected: (item) => selectedItem.value = item,
              ),
            ],
            40.verticalSpace,
            PPButton(
              text: 'Buy Data',
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
