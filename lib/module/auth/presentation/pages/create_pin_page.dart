import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pinput/pinput.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/auth/presentation/providers/auth_providers.dart';
import 'package:ppay_mobile/shared/widgets/app_loader.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/custom_keyboard.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';

@RoutePage()
class CreatePinPage extends HookConsumerWidget {
  const CreatePinPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pinController = useTextEditingController();
    final confirmPinController = useTextEditingController();
    final isConfirming = useState(false);
    final enteredPin = useState('');

    void onKeyTap(String value) {
      final controller =
          isConfirming.value ? confirmPinController : pinController;
      if (controller.text.length < 4) {
        controller.text += value;
      }
    }

    void onDelete() {
      final controller =
          isConfirming.value ? confirmPinController : pinController;
      if (controller.text.isNotEmpty) {
        controller.text =
            controller.text.substring(0, controller.text.length - 1);
      }
    }

    ref.listen(setPinProvider, (previous, next) {
      if (next.isLoading) {
        AppLoader.show(context);
      } else {
        AppLoader.hide(context);
        next.whenData((_) {
          context.router.replace(const CreatedPinRoute());
        });
        if (next.hasError) {
          MessageHandler.showErrorSnackBar(context, next.error.toString());
          isConfirming.value = false;
          confirmPinController.clear();
          pinController.clear();
          enteredPin.value = '';
        }
      }
    });

    void handleNext() {
      if (!isConfirming.value) {
        if (pinController.text.length != 4) {
          MessageHandler.showErrorSnackBar(
            context,
            'Please enter a 4-digit PIN',
          );
          return;
        }
        enteredPin.value = pinController.text;
        isConfirming.value = true;
      } else {
        if (confirmPinController.text.length != 4) {
          MessageHandler.showErrorSnackBar(
            context,
            'Please confirm your 4-digit PIN',
          );
          return;
        }
        if (confirmPinController.text != enteredPin.value) {
          MessageHandler.showErrorSnackBar(context, 'PINs do not match');
          confirmPinController.clear();
          return;
        }
        ref.read(setPinProvider.notifier).call(
              pin: enteredPin.value,
              confirmPin: confirmPinController.text,
            );
      }
    }

    final activeController =
        isConfirming.value ? confirmPinController : pinController;

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(
        onBackPressed: isConfirming.value
            ? () {
                isConfirming.value = false;
                confirmPinController.clear();
              }
            : null,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
        child: ListView(
          children: [
            10.verticalSpace,
            Text(
              isConfirming.value ? 'Confirm PIN' : 'Security Pin',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: PPaymobileColors.buttonColorandText,
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            4.verticalSpace,
            Text(
              isConfirming.value
                  ? 'Re-enter your 4-digit PIN to confirm'
                  : 'Enter a unique 4-digit security PIN',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: PPaymobileColors.svgIconColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            30.verticalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 76.w,
                  width: 76.w,
                  padding: const EdgeInsets.all(13).r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(38).r,
                    color: const Color(0xffEFF5F2),
                  ),
                  child: SizedBox(
                    height: 28.w,
                    width: 28.w,
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/icon/padlock.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                30.verticalSpace,
                Pinput(
                  controller: activeController,
                  length: 4,
                  keyboardType: TextInputType.none,
                  separatorBuilder: (index) => 15.horizontalSpace,
                  defaultPinTheme: PinTheme(
                    width: 75.w,
                    height: 63.h,
                    textStyle: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'InstrumentSans',
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: PPaymobileColors.textfiedBorder,
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),
                  focusedPinTheme: PinTheme(
                    width: 75.w,
                    height: 63.h,
                    textStyle: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'InstrumentSans',
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: PPaymobileColors.buttonColor,
                        width: 2.w,
                      ),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),
                ),
                10.verticalSpace,
                Text(
                  'Please keep PIN secure. It will be required before performing any transaction.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                10.verticalSpace,
                CustomKeyboard(onKeyTap: onKeyTap, onDelete: onDelete),
                14.verticalSpace,
                PPButton(
                  text: isConfirming.value ? 'Confirm PIN' : 'Next',
                  onPressed: handleNext,
                  icon: SvgPicture.asset(
                    'assets/icon/arrow_forwardw.svg',
                    height: 20.w,
                    width: 20.w,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
