import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/custom_switch.dart';
import 'package:ppay_mobile/shared/widgets/sell_giftcard_pin_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class ConfirmGiftCardSellPage extends HookConsumerWidget {
  const ConfirmGiftCardSellPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
                      },
                    ),
                  ),
                  13.horizontalSpace,
                  Text(
                    'Enable notifications when approved',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.svgIconColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              40.verticalSpace,
              Container(
                height: 104.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
                color: PPaymobileColors.warningColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 19.w,
                      width: 19.w,
                      child: SvgPicture.asset(
                        'assets/icon/warning.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                    8.horizontalSpace,
                    Expanded(
                      child: Text(
                        'Your payout will be automatically sent to your wallet once approved. You will receive ₦500,000 upon successful verification.',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              40.verticalSpace,
              Container(
                height: 246.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 23.h),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.w,
                    color: PPaymobileColors.filterBorderColor,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Card Tips',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    16.verticalSpace,
                    Text(
                      'Ensure all card details provided are correct. Incorrect information may cause delays',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: PPaymobileColors.svgIconColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    19.verticalSpace,
                    Text(
                      'Uploaded images must be clear and unaltered to avoid rejection',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: PPaymobileColors.svgIconColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    19.verticalSpace,
                    Text(
                      'Do not share your card code with anyone outside the app',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: PPaymobileColors.svgIconColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              78.verticalSpace,
              TouchOpacity(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) {
                      return SellGiftcardPinBottomsheet();
                    },

                },
                child: Container(
                  height: 50.h,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(56).r,
                    color: PPaymobileColors.buttonColorandText,
                  ),
                  child: Center(
                    child: Text(
                      'Proceed to Payment',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              12.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 20.w,
                    width: 20.w,
                    child: SvgPicture.asset(
                      'assets/icon/padlock_1.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                  5.horizontalSpace,
                  Text(
                    'Your transaction is securely encrypted',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              30.verticalSpace,
            ],
          ),
        ),
              ),
      ),
    );  }
