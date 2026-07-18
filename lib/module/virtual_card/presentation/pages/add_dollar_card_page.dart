import 'package:flutter/material.dart';
import 'package:flutter/services.dart' hide MessageHandler;
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/auth/presentation/providers/auth_providers.dart';
import 'package:ppay_mobile/module/virtual_card/domain/entities/dollar_card_entity.dart';
import 'package:ppay_mobile/module/virtual_card/presentation/providers/virtual_card_providers.dart';
import 'package:ppay_mobile/module/virtual_card/presentation/widgets/ppay_card_widget.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

const double _minFundingUsd = 2.0;

@RoutePage()
class AddDollarCardPage extends HookConsumerWidget {
  const AddDollarCardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authenticatedUserProvider).value;
    final selectedBrand = useState<String>('MASTERCARD');
    final selectedColor = useState<String>('teal');
    final amountController = useTextEditingController(text: '2');
    final addState = ref.watch(addDollarCardProvider);

    final conversionRate = user?.conversionRate ?? 0.0;

    useValueListenable(amountController);
    final parsedAmount = double.tryParse(amountController.text) ?? 0.0;
    final nairaAmount = parsedAmount * conversionRate;

    ref.listen(addDollarCardProvider, (_, next) {
      if (next is AsyncData && next.value == null) {
        ref.read(getDollarCardsProvider.notifier).call();
        context.router.replace(VirtualCardSuccessRoute());
      } else if (next is AsyncError) {
        MessageHandler.showErrorSnackBar(
          context,
          MessageHandler.getErrorMessage(next.error),
        );
      }
    });

    void onSubmit() {
      final amount = double.tryParse(amountController.text.trim()) ?? 0;
      if (amount < _minFundingUsd) {
        MessageHandler.showErrorSnackBar(
          context,
          'Minimum funding amount is \$${_minFundingUsd.toStringAsFixed(0)}',
        );
        return;
      }
      ref.read(addDollarCardProvider.notifier).call(
        brand: selectedBrand.value,
        amount: amount,
      );
    }

    final previewCard = DollarCardEntity(
      id: 'preview',
      dbId: 'preview',
      brand: selectedBrand.value,
      name: user?.fullName ?? 'Your Name',
      cardNumber: '4111111111111111',
      maskedPan: '411111******1111',
      expiry: '12/28',
      cvv: '***',
      status: 'ACTIVE',
      type: 'VIRTUAL',
      issuer: selectedBrand.value,
      currency: 'USD',
      balance: 0.0,
      address: const DollarCardAddressEntity(
        street: '', city: '', state: '', postalCode: '', country: '',
      ),
      createdAt: '',
      updatedAt: '',
      rate: conversionRate,
      color: selectedColor.value,
    );

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(
        title: 'Create Card',
        onBackPressed: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              32.verticalSpace,
              PPAYCardWidget(card: previewCard),
              32.verticalSpace,

              // Brand selection
              Text(
                'Card Network',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              8.verticalSpace,
              Text(
                'Choose your preferred card network',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.svgIconColor,
                  fontSize: 13.sp,
                ),
              ),
              16.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: _BrandCard(
                      brand: 'MASTERCARD',
                      selected: selectedBrand.value == 'MASTERCARD',
                      onTap: () => selectedBrand.value = 'MASTERCARD',
                    ),
                  ),
                  16.horizontalSpace,
                  Expanded(
                    child: _BrandCard(
                      brand: 'VISA',
                      selected: selectedBrand.value == 'VISA',
                      onTap: () => selectedBrand.value = 'VISA',
                    ),
                  ),
                ],
              ),
              32.verticalSpace,

              // Color selection
              Text(
                'Card Color',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              8.verticalSpace,
              Text(
                'Personalise your card with a color theme',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.svgIconColor,
                  fontSize: 13.sp,
                ),
              ),
              16.verticalSpace,
              CardColorPicker(
                selected: selectedColor.value,
                onChanged: (c) => selectedColor.value = c,
              ),
              32.verticalSpace,

              // Funding amount
              Text(
                'Initial Funding Amount',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              8.verticalSpace,
              Text(
                'Minimum funding amount is \$${_minFundingUsd.toStringAsFixed(0)} USD',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.svgIconColor,
                  fontSize: 13.sp,
                ),
              ),
              12.verticalSpace,
              Container(
                decoration: BoxDecoration(
                  color: PPaymobileColors.deepBackgroundColor,
                  borderRadius: BorderRadius.circular(8).r,
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
                      decoration: BoxDecoration(
                        color: PPaymobileColors.backgroundColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.r),
                          bottomLeft: Radius.circular(8.r),
                        ),
                      ),
                      child: Text(
                        '\$',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: amountController,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                        ],
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          fontSize: 16.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 14.w),
                          hintText: '2.00',
                          hintStyle: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.svgIconColor,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 14.w),
                      child: Text(
                        'USD',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: PPaymobileColors.svgIconColor,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              12.verticalSpace,

              // Rate info
              if (conversionRate > 0)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
                  decoration: BoxDecoration(
                    color: PPaymobileColors.deepBackgroundColor,
                    borderRadius: BorderRadius.circular(8).r,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Exchange Rate',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: PPaymobileColors.svgIconColor,
                              fontSize: 13.sp,
                            ),
                          ),
                          Text(
                            '\$1 = ₦${conversionRate.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: Colors.black,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      8.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'You will be charged',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: PPaymobileColors.svgIconColor,
                              fontSize: 13.sp,
                            ),
                          ),
                          Text(
                            '₦${nairaAmount.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: PPaymobileColors.backgroundColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              24.verticalSpace,

              // Warning banner
              Container(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                decoration: BoxDecoration(
                  color: PPaymobileColors.warningColor,
                  borderRadius: BorderRadius.circular(8).r,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.info_outline_rounded,
                      size: 18.w,
                      color: PPaymobileColors.warningTextColor,
                    ),
                    8.horizontalSpace,
                    Expanded(
                      child: Text(
                        'The funding amount will be deducted from your Naira wallet at the current exchange rate.',
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
                text: addState is AsyncLoading
                    ? 'Creating...'
                    : 'Create ${selectedBrand.value == 'MASTERCARD' ? 'Mastercard' : 'Visa'} Card',
                onPressed: addState is AsyncLoading ? null : onSubmit,
                backgroundColor: PPaymobileColors.backgroundColor,
              ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}

class _BrandCard extends StatelessWidget {
  final String brand;
  final bool selected;
  final VoidCallback onTap;

  const _BrandCard({
    required this.brand,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isMastercard = brand == 'MASTERCARD';
    return TouchOpacity(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 90.h,
        decoration: BoxDecoration(
          color: selected
              ? PPaymobileColors.backgroundColor
              : PPaymobileColors.deepBackgroundColor,
          borderRadius: BorderRadius.circular(12).r,
          border: Border.all(
            color: selected
                ? PPaymobileColors.highlightTextColor
                : PPaymobileColors.textfiedBorder,
            width: selected ? 2 : 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isMastercard)
              SizedBox(
                width: 44.w,
                height: 28.h,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      child: Container(
                        width: 28.w,
                        height: 28.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: selected
                              ? Colors.red.withValues(alpha: 0.9)
                              : Colors.red.withValues(alpha: 0.5),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                        width: 28.w,
                        height: 28.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: selected
                              ? Colors.orange.withValues(alpha: 0.9)
                              : Colors.orange.withValues(alpha: 0.5),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            else
              Text(
                'VISA',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: selected ? Colors.white : PPaymobileColors.svgIconColor,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.italic,
                ),
              ),
            8.verticalSpace,
            Text(
              isMastercard ? 'Mastercard' : 'Visa',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: selected ? Colors.white : Colors.black,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
