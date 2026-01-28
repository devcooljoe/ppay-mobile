import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/gift_card_sucess_screen.dart';
import 'package:ppay_mobile/screens/views/transaction_successful_screen.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/custom_keyboard.dart';
import 'package:ppay_mobile/screens/widgets/pin_custom_keyboard.dart';

class GiftcardPinBotomsheet extends StatefulWidget {
  const GiftcardPinBotomsheet({super.key});

  @override
  State<GiftcardPinBotomsheet> createState() => _GiftcardPinBotomsheetState();
}

class _GiftcardPinBotomsheetState extends State<GiftcardPinBotomsheet> {
  final TextEditingController _displayController = TextEditingController();
  String _realPin = '';

  final emptyPinTheme = PinTheme(
    width: 18.w,
    height: 18.w,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: PPaymobileColors.textfiedBorder, width: 1.5),
      color: Colors.transparent, //  empty is transparent
    ),
  );

  final filledPinTheme = PinTheme(
    width: 18.w,
    height: 18.w,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      color: Color(0xFF0B3A3A), // filled color
    ),
  );

  void _onKeyTap(String value) {
    if (_realPin.length >= 4) return;

    setState(() {
      _realPin += value;
      _displayController.text = _realPin;
    });

    if (_realPin.length == 4) {
      Future.delayed(const Duration(milliseconds: 200), () {
        if (!mounted) return;

        Navigator.pop(context);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const GiftCardSucessScreen()),
        );
      });
    }
  }

  Widget _key(String value, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 82.w,
        alignment: Alignment.center,
        child: Text(
          value,
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: Colors.black,
            fontSize: 32.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _deleteKey({VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 33.h,
        width: 33.w,
        child: SvgPicture.asset(
          'assets/icon/eraser.svg',
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _displayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final defaultPinTheme = PinTheme(
    //   width: 12.w,
    //   height: 12.w,
    //   decoration: BoxDecoration(
    //     color: const Color(0xFF0B3A3A), // dot color
    //     shape: BoxShape.circle,
    //   ),
    // );

    return FractionallySizedBox(
      heightFactor: 0.680,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Transform.translate(
            offset: const Offset(0, 0),
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 60.h,
                width: 60.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30).r,
                  color: PPaymobileColors.mainScreenBackground,
                ),
                child: SizedBox(
                  height: 18.h,
                  width: 18.h,
                  child: SvgPicture.asset(
                    'assets/icon/cancel.svg',
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
          ),
          8.verticalSpace,
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 20.w, top: 29.h, right: 20.w),
              width: double.infinity,
              decoration: BoxDecoration(
                color: PPaymobileColors.mainScreenBackground,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Security Pin',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  4.verticalSpace,
                  Text(
                    'Enter unique security pin below to complete transaction',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: PPaymobileColors.svgIconColor,
                    ),
                  ),
                  20.verticalSpace,
                  Pinput(
                    controller: _displayController,
                    length: 4,
                    readOnly: true,
                    showCursor: false,

                    defaultPinTheme: emptyPinTheme,
                    focusedPinTheme: emptyPinTheme,
                    submittedPinTheme: filledPinTheme,

                    separatorBuilder: (_) => SizedBox(width: 24.w),
                  ),
                  14.verticalSpace,
                  Text(
                    'Incorrect Transaction Pin. Try again',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: PPaymobileColors.redTextfield,
                    ),
                  ),
                  14.verticalSpace,
                  GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    mainAxisSpacing: 24.h,
                    crossAxisSpacing: 48.w,
                    children: [
                      Container(
                        height: 68.h,
                        width: 82.w,
                        padding: EdgeInsets.symmetric(horizontal: 32.w),
                        color: PPaymobileColors.mainScreenBackground,
                        child: _key('1', onTap: () => _onKeyTap('1')),
                      ),
                      Container(
                        height: 68.h,
                        width: 82.w,
                        padding: EdgeInsets.symmetric(horizontal: 32.w),
                        color: PPaymobileColors.mainScreenBackground,
                        child: _key('2', onTap: () => _onKeyTap('2')),
                      ),
                      Container(
                        height: 68.h,
                        width: 82.w,
                        padding: EdgeInsets.symmetric(horizontal: 32.w),
                        color: PPaymobileColors.mainScreenBackground,
                        child: _key('3', onTap: () => _onKeyTap('3')),
                      ),
                      Container(
                        height: 68.h,
                        width: 82.w,
                        padding: EdgeInsets.symmetric(horizontal: 32.w),
                        color: PPaymobileColors.mainScreenBackground,
                        child: _key('4', onTap: () => _onKeyTap('4')),
                      ),
                      Container(
                        height: 68.h,
                        width: 82.w,
                        padding: EdgeInsets.symmetric(horizontal: 32.w),
                        color: PPaymobileColors.mainScreenBackground,
                        child: _key('5', onTap: () => _onKeyTap('5')),
                      ),
                      Container(
                        height: 68.h,
                        width: 82.w,
                        padding: EdgeInsets.symmetric(horizontal: 32.w),
                        color: PPaymobileColors.mainScreenBackground,
                        child: _key('6', onTap: () => _onKeyTap('6')),
                      ),
                      Container(
                        height: 68.h,
                        width: 82.w,
                        padding: EdgeInsets.symmetric(horizontal: 32.w),
                        color: PPaymobileColors.mainScreenBackground,
                        child: _key('7', onTap: () => _onKeyTap('7')),
                      ),
                      Container(
                        height: 68.h,
                        width: 82.w,
                        padding: EdgeInsets.symmetric(horizontal: 32.w),
                        color: PPaymobileColors.mainScreenBackground,
                        child: _key('8', onTap: () => _onKeyTap('8')),
                      ),
                      Container(
                        height: 68.h,
                        width: 82.w,
                        padding: EdgeInsets.symmetric(horizontal: 32.w),
                        color: PPaymobileColors.mainScreenBackground,
                        child: _key('9', onTap: () => _onKeyTap('9')),
                      ),
                      Container(
                        height: 68.h,
                        width: 82.w,
                        padding: EdgeInsets.symmetric(horizontal: 32.w),
                        color: PPaymobileColors.mainScreenBackground,
                        child: _key('.', onTap: () => _onKeyTap('.')),
                      ),
                      Container(
                        height: 68.h,
                        width: 82.w,
                        padding: EdgeInsets.symmetric(horizontal: 32.w),
                        color: PPaymobileColors.mainScreenBackground,
                        child: _key('0', onTap: () => _onKeyTap('0')),
                      ),
                      _deleteKey(onTap: () {}),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
