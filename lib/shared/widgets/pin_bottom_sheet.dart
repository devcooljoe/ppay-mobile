import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/module/auth/presentation/providers/auth_providers.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pin_custom_keyboard.dart';

class PinBottomSheet extends HookConsumerWidget {
  final VoidCallback onPinVerified;

  const PinBottomSheet({super.key, required this.onPinVerified});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayController = useTextEditingController();
    final realPin = useState('');
    final hasError = useState(false);
    final isLoading = useState(false);

    final emptyPinTheme = useMemoized(() => PinTheme(
          width: 11.w,
          height: 11.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border:
                Border.all(color: PPaymobileColors.textfiedBorder, width: 1.5),
            color: Colors.transparent,
          ),
        ));

    final filledPinTheme = useMemoized(() => PinTheme(
          width: 11.w,
          height: 11.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF0B3A3A),
          ),
        ));

    Future<void> onKeyTap(String value) async {
      if (isLoading.value || realPin.value.length >= 4) return;

      hasError.value = false;
      realPin.value += value;
      displayController.text = realPin.value;

      if (realPin.value.length == 4) {
        isLoading.value = true;
        final pin = realPin.value;

        final success =
            await ref.read(verifyPinProvider.notifier).call(pin: pin);

        isLoading.value = false;

        if (!context.mounted) return;

        if (success) {
          Navigator.pop(context);
          onPinVerified();
        } else {
          hasError.value = true;
          realPin.value = '';
          displayController.text = '';
        }
      }
    }

    void onDelete() {
      if (isLoading.value || realPin.value.isEmpty) return;
      hasError.value = false;
      realPin.value = realPin.value.substring(0, realPin.value.length - 1);
      displayController.text = realPin.value;
    }

    return FractionallySizedBox(
      heightFactor: 0.750,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 60.w,
              width: 60.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30).r,
                color: PPaymobileColors.mainScreenBackground,
              ),
              child: Center(
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
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(24.r)),
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
                    textAlign: TextAlign.center,
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
                      obscureText: true,
                      obscuringCharacter: '.',
                      defaultPinTheme: emptyPinTheme,
                      focusedPinTheme: emptyPinTheme,
                      submittedPinTheme: filledPinTheme,
                      separatorBuilder: (_) => 50.horizontalSpace,
                    ),
                  ),
                  8.verticalSpace,
                  if (isLoading.value)
                    SizedBox(
                      height: 20.h,
                      width: 20.h,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: PPaymobileColors.backgroundColor,
                      ),
                    )
                  else if (hasError.value)
                    Text(
                      'Incorrect Transaction Pin. Try again',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: PPaymobileColors.redTextfield,
                      ),
                    )
                  else
                    SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.only(top: 8.h),
                    child: PinCustomKeyboard(
                      onKeyTap: (v) => onKeyTap(v),
                      onDelete: onDelete,
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
