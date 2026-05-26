import 'package:auto_route/auto_route.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/shared/widgets/airtime_beneficiary_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/custom_keyboard.dart';
import 'package:ppay_mobile/shared/widgets/custom_keyboard_container.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_label.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/network_provider_card.dart';
import 'package:ppay_mobile/shared/widgets/data_plan_card.dart';

@RoutePage()
class DataPage extends HookConsumerWidget {
  const DataPage({super.key});

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
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: PPaymobileColors.mainScreenBackground,
        appBar: const PPAppBar(title: 'Data'),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Select Network',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TouchOpacity(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) {
                                  return AirtimeBeneficiaryBottomsheet();
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
                    ),
                    22.verticalSpace,
                    SizedBox(
                      height: 106.h,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20.0.w),
                            child: NetworkProviderCard(
                              imagePath: 'assets/images/mtn.png',
                              name: 'MTN',
                            ),
                          ),
                          NetworkProviderCard(
                            imagePath: 'assets/images/airtel.png',
                            name: 'Airtel',
                          ),
                          NetworkProviderCard(
                            imagePath: 'assets/images/9mobile.png',
                            name: '9mobile',
                          ),
                          NetworkProviderCard(
                            imagePath: 'assets/images/glo.png',
                            name: 'Glo',
                          ),
                        ],
                      ),
                    ),
                    56.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: const PPLabel(text: 'Phone Number'),
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
                          decoration: InputDecoration(
                            hint: RichText(
                              text: TextSpan(
                                text: '+234 ',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Enter Number',
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
                          Text(
                            'Choose Plan',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
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
                      padding: EdgeInsets.only(left: 20.0.w),
                      child: PreferredSize(
                        preferredSize: Size.fromHeight(30),
                        child: TabBar(
                          isScrollable: true,
                          dividerColor: PPaymobileColors.deepBackgroundColor,
                          tabAlignment: TabAlignment.start,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorColor: PPaymobileColors.buttonColor,
                          indicatorWeight: 3,
                          labelPadding: EdgeInsets.symmetric(horizontal: 12),
                          labelStyle: TextStyle(
                            fontFamily: 'InstrumentSans',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: PPaymobileColors.buttonColor,
                          ),
                          unselectedLabelStyle: TextStyle(
                            fontFamily: 'InstrumentSans',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          unselectedLabelColor: Colors.black,
                          tabs: const [
                            Tab(text: 'Popular Plans'),
                            Tab(text: 'Daily'),
                            Tab(text: 'Weekly'),
                            Tab(text: 'Monthly'),
                          ],
                        ),
                      ),
                    ),
                    44.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DataPlanCard(duration: '7 days', plan: '1GB @ ₦1000'),
                          DataPlanCard(duration: '2 days', plan: '2GB @ ₦400'),
                          DataPlanCard(duration: '7 days', plan: '5GB @ ₦1500'),
                        ],
                      ),
                    ),
                    10.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DataPlanCard(duration: '1 day', plan: '1GB @ ₦300'),
                          DataPlanCard(duration: '3 days', plan: '4GB @ ₦3000'),
                          DataPlanCard(duration: '7 days', plan: '20GB @ ₦15000'),
                        ],
                      ),
                    ),
                    89.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: PPButton(
                        text: 'Buy Data',
                        backgroundColor: PPaymobileColors.onTapButtonColor,
                        textColor: PPaymobileColors.mainScreenBackground,
                        onPressed: () {
                          context.router.push(DataConfirmRoute());
                        },
                      ),
                    ),
                    15.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: PPButton(
                        text: 'Buy Data',
                        backgroundColor: PPaymobileColors.buttonColorandText,
                        textColor: PPaymobileColors.mainScreenBackground,
                        onPressed: () {
                          context.router.push(DataConfirmRoute());
                        },
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
