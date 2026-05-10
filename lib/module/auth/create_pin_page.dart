import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pinput/pinput.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
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

    void onKeyTap(String value) {
      if (pinController.text.length < 6) {
        pinController.text += value;
      }
    }

    void onDelete() {
      if (pinController.text.isNotEmpty) {
        pinController.text = pinController.text.substring(
          0,
          pinController.text.length - 1,
        );
      }
    }

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
        child: ListView(
          children: [
            10.verticalSpace,
            Text(
              'Security Pin',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: PPaymobileColors.buttonColorandText,
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            4.verticalSpace,
            Text(
              'Enter unique security pin below',
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
                  padding: EdgeInsets.all(13).r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(38).r,
                    color: Color(0xffEFF5F2),
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
                  controller: pinController,
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
                ),
                10.verticalSpace,
                Text(
                  'Please keep pin secure. Pin will be required before performing any transaction',
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
                // this shows after inputting the pin and clicking outside the container...
                14.verticalSpace,
                PPButton(
                  text: 'Next',
                  onPressed: () => context.router.push(CreatedPinRoute()),
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
