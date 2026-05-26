import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/shared/models/bank_model.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/select_bank_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_label.dart';
import 'package:ppay_mobile/shared/widgets/pp_text_field.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';

@RoutePage()
class TransferFundsPage extends HookConsumerWidget {
  const TransferFundsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bankController = useTextEditingController();
    final selectedBank = useState<BankModel?>(null);
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
                final bank = await showModalBottomSheet<BankModel>(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (_) => const SelectBankBottomsheet(),
                );

                if (bank != null) {
                  selectedBank.value = bank;
                  bankController.text = bank.bankName;
                }
              },
              child: AbsorbPointer(
                child: PPTextField(
                  controller: bankController,
                  readOnly: true,
                  hintText: 'Select',
                  prefixIcon: selectedBank.value == null
                      ? null
                      : Padding(
                          padding: EdgeInsets.all(12.w),
                          child: SizedBox(
                            width: 26.w,
                            height: 22.h,
                            child: Image.asset(
                              selectedBank.value!.bankImage,
                              fit: BoxFit.contain,
                            ),
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
            const PPTextField(
              hintText: 'e.g. 0000000000',
            ),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 24.w,
                  width: 24.w,
                  child: SvgPicture.asset(
                    'assets/icon/loading.svg',
                    fit: BoxFit.contain,
                  ),
                ),
                8.horizontalSpace,
                Text(
                  'Loading bank name',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            20.verticalSpace,
            Container(
              height: 34.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(color: PPaymobileColors.doneColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                    'Adebami Samuel',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            223.verticalSpace,
            PPButton(
              text: 'Continue',
              backgroundColor: PPaymobileColors.filterBorderColor,
              onPressed: () {},
            ),
            20.verticalSpace,
            PPButton(
              text: 'Add Bank',
              onPressed: () {},
            ),
            20.verticalSpace,
            PPButton(
              text: 'Bank Added',
              icon: SizedBox(
                height: 22.w,
                width: 22.w,
                child: SvgPicture.asset(
                  'assets/icon/check_white.svg',
                  fit: BoxFit.contain,
                ),
              ),
              onPressed: () {},
            ),
            20.verticalSpace,
            PPButton(
              text: 'Transfer to Account',
              onPressed: () {
                context.router.push(AmountAndInfoRoute());
              },
            ),
          ],
        ),
      ),
    );
  }
}
