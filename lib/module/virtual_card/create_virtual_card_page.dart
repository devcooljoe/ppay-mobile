import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/purchase_dollarcard_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';

@RoutePage()
class CreateVirtualCardPage extends HookConsumerWidget {
  const CreateVirtualCardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(
        title: 'Virtual Card',
        onBackPressed: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              45.verticalSpace,
              Text(
                'Required Verification',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              9.verticalSpace,
              Text(
                'Ensure you have completed all required verification to create dollar card',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              41.verticalSpace,
              Container(
                height: 80.h,
                width: double.infinity,
                padding: EdgeInsets.only(top: 12.h, bottom: 17.h, right: 10.w),
                color: PPaymobileColors.mainScreenBackground,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Email & Phone Verification',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Verify your email and phone number',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 23.w,
                      width: 23.w,
                      child: SvgPicture.asset(
                        'assets/icon/tick_pass.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
              4.verticalSpace,
              Container(
                height: 80.h,
                width: double.infinity,
                padding: EdgeInsets.only(top: 12.h, bottom: 17.h, right: 10.w),
                color: PPaymobileColors.mainScreenBackground,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Bank Verification Number',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Verify BVN to conveniently make transaction',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 23.w,
                      width: 23.w,
                      child: SvgPicture.asset(
                        'assets/icon/tick_pass.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
              4.verticalSpace,
              Container(
                height: 92.h,
                width: double.infinity,
                padding: EdgeInsets.only(top: 12.h, bottom: 17.h, right: 10.w),
                color: PPaymobileColors.mainScreenBackground,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'KYC Verification',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Verify your government issued ID and face recognition',
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
                    Padding(
                      padding: EdgeInsets.only(left: 26.0.w),
                      child: SizedBox(
                        height: 23.h,
                        width: 12.w,
                        child: SvgPicture.asset(
                          'assets/icon/arrow_forward.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              75.verticalSpace,
              Container(
                height: 66,
                width: double.infinity,
                color: PPaymobileColors.warningColor,
                padding: EdgeInsets.symmetric(vertical: 9.0.h, horizontal: 8.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 16.w,
                      width: 16.w,
                      child: SvgPicture.asset(
                        'assets/icon/warning.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Note: You will be fined  \$1,23 dollars to create new dollar card. To proceed click the button below",
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: PPaymobileColors.warningTextColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              24.verticalSpace,
              PPButton(
                text: 'Pay \$XXX to activate card',
                onPressed: () {},
                backgroundColor: PPaymobileColors.anotherbuttonbgColor,
              ),
              10.verticalSpace,
              PPButton(
                text: 'Pay \$XXX to activate card',
                onPressed: () async {
                  await showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (_) => const PurchaseDollarcardBottomsheet(),
                  );
                },
                backgroundColor: PPaymobileColors.backgroundColor,
              ),
              17.verticalSpace,
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Review ',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'InstrumentSans',
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: 'Terms and condition',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'InstrumentSans',
                        fontWeight: FontWeight.w600,
                        color: PPaymobileColors.buyTradeContainerColor,
                        decoration: TextDecoration.underline,
                        decorationColor:
                            PPaymobileColors.buyTradeContainerColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
