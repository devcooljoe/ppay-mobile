import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/module/shopping/order_successful_page.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pin_custom_keyboard.dart';

class PaymentPinBottomsheet extends HookConsumerWidget {
  const PaymentPinBottomsheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayController = useTextEditingController();
    final realPin = useState('');

    final emptyPinTheme = useMemoized(() => PinTheme(
      width: 11.w,
      height: 11.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: PPaymobileColors.textfiedBorder, width: 1.5),
        color: Colors.transparent,
      ),
    ));

    final filledPinTheme = useMemoized(() => PinTheme(
      width: 11.w,
      height: 11.w,
      textStyle: TextStyle(color: Colors.transparent),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFF0B3A3A),
      ),
    ));

    void onKeyTap(String value) {
      if (realPin.value.length >= 4) return;

      realPin.value += value;
      displayController.text = realPin.value;

      if (realPin.value.length == 4) {
        Future.delayed(const Duration(milliseconds: 200), () {
          if (!context.mounted) return;

          Navigator.pop(context);

          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const OrderSuccessfulPage()),
          );
        });
      }
    }

    void onDelete() {
      if (realPin.value.isEmpty) return;

      realPin.value = realPin.value.substring(0, realPin.value.length - 1);
      displayController.text = realPin.value;
    }
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
                      controller: displayController,
                      length: 4,
                      readOnly: true,
                      showCursor: false,

                      defaultPinTheme: emptyPinTheme,
                      focusedPinTheme: emptyPinTheme,
                      submittedPinTheme: filledPinTheme,

                      separatorBuilder: (_) => 54.horizontalSpace,
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
                  PinCustomKeyboard(onKeyTap: onKeyTap, onDelete: onDelete),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
