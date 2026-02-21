import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/crypto_transaction_succesful_screen.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/custom_keyboard_container.dart';
import 'package:ppay_mobile/screens/widgets/pin_custom_keyboard.dart';

class CryptoPinBottomsheet extends StatefulWidget {
  const CryptoPinBottomsheet({super.key});

  @override
  State<CryptoPinBottomsheet> createState() => _CryptoPinBottomsheetState();
}

class _CryptoPinBottomsheetState extends State<CryptoPinBottomsheet> {
  final TextEditingController _displayController = TextEditingController();
  String _realPin = '';

  final emptyPinTheme = PinTheme(
    width: 11.w,
    height: 11.w,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: PPaymobileColors.textfiedBorder, width: 1.5),
      color: Colors.transparent,
    ),
  );

  final filledPinTheme = PinTheme(
    width: 11.w,
    height: 11.w,
    textStyle: TextStyle(color: Colors.transparent),
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      color: Color(0xFF0B3A3A),
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
          MaterialPageRoute(
            builder: (_) => const CryptoTransactionSuccesfulScreen(),
          ),
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
      heightFactor: 0.680,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Transform.translate(
            offset: const Offset(0, 0),
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 60.w,
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
              padding: EdgeInsets.only(left: 20.w, top: 25.h, right: 20.w),
              width: double.infinity,
              decoration: BoxDecoration(
                color: PPaymobileColors.mainScreenBackground,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
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
                  10.verticalSpace,
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

                  //CUSTOM KEYPAD
                  Padding(
                    padding: EdgeInsets.all(11.0.r),
                    child: KeyboardContainer(
                      child: PinCustomKeyboard(
                        onKeyTap: _onKeyTap,
                        onDelete: _onDelete,
                      ),
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
