import 'package:flutter/material.dart';
import 'package:flutter/services.dart' hide MessageHandler;
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/settings/domain/entities/bank_account_entity.dart';
import 'package:ppay_mobile/module/settings/domain/entities/bank_entity.dart';
import 'package:ppay_mobile/module/settings/presentation/providers/settings_providers.dart';
import 'package:ppay_mobile/module/transaction/presentation/providers/transaction_providers.dart';
import 'package:ppay_mobile/shared/widgets/app_loader.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/select_bank_bottomsheet.dart';

@RoutePage()
class EditAccountPage extends HookConsumerWidget {
  final BankAccountEntity? account;
  const EditAccountPage({super.key, this.account});

  bool get _isEditing => account != null;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bankController = useTextEditingController(text: account?.bankName ?? '');
    final accountNumberController = useTextEditingController(text: account?.accountNumber ?? '');
    final selectedBank = useState<BankEntity?>(null);
    final resolvedName = useState<String?>(account?.accountName);

    // Trigger name enquiry when account number reaches 10 digits
    useEffect(() {
      void listener() {
        final number = accountNumberController.text;
        final bankCode = selectedBank.value?.bankCode ?? '';
        if (number.length == 10 && bankCode.isNotEmpty) {
          ref.read(nameEnquiryProvider.notifier).call(
                accountNumber: number,
                bankCode: bankCode,
              );
        } else if (number.length != 10) {
          resolvedName.value = null;
        }
      }
      accountNumberController.addListener(listener);
      return () => accountNumberController.removeListener(listener);
    }, [selectedBank.value]);

    ref.listen(nameEnquiryProvider, (_, next) {
      if (!next.isLoading && !next.hasError && next.value != null) {
        resolvedName.value = next.value!.accountName;
      }
    });

    final provider = _isEditing ? updateBankAccountProvider : addBankAccountProvider;

    ref.listen(provider, (_, next) {
      if (next.isLoading) {
        AppLoader.show(context);
      } else {
        AppLoader.hide(context);
        if (next.hasError) {
          MessageHandler.showErrorSnackBar(context, MessageHandler.getErrorMessage(next.error));
        } else if (!next.isLoading) {
          MessageHandler.showSuccessSnackBar(
            context,
            _isEditing ? 'Bank account updated' : 'Bank account added',
          );
          Navigator.pop(context);
        }
      }
    });

    ref.listen(deleteBankAccountProvider, (_, next) {
      if (next.isLoading) {
        AppLoader.show(context);
      } else {
        AppLoader.hide(context);
        if (next.hasError) {
          MessageHandler.showErrorSnackBar(context, MessageHandler.getErrorMessage(next.error));
        } else if (!next.isLoading) {
          MessageHandler.showSuccessSnackBar(context, 'Bank account removed');
          Navigator.pop(context);
        }
      }
    });

    void handleSubmit() {
      final number = accountNumberController.text.trim();
      final bank = selectedBank.value;
      final name = resolvedName.value;

      if (bank == null && !_isEditing) {
        MessageHandler.showErrorSnackBar(context, 'Please select a bank');
        return;
      }
      if (number.length != 10) {
        MessageHandler.showErrorSnackBar(context, 'Please enter a valid 10-digit account number');
        return;
      }
      if (name == null || name.isEmpty) {
        MessageHandler.showErrorSnackBar(context, 'Account name could not be resolved');
        return;
      }

      if (_isEditing) {
        ref.read(updateBankAccountProvider.notifier).call(
              id: account!.id,
              accountName: name,
              accountNumber: number,
              bankName: bank?.bankName ?? account!.bankName,
              bankCode: bank?.bankCode ?? account!.bankCode,
            );
      } else {
        ref.read(addBankAccountProvider.notifier).call(
              accountName: name,
              accountNumber: number,
              bankName: bank!.bankName,
              bankCode: bank.bankCode,
            );
      }
    }

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(title: 'Bank Details'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            32.verticalSpace,
            Text(
              _isEditing ? 'Edit Account' : 'Add Account',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: Colors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            8.verticalSpace,
            Text(
              'Fill the fields below to ${_isEditing ? 'edit' : 'add'} account details',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: PPaymobileColors.svgIconColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            44.verticalSpace,
            Text(
              'Select Bank',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            4.verticalSpace,
            Container(
              height: 54.h,
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(6).r),
              child: TextFormField(
                controller: bankController,
                readOnly: true,
                decoration: InputDecoration(
                  suffixIcon: TouchOpacity(
                    onTap: () async {
                      final bank = await showModalBottomSheet<BankEntity>(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (_) => const SelectBankBottomsheet(),
                      );
                      if (bank != null) {
                        selectedBank.value = bank;
                        bankController.text = bank.bankName;
                        resolvedName.value = null;
                        // Re-trigger name enquiry if account number already filled
                        if (accountNumberController.text.length == 10) {
                          ref.read(nameEnquiryProvider.notifier).call(
                                accountNumber: accountNumberController.text,
                                bankCode: bank.bankCode,
                              );
                        }
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(12.w),
                      child: SvgPicture.asset('assets/icon/arrow_down.svg', fit: BoxFit.scaleDown),
                    ),
                  ),
                  hintText: 'Select',
                  hintStyle: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.textfiedBorder,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.r),
                    borderSide: BorderSide(color: PPaymobileColors.textfiedBorder, width: 1.w),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.r),
                    borderSide: BorderSide(color: PPaymobileColors.textfiedBorder, width: 1.w),
                  ),
                ),
              ),
            ),
            38.verticalSpace,
            Text(
              'Account Number',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            4.verticalSpace,
            Container(
              height: 54.h,
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(6).r),
              child: TextFormField(
                controller: accountNumberController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ],
                decoration: InputDecoration(
                  hintText: 'e.g. 0000000000',
                  hintStyle: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.textfiedBorder,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.r),
                    borderSide: BorderSide(color: PPaymobileColors.textfiedBorder, width: 1.w),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.r),
                    borderSide: BorderSide(color: PPaymobileColors.textfiedBorder, width: 1.w),
                  ),
                ),
              ),
            ),
            38.verticalSpace,
            // Resolved account name display
            Container(
              height: 78.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5).r,
                color: PPaymobileColors.deepBackgroundColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Account Name',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  ref.watch(nameEnquiryProvider).isLoading
                      ? SizedBox(
                          height: 16.h,
                          width: 16.h,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: PPaymobileColors.buttonColor,
                          ),
                        )
                      : Text(
                          resolvedName.value ?? '—',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: resolvedName.value != null ? Colors.black : PPaymobileColors.svgIconColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                ],
              ),
            ),
            113.verticalSpace,
            if (_isEditing)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: PPButton(
                      text: 'Update',
                      onPressed: handleSubmit,
                    ),
                  ),
                  12.horizontalSpace,
                  Expanded(
                    child: PPButton(
                      text: 'Remove',
                      onPressed: () {
                        ref.read(deleteBankAccountProvider.notifier).call(id: account!.id);
                      },
                      backgroundColor: PPaymobileColors.anotherdangerColor,
                      textColor: PPaymobileColors.transactRed,
                      icon: SizedBox(
                        height: 16.w,
                        width: 16.w,
                        child: SvgPicture.asset('assets/icon/dustbin.svg', fit: BoxFit.contain),
                      ),
                    ),
                  ),
                ],
              )
            else
              PPButton(text: 'Add Account', onPressed: handleSubmit),
          ],
        ),
      ),
    );
  }
}
