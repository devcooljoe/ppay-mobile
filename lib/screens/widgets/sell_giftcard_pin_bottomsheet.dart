import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/sell_gift_card_success_screen.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/pin_custom_keyboard.dart';

class SellGiftcardPinBottomsheet extends StatefulWidget {
  const SellGiftcardPinBottomsheet({super.key});

  @override
  State<SellGiftcardPinBottomsheet> createState() =>
      _SellGiftcardPinBottomsheetState();
}

class _SellGiftcardPinBottomsheetState
    extends State<SellGiftcardPinBottomsheet> {
  final TextEditingController _displayController = TextEditingController();
  String _realPin = '';

  final emptyPinTheme = PinTheme(
    width: 11.w,
    height: 11.w,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: PPaymobileColors.textfiedBorder, width: 1.5),
      color: Colors.transparent, //  empty is transparent
    ),
  );

  final filledPinTheme = PinTheme(
    width: 11.w,
    height: 11.w,
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
          MaterialPageRoute(builder: (_) => const SellGiftCardSuccessScreen()),
        );
      });
    }
  }

  void _onDelete() {
    if (_realPin.isEmpty) return;

    setState(() {
      _realPin = _realPin.substring(0, _realPin.length - 1);
      _displayController.text = _realPin;
    });
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
      heightFactor: 0.750,
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
                  18.verticalSpace,
                  SizedBox(
                    height: 51.h,
                    width: 256.w,
                    child: Pinput(
                      controller: _displayController,
                      length: 4,
                      readOnly: true,
                      showCursor: false,
                      obscureText: true,
                      obscuringCharacter: '.',
                      defaultPinTheme: emptyPinTheme,
                      focusedPinTheme: emptyPinTheme,
                      submittedPinTheme: filledPinTheme,

                      separatorBuilder: (_) => 50.horizontalSpace,
                    ),
                  ),
                  Text(
                    'Incorrect Transaction Pin. Try again',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: PPaymobileColors.redTextfield,
                    ),
                  ),
                  // CUSTOM KEYPAD
                  Padding(
                    padding: EdgeInsets.only(top: 1.0.h),
                    child: PinCustomKeyboard(
                      onKeyTap: _onKeyTap,
                      onDelete: _onDelete,
                    ),
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
