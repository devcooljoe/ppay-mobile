import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/views/confirm_transaction_screen.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/custom_keyboard.dart';
import 'package:ppay_mobile/screens/widgets/custom_keyboard_container.dart';
import 'package:ppay_mobile/screens/widgets/select_account_bottomsheet.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';

class AmountAndInfoScreen extends StatefulWidget {
  const AmountAndInfoScreen({super.key});

  @override
  State<AmountAndInfoScreen> createState() => _AmountAndInfoScreenState();
}

class _AmountAndInfoScreenState extends State<AmountAndInfoScreen> {
  final TextEditingController _amountController = TextEditingController();

  void _onKeyTap(String value) {
    setState(() {
      _amountController.text += value;
    });
  }

  void _onDelete() {
    if (_amountController.text.isNotEmpty) {
      setState(() {
        _amountController.text = _amountController.text.substring(
          0,
          _amountController.text.length - 1,
        );
      });
    }
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
          'Sending To',
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
            onTap: () => Navigator.pop(context),
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
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                46.verticalSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 44.h,
                        width: 41.w,
                        child: Image.asset(
                          'assets/images/access_bank.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      17.verticalSpace,
                      Text(
                        'Adebami Samuel',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: Colors.black,
                        ),
                      ),
                      2.verticalSpace,
                      Text(
                        '9087976570',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: PPaymobileColors.svgIconColor,
                        ),
                      ),
                      40.verticalSpace,
                      Text(
                        _amountController.text.isEmpty
                            ? "₦0.00"
                            : "₦${_amountController.text}.00",
                        style: TextStyle(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                        ),
                      ),
                      11.verticalSpace,
                      Container(
                        height: 24.h,
                        width: 210.w,
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45).r,
                          border: Border.all(
                            width: 1.w,
                            color: PPaymobileColors.textfiedBorder,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Wallet Balance:',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                color: PPaymobileColors.svgIconColor,
                              ),
                            ),
                            1.horizontalSpace,
                            Text(
                              '₦250,000.00',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      39.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Min: ₦20,000.00',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Max: ₦5,000,000.00',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      2.verticalSpace,
                      Container(
                        height: 60.h,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          color: PPaymobileColors.deepBackgroundColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 40.h,
                              width: 44.w,
                              padding: EdgeInsets.all(10).r,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2).r,
                                color: PPaymobileColors.anotherbuttonbgColor,
                              ),
                              child: SizedBox(
                                height: 30.h,
                                width: 28.w,
                                child: Image.asset(
                                  'assets/images/access_bank.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            14.horizontalSpace,
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Adebami Samuel',
                                        style: TextStyle(
                                          fontFamily: 'InstrumentSans',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '9087976570',
                                            style: TextStyle(
                                              fontFamily: 'InstrumentSans',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12.sp,
                                              color:
                                                  PPaymobileColors.svgIconColor,
                                            ),
                                          ),
                                          8.horizontalSpace,
                                          SizedBox(
                                            height: 7.w,
                                            width: 7.w,
                                            child: SvgPicture.asset(
                                              'assets/icon/spacer.svg',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          8.horizontalSpace,
                                          Text(
                                            'Access Bank',
                                            style: TextStyle(
                                              fontFamily: 'InstrumentSans',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12.sp,
                                              color:
                                                  PPaymobileColors.svgIconColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  TouchOpacity(
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        builder: (context) {
                                          return SelectAccountBottomsheet();
                                        },
                                      );
                                    },
                                    child: Container(
                                      height: 35.h,
                                      width: 80.w,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 8.w,
                                        vertical: 7.h,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          4,
                                        ).r,
                                        color: PPaymobileColors
                                            .mainScreenBackground,
                                        border: Border.all(
                                          width: 1.w,
                                          color:
                                              PPaymobileColors.textfiedBorder,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Change",
                                          style: TextStyle(
                                            color: PPaymobileColors.buttonColor,
                                            fontSize: 12.sp,
                                            fontFamily: 'InstrumentSans',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Custom Keyboard
                KeyboardContainer(
                  child: Padding(
                    padding: EdgeInsets.all(30).r,
                    child: CustomKeyboard(
                      onKeyTap: _onKeyTap,
                      onDelete: _onDelete,
                    ),
                  ),
                ),
                24.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: PPaymobileColors.backgroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(42.r),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ConfirmTransactionScreen(),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Next',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              color: Colors.white,
                            ),
                          ),
                          7.horizontalSpace,
                          SizedBox(
                            height: 24.w,
                            width: 24.w,
                            child: SvgPicture.asset(
                              'assets/icon/arrow_forwardw.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
