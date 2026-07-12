import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' hide MessageHandler;
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/module/settings/domain/entities/bank_entity.dart';
import 'package:ppay_mobile/module/settings/presentation/providers/settings_providers.dart';
import 'package:ppay_mobile/module/transaction/presentation/providers/transaction_providers.dart';
import 'package:ppay_mobile/shared/widgets/app_image.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/select_bank_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_label.dart';
import 'package:ppay_mobile/shared/widgets/pp_text_field.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/app_loader.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';

@RoutePage()
class TransferFundsPage extends HookConsumerWidget {
  const TransferFundsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bankController = useTextEditingController();
    final accountController = useTextEditingController();
    final selectedBank = useState<BankEntity?>(null);
    final resolvedName = useState<String?>(null);
    final nameError = useState<String?>(null);
    final isEnquiryLoading = useState(false);
    final debounceTimer = useRef<Timer?>(null);

    final addBankAsync = ref.watch(addBankAccountProvider);

    final canSubmit = selectedBank.value != null &&
        resolvedName.value != null &&
        resolvedName.value!.isNotEmpty &&
        !isEnquiryLoading.value;

    // Trigger name enquiry after user stops typing for 800ms
    void onAccountNumberChanged(String value) {
      resolvedName.value = null;
      nameError.value = null;
      isEnquiryLoading.value = false;

      debounceTimer.value?.cancel();

      if (value.length != 10 || selectedBank.value == null) return;

      isEnquiryLoading.value = true;
      debounceTimer.value = Timer(const Duration(milliseconds: 400), () {
        if (context.mounted) {
          ref.read(nameEnquiryProvider.notifier).call(
                accountNumber: value.trim(),
                bankCode: selectedBank.value!.bankCode,
              );
        }
      });
    }

    // When bank changes, re-trigger enquiry if account number is already 10 digits
    void onBankSelected(BankEntity bank) {
      selectedBank.value = bank;
      bankController.text = bank.bankName;
      resolvedName.value = null;
      nameError.value = null;

      final accountNumber = accountController.text.trim();
      if (accountNumber.length == 10) {
        isEnquiryLoading.value = true;
        ref.read(nameEnquiryProvider.notifier).call(
              accountNumber: accountNumber,
              bankCode: bank.bankCode,
            );
      }
    }

    // Listen to name enquiry state changes
    ref.listen(nameEnquiryProvider, (_, next) {
      isEnquiryLoading.value = next.isLoading;
      if (next.hasValue && next.value != null) {
        resolvedName.value = next.value!.accountName;
        nameError.value = null;
      } else if (next.hasError) {
        resolvedName.value = null;
        nameError.value = 'Account not found. Please check the details.';
      }
    });

    // Listen to add bank state
    ref.listen(addBankAccountProvider, (_, next) {
      if (next.isLoading) {
        AppLoader.show(context);
      } else {
        AppLoader.hide(context);
        if (next.hasError) {
          MessageHandler.showErrorSnackBar(
              context, next.error?.toString() ?? 'Failed to add bank account');
        } else if (next.hasValue) {
          // Refresh the bank accounts list so the bottom sheet is up to date
          ref.read(getBankAccountsProvider.notifier).call();
          MessageHandler.showSuccessSnackBar(
              context, 'Bank account added successfully');
          Navigator.pop(context);
        }
      }
    });

    void handleAddBank() {
      if (!canSubmit) return;
      ref.read(addBankAccountProvider.notifier).call(
            accountName: resolvedName.value!,
            accountNumber: accountController.text.trim(),
            bankName: selectedBank.value!.bankName,
            bankCode: selectedBank.value!.bankCode,
          );
    }

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: const PPAppBar(title: 'Bank Details'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
        child: ListView(
          children: [
            21.verticalSpace,
            Text(
              'Add New Bank',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            7.verticalSpace,
            Text(
              'Please enter the bank account details below',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: PPaymobileColors.svgIconColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            64.verticalSpace,
            const PPLabel(text: 'Select Bank'),
            4.verticalSpace,
            GestureDetector(
              onTap: () async {
                final bank = await showModalBottomSheet<BankEntity>(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (_) => const SelectBankBottomsheet(),
                );
                if (bank != null) onBankSelected(bank);
              },
              child: AbsorbPointer(
                child: PPTextField(
                  controller: bankController,
                  readOnly: true,
                  hintText: 'Select',
                  prefixIcon: selectedBank.value == null
                      ? null
                      : Padding(
                          padding: EdgeInsets.all(10.r),
                          child: selectedBank.value!.bankLogo.isNotEmpty
                              ? AppImage(
                                  imageUrl: selectedBank.value!.bankLogo,
                                  width: 26.w,
                                  height: 22.h,
                                  fit: BoxFit.contain,
                                )
                              : SvgPicture.asset(
                                  'assets/icon/bank_black.svg',
                                  fit: BoxFit.scaleDown,
                                ),
                        ),
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(12.w),
                    child: SvgPicture.asset(
                      'assets/icon/arrow_down.svg',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
            ),
            38.verticalSpace,
            const PPLabel(text: 'Recipient Account No'),
            4.verticalSpace,
            PPTextField(
              controller: accountController,
              hintText: 'e.g. 0000000000',
              keyboardType: TextInputType.number,
              maxLength: 10,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onChanged: onAccountNumberChanged,
            ),
            20.verticalSpace,

            // Name enquiry status row — only visible when account number is typed
            if (accountController.text.isNotEmpty)
              _NameEnquiryStatus(
                isLoading: isEnquiryLoading.value,
                resolvedName: resolvedName.value,
                errorMessage: nameError.value,
              ),

            if (accountController.text.isNotEmpty) 20.verticalSpace,

            280.verticalSpace,
            PPButton(
              text: 'Add Bank',
              onPressed: canSubmit ? handleAddBank : null,
              backgroundColor: canSubmit
                  ? PPaymobileColors.backgroundColor
                  : PPaymobileColors.buttonInactiveColor,
              isLoading: addBankAsync.isLoading,
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}

class _NameEnquiryStatus extends HookWidget {
  final bool isLoading;
  final String? resolvedName;
  final String? errorMessage;

  const _NameEnquiryStatus({
    required this.isLoading,
    required this.resolvedName,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Container(
        height: 34.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: PPaymobileColors.deepBackgroundColor,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Row(
          children: [
            SizedBox(
              height: 20.w,
              width: 20.w,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: PPaymobileColors.backgroundColor,
              ),
            ),
            8.horizontalSpace,
            Text(
              'Loading account name...',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: PPaymobileColors.svgIconColor,
              ),
            ),
          ],
        ),
      );
    }

    if (resolvedName != null) {
      return Container(
        height: 34.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: PPaymobileColors.doneColor,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Row(
          children: [
            SizedBox(
              height: 22.w,
              width: 22.w,
              child: SvgPicture.asset(
                'assets/icon/checkmark.svg',
                fit: BoxFit.contain,
              ),
            ),
            8.horizontalSpace,
            Text(
              resolvedName!,
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: PPaymobileColors.doneTextColor,
              ),
            ),
          ],
        ),
      );
    }

    if (errorMessage != null) {
      return Container(
        height: 34.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: PPaymobileColors.dangerColor,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Row(
          children: [
            SizedBox(
              height: 22.w,
              width: 22.w,
              child: SvgPicture.asset(
                'assets/icon/danger.svg',
                fit: BoxFit.contain,
              ),
            ),
            8.horizontalSpace,
            Expanded(
              child: Text(
                errorMessage!,
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: PPaymobileColors.dangerTextColor,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
