import 'package:flutter/material.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/shared/models/bank_model.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/remove_account_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/select_bank_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';

void _openChangeBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return RemoveAccountBottomsheet();
    },
  );
}

@RoutePage()
class EditAccountPage extends HookConsumerWidget {
  const EditAccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bankController = useTextEditingController();
    final selectedBank = useState<BankModel?>(null);
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(
        title: 'Bank Details',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            32.verticalSpace,
            Text(
              'Edit Account',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: Colors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            8.verticalSpace,
            Text(
              'Fill he fields below to edit account details',
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6).r,
              ),
              child: TextFormField(
                controller: bankController,
                readOnly: true,
                decoration: InputDecoration(
                  icon: selectedBank.value == null
                      ? null
                      : Padding(
                          padding: EdgeInsets.all(12.w),
                          child: Image.asset(
                            selectedBank.value!.bankImage,
                            width: 24.w,
                            height: 24.h,
                            fit: BoxFit.contain,
                          ),
                        ),

                  suffixIcon: TouchOpacity(
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
                    child: Padding(
                      padding: EdgeInsets.all(12.w),
                      child: SvgPicture.asset(
                        'assets/icon/arrow_down.svg',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),

                  hintText: 'Select',
                  hintStyle: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.textfiedBorder,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),

                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 14.h,
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.r),
                    borderSide: BorderSide(
                      color: PPaymobileColors.textfiedBorder,
                      width: 1.w,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.r),
                    borderSide: BorderSide(
                      color: PPaymobileColors.textfiedBorder,
                      width: 1.w,
                    ),
                  ),
                ),
              ),
            ),
            38.verticalSpace,
            Text(
              'Recipient Account No',
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6).r,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'e.g. 0000000000',
                  hintStyle: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.textfiedBorder,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 14.h,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.r),
                    borderSide: BorderSide(
                      color: PPaymobileColors.textfiedBorder,
                      width: 1.w,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.r),
                    borderSide: BorderSide(
                      color: PPaymobileColors.textfiedBorder,
                      width: 1.w,
                    ),
                  ),
                ),
              ),
            ),
            38.verticalSpace,
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
                    'Recipient Name',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'Adebami Samuel',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            113.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                child: PPButton(
                  text: 'Update',
                  onPressed: () {},
                  backgroundColor: PPaymobileColors.buttonInactiveColor,
                ),
              ),
              12.horizontalSpace,
              Expanded(
                child: PPButton(
                  text: 'Remove',
                  onPressed: () => _openChangeBottomSheet(context),
                  backgroundColor: PPaymobileColors.anotherdangerColor,
                  textColor: PPaymobileColors.transactRed,
                  icon: SizedBox(
                    height: 16.w,
                    width: 16.w,
                    child: SvgPicture.asset(
                      'assets/icon/dustbin.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
