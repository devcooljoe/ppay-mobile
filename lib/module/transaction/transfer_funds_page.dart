import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/shared/models/bank_model.dart';
import 'package:ppay_mobile/module/transaction/amount_and_info_page.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/select_bank_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class TransferFundsPage extends HookConsumerWidget {
  const TransferFundsPage({super.key;

}

  final TextEditingController _bankController = TextEditingController();
  BankModel? _selectedBank;

  @override
  void dispose() {
    _bankController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: AppBar(
        backgroundColor: PPaymobileColors.mainScreenBackground,
        toolbarHeight: 56,
        leadingWidth: 56.w,
        title: Text(
          'Bank Details',
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: TouchOpacity(
            onTap: () => context.router.pop(),
            child: SizedBox(
              height: 24.w,
              width: 24.w,
              child: SvgPicture.asset(
                'assets/icon/arrow_back.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
      ),
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
            GestureDetector(
              onTap: () async {
                final bank = await showModalBottomSheet<BankModel>(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (_) => const SelectBankBottomsheet(),

                if (bank != null) {
                  _selectedBank = bank;
                    _bankController.text = bank.bankName;
                  ;
                }
              },
              child: AbsorbPointer(
                child: TextFormField(
                  controller: _bankController,
                  readOnly: true,
                  decoration: InputDecoration(
                    prefixIcon: _selectedBank == null
                        ? null
                        : Padding(
                            padding: EdgeInsets.all(12.w),
                            child: SizedBox(
                              width: 26.w,
                              height: 22.h,
                              child: Image.asset(
                                _selectedBank!.bankImage,
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
                        color: PPaymobileColors.lightGrey,
                        width: 1.w,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      borderSide: BorderSide(
                        color: PPaymobileColors.lightGrey,
                        width: 1.w,
                      ),
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
            TextFormField(
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
                    color: PPaymobileColors.lightGrey,
                    width: 1.w,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.r),
                  borderSide: BorderSide(
                    color: PPaymobileColors.lightGrey,
                    width: 1.w,
                  ),
                ),
              ),
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
            TouchOpacity(
              child: SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: PPaymobileColors.filterBorderColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(42.r),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: PPaymobileColors.mainScreenBackground,
                    ),
                  ),
                ),
              ),
            ),
            20.verticalSpace,
            TouchOpacity(
              child: SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: PPaymobileColors.backgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(42.r),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Add Bank',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: PPaymobileColors.mainScreenBackground,
                    ),
                  ),
                ),
              ),
            ),
            20.verticalSpace,
            TouchOpacity(
              child: SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: PPaymobileColors.backgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(42.r),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Bank Added',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: PPaymobileColors.mainScreenBackground,
                        ),
                      ),
                      10.horizontalSpace,
                      SizedBox(
                        height: 22.w,
                        width: 22.w,
                        child: SvgPicture.asset(
                          'assets/icon/check_white.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            20.verticalSpace,
            TouchOpacity(
              child: SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: PPaymobileColors.backgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(42.r),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AmountAndInfoPage(),
                      ),

                  },
                  child: Text(
                    'Transfer to Account',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: PPaymobileColors.mainScreenBackground,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
              ),
      ),
    );  }
}
