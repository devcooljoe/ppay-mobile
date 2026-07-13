import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/giftcard/domain/entities/giftcard_entity.dart';
import 'package:ppay_mobile/module/giftcard/presentation/providers/giftcard_providers.dart';
import 'package:ppay_mobile/shared/utils/amount_formatter.dart';
import 'package:ppay_mobile/shared/widgets/app_loader.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/custom_switch.dart';
import 'package:ppay_mobile/shared/widgets/security_pin_bottomsheet.dart';

@RoutePage()
class ConfirmGiftCardSellPage extends HookConsumerWidget {
  final String cardType;
  final String logoUrl;
  final GiftcardSubcategoryEntity subcategory;
  final String country;
  final double amount;
  final double nairaEquivalent;
  final double sellRate;
  final String? ecode;
  final List<XFile> cardImages;

  const ConfirmGiftCardSellPage({
    super.key,
    required this.cardType,
    required this.logoUrl,
    required this.subcategory,
    required this.country,
    required this.amount,
    required this.nairaEquivalent,
    required this.sellRate,
    this.ecode,
    required this.cardImages,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isNotifyEnabled = useState(false);
    final sellState = ref.watch(sellGiftcardProvider);

    ref.listen(sellGiftcardProvider, (_, next) {
      if (next.isLoading) {
        AppLoader.show(context);
      } else {
        AppLoader.hide(context);
        if (next.hasError) {
          MessageHandler.showErrorSnackBar(context, next.error.toString());
        }
      }
    });

    Future<void> onProceed() async {
      final confirmed = await showSecurityPinBottomsheet(context);
      if (!confirmed) return;

      await ref.read(sellGiftcardProvider.notifier).call(
        type: cardType,
        country: country,
        subcategoryId: subcategory.id,
        amount: amount,
        ecode: ecode,
        cardImagePaths: cardImages.map((f) => f.path).toList(),
      );

      if (!context.mounted) return;
      final state = ref.read(sellGiftcardProvider);
      if (state.hasError) {
        MessageHandler.showErrorSnackBar(context, state.error.toString());
      } else {
        context.router.replace(SellGiftCardSuccessRoute(
          cardType: cardType,
          amountInUSD: amount,
          nairaEquivalent: nairaEquivalent,
          sellRate: sellRate,
        ));
      }
    }

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: const PPAppBar(title: 'Sell Gift Card'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: ListView(
            children: [
              55.verticalSpace,
              Text(
                'Confirm Gift Card',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Please carefully confirm your sale',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.svgIconColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              39.verticalSpace,
              // Card header
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: PPaymobileColors.mainScreenBackground,
                  border: Border.all(color: PPaymobileColors.filterBorderColor, width: 1.w),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 22.r,
                      backgroundColor: const Color(0xFF00A86B),
                      child: Text(
                        cardType.isNotEmpty ? cardType[0].toUpperCase() : 'G',
                        style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w700),
                      ),
                    ),
                    12.horizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cardType,
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        9.verticalSpace,
                        Text(
                          subcategory.name,
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.svgIconColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Details
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 16.w, right: 40.w, top: 16.h, bottom: 15.h),
                decoration: BoxDecoration(
                  color: PPaymobileColors.mainScreenBackground,
                  border: Border.all(color: PPaymobileColors.filterBorderColor, width: 1.w),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _InfoColumn(label: 'Amount', value: '\$${amount.toStringAsFixed(2)}'),
                        _InfoColumn(
                          label: 'You will Receive',
                          value: '₦${AmountFormatter.formatBalance(nairaEquivalent.toStringAsFixed(2))}',
                        ),
                      ],
                    ),
                    28.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _InfoColumn(label: 'Country', value: country),
                        _InfoColumn(
                          label: 'Rate',
                          value: '₦${AmountFormatter.formatBalance(sellRate.toStringAsFixed(2))}/\$',
                        ),
                      ],
                    ),
                    if (ecode != null && ecode!.isNotEmpty) ...[
                      28.verticalSpace,
                      _InfoColumn(label: 'Card Code', value: ecode!),
                    ],
                    if (cardImages.isNotEmpty) ...[
                      28.verticalSpace,
                      Text(
                        'Card Images',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: PPaymobileColors.svgIconColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      6.verticalSpace,
                      Row(
                        children: cardImages.take(3).map((img) => Padding(
                          padding: EdgeInsets.only(right: 8.w),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4).r,
                            child: Image.file(File(img.path), width: 56.w, height: 48.h, fit: BoxFit.cover),
                          ),
                        )).toList(),
                      ),
                    ],
                  ],
                ),
              ),
              13.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20.h,
                    width: 37.w,
                    child: CustomSwitch(
                      value: isNotifyEnabled.value,
                      onChanged: (val) => isNotifyEnabled.value = val,
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
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
                color: PPaymobileColors.warningColor,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 19.w,
                      width: 19.w,
                      child: SvgPicture.asset('assets/icon/warning.svg', fit: BoxFit.contain),
                    ),
                    8.horizontalSpace,
                    Expanded(
                      child: Text(
                        'Your payout will be automatically sent to your wallet once approved. You will receive ₦${AmountFormatter.formatBalance(nairaEquivalent.toStringAsFixed(2))} upon successful verification.',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
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
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 23.h),
                decoration: BoxDecoration(
                  border: Border.all(width: 1.w, color: PPaymobileColors.filterBorderColor),
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
                    ...[
                      'Ensure all card details provided are correct. Incorrect information may cause delays',
                      'Uploaded images must be clear and unaltered to avoid rejection',
                      'Do not share your card code with anyone outside the app',
                    ].map((tip) => Padding(
                      padding: EdgeInsets.only(bottom: 19.h),
                      child: Text(
                        tip,
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: PPaymobileColors.svgIconColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )),
                  ],
                ),
              ),
              78.verticalSpace,
              TouchOpacity(
                onTap: sellState.isLoading ? null : onProceed,
                child: Container(
                  height: 50.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(56).r,
                    color: PPaymobileColors.buttonColorandText,
                  ),
                  child: Center(
                    child: Text(
                      sellState.isLoading ? 'Processing...' : 'Proceed to Payment',
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
                children: [
                  SizedBox(
                    height: 20.w,
                    width: 20.w,
                    child: SvgPicture.asset('assets/icon/padlock_1.svg', fit: BoxFit.contain),
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
    );
  }
}

class _InfoColumn extends StatelessWidget {
  final String label;
  final String value;
  const _InfoColumn({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: PPaymobileColors.svgIconColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        3.verticalSpace,
        Text(
          value,
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
