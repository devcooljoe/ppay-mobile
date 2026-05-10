import 'package:auto_route/auto_route.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/custom_keyboard.dart';
import 'package:ppay_mobile/shared/widgets/custom_keyboard_container.dart';
import 'package:ppay_mobile/shared/widgets/select_beneficiary_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/select_meter_type_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_label.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/amount_package_button.dart';

@RoutePage()
class ElectricityPage extends HookConsumerWidget {
  const ElectricityPage({super.key});

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
        title: 'Electricity Bill',
        onBackPressed: () => Navigator.pop(context),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PPLabel(text: 'Meter Type'),
                        TouchOpacity(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) {
                                return SelectBeneficiaryBottomsheet();
                              },
                            );
                          },
                          child: Text(
                            'Beneficiaries',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: PPaymobileColors.buttonColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                              decorationColor: PPaymobileColors.buttonColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    10.verticalSpace,
                    SizedBox(
                      height: 54.h,
                      width: double.infinity,
                      child: TextFormField(
                        readOnly: true,
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) {
                              return SelectMeterTypeBottomsheet();
                            },
                          );
                        },
                        decoration: InputDecoration(
                          hint: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Prepaid',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          suffixIcon: SizedBox(
                            height: 12.h,
                            width: 24.w,
                            child: SvgPicture.asset(
                              'assets/icon/arrow_down.svg',
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          // hintText: 'Enter Receiver Name',
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
                    32.verticalSpace,
                    PPLabel(text: 'Enter Meter Number'),
                    SizedBox(
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
                    32.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PPLabel(text: 'Amount'),
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
                    24.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AmountPackageButton(amount: '₦100'),
                        12.horizontalSpace,
                        AmountPackageButton(amount: '₦200'),
                        12.horizontalSpace,
                        AmountPackageButton(amount: '₦500'),
                        12.horizontalSpace,
                        AmountPackageButton(amount: '₦1000'),
                      ],
                    ),
                    10.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AmountPackageButton(amount: '₦100'),
                        12.horizontalSpace,
                        AmountPackageButton(amount: '₦200'),
                        12.horizontalSpace,
                        AmountPackageButton(amount: '₦500'),
                        12.horizontalSpace,
                        AmountPackageButton(amount: '₦5000'),
                      ],
                    ),
                    24.verticalSpace,
                    PPLabel(text: 'Amount'),
                    6.verticalSpace,
                    SizedBox(
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
                    72.verticalSpace,
                    PPButton(
                      text: 'Make Payment',
                      onPressed: () => context.router.push(ElectricityConfirmRoute()),
                      backgroundColor: PPaymobileColors.buttonColorandText,
                    ),
                  ],
                ),
              ),
            ),
            20.verticalSpace,
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
