import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/custom_keyboard.dart';
import 'package:ppay_mobile/shared/widgets/custom_keyboard_container.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_label.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/provider_card.dart';
import 'package:ppay_mobile/shared/widgets/subscription_package_card.dart';

@RoutePage()
class TvCablePage extends HookConsumerWidget {
  const TvCablePage({super.key});

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
        title: 'Tv Cable',
        onBackPressed: () => Navigator.pop(context),
      ),
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                showKeyboard.value = false;
              },
              child: ListView(
                children: [
                  36.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: PPLabel(text: 'Select Providers'),
                  ),
                  22.verticalSpace,
                  SizedBox(
                    height: 106.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.0.w),
                          child: ProviderCard(
                            imagePath: 'assets/images/dstv_1.png',
                            name: 'DSTV',
                          ),
                        ),
                        ProviderCard(
                          imagePath: 'assets/images/dstv_1.png',
                          name: 'DSTV',
                        ),
                        ProviderCard(
                          imagePath: 'assets/images/dstv_1.png',
                          name: 'DSTV',
                        ),
                        ProviderCard(
                          imagePath: 'assets/images/dstv_1.png',
                          name: 'DSTV',
                        ),
                      ],
                    ),
                  ),
                  56.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: PPLabel(text: 'Smart Card Number'),
                  ),
                  8.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: SizedBox(
                      height: 54.h,
                      width: double.infinity,
                      child: TextFormField(
                        showCursor: true,
                        keyboardType: TextInputType.number,
                        onTap: () {
                          showKeyboard.value = false;
                        },
                        decoration: InputDecoration(
                          hint: Text(
                            'Enter Number',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: PPaymobileColors.anotherGreyColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: PPaymobileColors.textfieldGrey,
                              width: 1.w,
                            ),
                            borderRadius: BorderRadius.circular(6).r,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: PPaymobileColors.textfieldGrey,
                              width: 1.w,
                            ),
                            borderRadius: BorderRadius.circular(6).r,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 14.h,
                          ),
                        ),
                      ),
                    ),
                  ),
                  32.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: PPLabel(text: 'Renewal'),
                  ),
                  8.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: SizedBox(
                      height: 54.h,
                      width: double.infinity,
                      child: TextFormField(
                        showCursor: true,
                        readOnly: true,
                        onTap: () {
                          showKeyboard.value = true;
                        },
                        decoration: InputDecoration(
                          hint: RichText(
                            text: TextSpan(
                              text: '₦ ',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Enter Amount',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: PPaymobileColors.anotherGreyColor,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: PPaymobileColors.textfieldGrey,
                              width: 1.w,
                            ),
                            borderRadius: BorderRadius.circular(6).r,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: PPaymobileColors.textfieldGrey,
                              width: 1.w,
                            ),
                            borderRadius: BorderRadius.circular(6).r,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 14.h,
                          ),
                        ),
                      ),
                    ),
                  ),
                  32.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PPLabel(text: 'Packages'),
                        Text(
                          'Balance: ₦400,000',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.buttonColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  24.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SubscriptionPackageCard(
                          packageName: 'DSTV PADI',
                          price: '₦4,400',
                          duration: '1Month',
                        ),
                        SubscriptionPackageCard(
                          packageName: 'DSTV YANGA',
                          price: '₦6,000',
                          duration: '1Month',
                        ),
                        SubscriptionPackageCard(
                          packageName: 'DSTV CONFAM',
                          price: '₦11,000',
                          duration: '1Month',
                        ),
                      ],
                    ),
                  ),
                  10.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SubscriptionPackageCard(
                          packageName: 'DSTV COMPACT',
                          price: '₦19.000',
                          duration: '1Month',
                        ),
                        SubscriptionPackageCard(
                          packageName: 'DSTV COMPACT PLUS',
                          price: '₦30,000',
                          duration: '1Month',
                        ),
                        SubscriptionPackageCard(
                          packageName: 'DSTV STREAM PREMIUM',
                          price: '₦44,000',
                          duration: '1Month',
                        ),
                      ],
                    ),
                  ),
                  89.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: PPButton(
                      text: 'Subscribe',
                      onPressed: () => context.router.push(TvCableConfirmRoute()),
                      backgroundColor: PPaymobileColors.onTapButtonColor,
                    ),
                  ),
                  15.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: PPButton(
                      text: 'Subscribe',
                      onPressed: () => context.router.push(TvCableConfirmRoute()),
                      backgroundColor: PPaymobileColors.buttonColorandText,
                    ),
                  ),
                ],
              ),
            ),
          ),
          10.verticalSpace,
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
    );
  }
}
