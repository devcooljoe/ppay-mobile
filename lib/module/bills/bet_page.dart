import 'package:auto_route/auto_route.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/shared/widgets/amount_package_button.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/custom_keyboard.dart';
import 'package:ppay_mobile/shared/widgets/custom_keyboard_container.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/pp_label.dart';
import 'package:ppay_mobile/shared/widgets/provider_card.dart';
import 'package:ppay_mobile/shared/widgets/select_bet_provider_bottomsheet.dart';

@RoutePage()
class BetPage extends HookConsumerWidget {
  const BetPage({super.key});

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
        controller.text = controller.text.substring(
          0,
          controller.text.length - 1,
        );
      }
    }

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(
        title: 'Betting',
        onBackPressed: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: Column(
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
                      child: PPLabel(text: 'Bet Providers'),
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
                              imagePath: 'assets/images/sporty.png',
                              name: 'Sporty',
                            ),
                          ),
                          ProviderCard(
                            imagePath: 'assets/images/sporty.png',
                            name: 'Sporty',
                          ),
                          ProviderCard(
                            imagePath: 'assets/images/sporty.png',
                            name: 'Sporty',
                          ),
                          ProviderCard(
                            imagePath: 'assets/images/sporty.png',
                            name: 'Sporty',
                          ),
                        ],
                      ),
                    ),
                    8.verticalSpace,
                    TouchOpacity(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) {
                            return SelectBetProviderBottomsheet();
                          },
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0.w),
                        child: Text(
                          'See more',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.buttonColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    48.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: PPLabel(text: 'User ID'),
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
                              'Enter ID',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: PPaymobileColors.anotherGreyColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
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
                      child: PPLabel(text: 'Enter Amount'),
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
                          PPLabel(text: 'Select amount'),
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
                          AmountPackageButton(amount: '₦100'),
                          AmountPackageButton(amount: '₦200'),
                          AmountPackageButton(amount: '₦500'),
                          AmountPackageButton(amount: '₦1000'),
                        ],
                      ),
                    ),
                    10.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AmountPackageButton(amount: '₦100'),
                          AmountPackageButton(amount: '₦200'),
                          AmountPackageButton(amount: '₦500'),
                          AmountPackageButton(amount: '₦1000'),
                        ],
                      ),
                    ),
                    89.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: PPButton(
                        text: 'Make Payment',
                        onPressed: () => context.router.push(BetConfirmRoute()),
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
      ),
    );
  }
}
