import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pinput/pinput.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/module/auth/presentation/providers/auth_providers.dart';
import 'package:ppay_mobile/module/dashboard/providers/wallet_provider.dart';
import 'package:ppay_mobile/module/virtual_card/presentation/providers/virtual_card_providers.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pin_custom_keyboard.dart';

class FundCardPinBottomsheet extends HookConsumerWidget {
  final double amountUsd;
  final double nairaAmount;
  final double rate;

  const FundCardPinBottomsheet({
    super.key,
    required this.amountUsd,
    required this.nairaAmount,
    required this.rate,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayController = useTextEditingController();
    final realPin = useState('');
    final hasError = useState(false);
    final isLoading = useState(false);

    final emptyPinTheme = useMemoized(
      () => PinTheme(
        width: 11.w, height: 11.w,
        decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: PPaymobileColors.textfiedBorder, width: 1.5), color: Colors.transparent),
      ),
    );

    final filledPinTheme = useMemoized(
      () => PinTheme(
        width: 11.w, height: 11.w,
        textStyle: const TextStyle(color: Colors.transparent),
        decoration: BoxDecoration(shape: BoxShape.circle, color: PPaymobileColors.backgroundColor),
      ),
    );

    Future<void> onPinComplete(String pin) async {
      isLoading.value = true;
      hasError.value = false;

      final verified = await ref.read(verifyPinProvider.notifier).call(pin: pin);

      if (!verified) {
        isLoading.value = false;
        hasError.value = true;
        realPin.value = '';
        displayController.text = '';
        return;
      }

      await ref.read(fundDollarCardProvider.notifier).call(amount: amountUsd);
      final fundState = ref.read(fundDollarCardProvider);

      isLoading.value = false;

      if (!context.mounted) return;

      if (fundState is AsyncError) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(fundState.error.toString()), backgroundColor: Colors.red),
        );
        return;
      }

      // Refresh wallet and card
      ref.read(walletProvider.notifier).fetch();
      ref.read(getDollarCardProvider.notifier).call();

      Navigator.pop(context);
      context.router.push(FundCardSuccessfulRoute(
        amountUsd: amountUsd,
        nairaAmount: nairaAmount,
        rate: rate,
      ));
    }

    void onKeyTap(String value) {
      if (realPin.value.length >= 4 || isLoading.value) return;
      hasError.value = false;
      realPin.value += value;
      displayController.text = realPin.value;

      if (realPin.value.length == 4) {
        Future.delayed(const Duration(milliseconds: 200), () => onPinComplete(realPin.value));
      }
    }

    void onDelete() {
      if (realPin.value.isEmpty || isLoading.value) return;
      realPin.value = realPin.value.substring(0, realPin.value.length - 1);
      displayController.text = realPin.value;
    }

    return FractionallySizedBox(
      heightFactor: 0.740,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 60.w, width: 60.w,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30).r, color: PPaymobileColors.mainScreenBackground),
              child: SizedBox(height: 18.h, width: 18.h, child: SvgPicture.asset('assets/icon/cancel.svg', fit: BoxFit.scaleDown)),
            ),
          ),
          8.verticalSpace,
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 20.w, top: 29.h, right: 20.w),
              width: double.infinity,
              decoration: BoxDecoration(color: PPaymobileColors.mainScreenBackground, borderRadius: BorderRadius.vertical(top: Radius.circular(36).r)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Security Pin', style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.black)),
                  4.verticalSpace,
                  Text('Enter unique security pin below to complete transaction', style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 14.sp, fontWeight: FontWeight.w500, color: PPaymobileColors.svgIconColor)),
                  20.verticalSpace,
                  Pinput(
                    controller: displayController,
                    length: 4,
                    readOnly: true,
                    showCursor: false,
                    defaultPinTheme: emptyPinTheme,
                    focusedPinTheme: emptyPinTheme,
                    submittedPinTheme: filledPinTheme,
                    separatorBuilder: (_) => 40.horizontalSpace,
                  ),
                  14.verticalSpace,
                  if (isLoading.value)
                    const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2))
                  else if (hasError.value)
                    Text('Incorrect Transaction Pin. Try again', style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 14.sp, fontWeight: FontWeight.w500, color: PPaymobileColors.redTextfield))
                  else
                    14.verticalSpace,
                  14.verticalSpace,
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
