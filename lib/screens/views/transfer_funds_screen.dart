import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/model/bank_model.dart';
import 'package:ppay_mobile/screens/views/amount_and_info_screen.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/select_bank_bottomsheet.dart';

class TransferFundsScreen extends StatefulWidget {
  const TransferFundsScreen({super.key});

  @override
  State<TransferFundsScreen> createState() => _TransferFundsScreenState();
}

class _TransferFundsScreenState extends State<TransferFundsScreen> {
  final TextEditingController _bankController = TextEditingController();
  BankModel? _selectedBank;

  @override
  void dispose() {
    _bankController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          padding: EdgeInsets.only(left: 10.w),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: SizedBox(
              height: 24.h,
              width: 24.w,
              child: SvgPicture.asset(
                'assets/icon/arrow_back.svg',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
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
              Container(
                height: 54.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6).r,
                ),
                child: TextFormField(
                  controller: _bankController,
                  readOnly: true,
                  decoration: InputDecoration(
                    prefixIcon: _selectedBank == null
                        ? null
                        : Padding(
                            padding: EdgeInsets.all(12.w),
                            child: Image.asset(
                              _selectedBank!.bankImage,
                              width: 24.w,
                              height: 24.h,
                              fit: BoxFit.contain,
                            ),
                          ),

                    suffixIcon: GestureDetector(
                      onTap: () async {
                        final bank = await showModalBottomSheet<BankModel>(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (_) => const SelectBankBottomsheet(),
                        );

                        if (bank != null) {
                          setState(() {
                            _selectedBank = bank;
                            _bankController.text = bank.bankName;
                          });
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
                  ),
                ),
              ),
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24.h,
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
                      height: 22.h,
                      width: 22.w,
                      child: SvgPicture.asset(
                        'assets/icon/check.svg',
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
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: PPaymobileColors.textfiedBorder,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(42),
                    ),
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
              20.verticalSpace,
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: PPaymobileColors.backgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(42),
                    ),
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
              20.verticalSpace,
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: PPaymobileColors.backgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(42),
                    ),
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
                        height: 22.h,
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
              20.verticalSpace,
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: PPaymobileColors.backgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(42),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AmountAndInfoScreen(),
                      ),
                    );
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
            ],
          ),
        ),
      ),
    );
  }
}
