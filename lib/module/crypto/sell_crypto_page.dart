import 'package:flutter/material.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/crypto_confirm_sell_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/crypto_sell_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/custom_keyboard.dart';
import 'package:ppay_mobile/shared/widgets/custom_keyboard_container.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';

@RoutePage()
class SellCryptoPage extends HookConsumerWidget {
  const SellCryptoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final showKeyboard = useState(false);

    void onKeyTap(String value) {
      if (value == '.' && controller.text.contains('.')) return;
      if (value == '.' && controller.text.isEmpty) return;
      controller.text += value;
    }

    void onDelete() {
      if (controller.text.isNotEmpty) {
        controller.text = controller.text.substring(0, controller.text.length - 1);
      }
    }
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(
        title: 'Sell Crypto',
        onBackPressed: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    showKeyboard.value = false;
                  },
                  child: ListView(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    children: [
                      37.verticalSpace,
                      Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 24.w,
                              width: 24.w,
                              child: Image.asset(
                                'assets/images/bitcoin.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            12.horizontalSpace,
                            RichText(
                              text: TextSpan(
                                text: 'Balance: ',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: PPaymobileColors.svgIconColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                children: [
                                  TextSpan(
                                    text: '₦689,098.00/0.000009 BTC',
                                    style: TextStyle(
                                      fontFamily: 'InstrumentSans',
                                      color: Colors.black,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            10.horizontalSpace,
                            SizedBox(
                              height: 12.h,
                              width: 24.w,
                              child: SvgPicture.asset(
                                'assets/icon/arrow_down.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                      20.verticalSpace,
                      Center(
                        child: TouchOpacity(
                          onTap: () {
                            showKeyboard.value = true;
                          },
                          child: RichText(
                            text: TextSpan(
                              text: '₦',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              children: [
                                TextSpan(
                                  text: '0',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 48.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: '.00',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      10.verticalSpace,
                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: 'Min: ',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            children: [
                              TextSpan(
                                text: '0.000020BTC',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      45.verticalSpace,
                      Text(
                        'You Sell',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      4.verticalSpace,
                      SizedBox(
                        height: 68.h,
                        width: double.infinity,
                        child: TextFormField(
                          controller: controller,
                          readOnly: true,
                          showCursor: true,

                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.0.w,
                                vertical: 12.h,
                              ),
                              child: Container(
                                height: 44.h,
                                width: 95.w,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                  vertical: 4.h,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(37).r,
                                  color: PPaymobileColors.deepBackgroundColor,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 36.w,
                                      width: 36.w,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: AssetImage(
                                            'assets/images/bitcoin.png',
                                          ),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    11.horizontalSpace,
                                    GestureDetector(
                                      onTap: () async {
                                        await showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          builder: (_) =>
                                              const CryptoSellBottomsheet(),
                                        );
                                      },
                                      child: SizedBox(
                                        height: 12.h,
                                        width: 24.w,
                                        child: SvgPicture.asset(
                                          'assets/icon/arrow_down.svg',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            hintText: '0.0000',
                            hintStyle: TextStyle(
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                              color: PPaymobileColors.svgIconColor,
                            ),
                            suffixIcon: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.0.w,
                                vertical: 20.h,
                              ),
                              child: SizedBox(
                                height: 26.h,
                                width: 36.w,
                                child: Text(
                                  'BTC',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1.w,
                                color: PPaymobileColors.textfiedBorder,
                              ),
                              borderRadius: BorderRadius.circular(6).r,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1.w,
                                color: PPaymobileColors.textfiedBorder,
                              ),
                              borderRadius: BorderRadius.circular(6).r,
                            ),
                          ),
                        ),
                      ),
                      6.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '1 BTC',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: PPaymobileColors.svgIconColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              6.horizontalSpace,
                              SizedBox(
                                height: 17.w,
                                width: 17.w,
                                child: SvgPicture.asset(
                                  'assets/icon/swap.svg',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              6.horizontalSpace,
                              Text(
                                '₦13,000,000.00',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: PPaymobileColors.svgIconColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'Fee: ',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: PPaymobileColors.svgIconColor,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              children: [
                                TextSpan(
                                  text: '₦0.00',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      236.verticalSpace,
                      Text(
                        textAlign: TextAlign.center,
                        'Note: The equivalent naira amount will be deposted into your main wallet',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: PPaymobileColors.svgIconColor,
                        ),
                      ),
                      12.verticalSpace,
                      PPButton(
                        text: 'Sell',
                        onPressed: () async {
                          await showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (_) => const CryptoConfirmSellBottomsheet(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              height: showKeyboard.value ? 424.h : 0,
              child: showKeyboard.value
                  ? KeyboardContainer(
                      child: CustomKeyboard(
                        onKeyTap: onKeyTap,
                        onDelete: onDelete,
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
