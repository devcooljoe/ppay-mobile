import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/custom_keyboard.dart';

class PinBottomSheet extends StatefulWidget {
  const PinBottomSheet({super.key});

  @override
  State<PinBottomSheet> createState() => _PinBottomSheetState();
}

class _PinBottomSheetState extends State<PinBottomSheet> {
  final TextEditingController _pinController = TextEditingController();

  void _onKeyTap(String value) {
    if (_pinController.text.length < 4) {
      setState(() {
        _pinController.text += value;
      });
    }
  }

  void _onDelete() {
    if (_pinController.text.isNotEmpty) {
      setState(() {
        _pinController.text = _pinController.text.substring(
          0,
          _pinController.text.length - 1,
        );
      });
    }
  }

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 12.w,
      height: 12.w,
      decoration: BoxDecoration(
        color: const Color(0xFF0B3A3A), // dot color
        shape: BoxShape.circle,
      ),
    );

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
                    controller: _pinController,
                    length: 4,
                    showCursor: false,
                    readOnly: true, // 🔥 disables system keyboard
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: defaultPinTheme,
                    submittedPinTheme: defaultPinTheme,
                    separatorBuilder: (index) => SizedBox(width: 24.w),
                  ),

                  48.verticalSpace,

                  /// CUSTOM KEYPAD
                  CustomKeyboard(onKeyTap: _onKeyTap, onDelete: _onDelete),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
