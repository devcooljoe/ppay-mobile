import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/virtual_card/domain/entities/dollar_card_entity.dart';
import 'package:ppay_mobile/module/virtual_card/presentation/providers/virtual_card_providers.dart';
import 'package:ppay_mobile/module/virtual_card/presentation/widgets/ppay_card_widget.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class AddDollarCardPage extends HookConsumerWidget {
  const AddDollarCardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedBrand = useState<String>('MASTERCARD');
    final selectedColor = useState<String>('teal');
    final addState = ref.watch(addDollarCardProvider);

    ref.listen(addDollarCardProvider, (_, next) {
      if (next is AsyncData && next.value == null) {
        ref.read(getDollarCardsProvider.notifier).call();
        context.router.replace(VirtualCardSuccessRoute());
      } else if (next is AsyncError) {
        MessageHandler.showErrorSnackBar(context, MessageHandler.getErrorMessage(next.error));
      }
    });

    // Preview card
    final previewCard = DollarCardEntity(
      id: 'preview',
      dbId: 'preview',
      brand: selectedBrand.value,
      name: 'Your Name',
      cardNumber: '4111111111111111',
      maskedPan: '411111******1111',
      expiry: '12/28',
      cvv: '***',
      status: 'ACTIVE',
      type: 'VIRTUAL',
      issuer: selectedBrand.value,
      currency: 'USD',
      balance: 0.0,
      address: const DollarCardAddressEntity(street: '', city: '', state: '', postalCode: '', country: ''),
      createdAt: '',
      updatedAt: '',
      rate: 0,
      color: selectedColor.value,
    );

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(title: 'Add New Card', onBackPressed: () => Navigator.pop(context)),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              32.verticalSpace,
              // Live card preview
              PPAYCardWidget(card: previewCard),
              32.verticalSpace,

              // Brand selection
              Text('Card Network', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w600)),
              8.verticalSpace,
              Text('Choose your preferred card network', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 13.sp)),
              16.verticalSpace,
              Row(
                children: [
                  Expanded(child: _BrandCard(brand: 'MASTERCARD', selected: selectedBrand.value == 'MASTERCARD', onTap: () => selectedBrand.value = 'MASTERCARD')),
                  16.horizontalSpace,
                  Expanded(child: _BrandCard(brand: 'VISA', selected: selectedBrand.value == 'VISA', onTap: () => selectedBrand.value = 'VISA')),
                ],
              ),
              32.verticalSpace,

              // Color selection
              Text('Card Color', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w600)),
              8.verticalSpace,
              Text('Personalise your card with a color theme', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 13.sp)),
              16.verticalSpace,
              CardColorPicker(selected: selectedColor.value, onChanged: (c) => selectedColor.value = c),
              32.verticalSpace,

              // Info banner
              Container(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                decoration: BoxDecoration(color: PPaymobileColors.warningColor, borderRadius: BorderRadius.circular(8).r),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.info_outline_rounded, size: 18.w, color: PPaymobileColors.warningTextColor),
                    8.horizontalSpace,
                    Expanded(
                      child: Text(
                        'A one-time card creation fee will be charged from your wallet. No additional verification is required.',
                        style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.warningTextColor, fontSize: 12.sp, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              24.verticalSpace,
              PPButton(
                text: addState is AsyncLoading ? 'Creating...' : 'Create ${selectedBrand.value == 'MASTERCARD' ? 'Mastercard' : 'Visa'} Card',
                onPressed: addState is AsyncLoading
                    ? null
                    : () => ref.read(addDollarCardProvider.notifier).call(brand: selectedBrand.value),
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

  const _BrandCard({required this.brand, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final isMastercard = brand == 'MASTERCARD';
    return TouchOpacity(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 90.h,
        decoration: BoxDecoration(
          color: selected ? PPaymobileColors.backgroundColor : PPaymobileColors.deepBackgroundColor,
          borderRadius: BorderRadius.circular(12).r,
          border: Border.all(color: selected ? PPaymobileColors.highlightTextColor : PPaymobileColors.textfiedBorder, width: selected ? 2 : 1),
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
                    Positioned(left: 0, child: Container(width: 28.w, height: 28.w, decoration: BoxDecoration(shape: BoxShape.circle, color: selected ? Colors.red.withValues(alpha: 0.9) : Colors.red.withValues(alpha: 0.5)))),
                    Positioned(right: 0, child: Container(width: 28.w, height: 28.w, decoration: BoxDecoration(shape: BoxShape.circle, color: selected ? Colors.orange.withValues(alpha: 0.9) : Colors.orange.withValues(alpha: 0.5)))),
                  ],
                ),
              )
            else
              Text('VISA', style: TextStyle(fontFamily: 'InstrumentSans', color: selected ? Colors.white : PPaymobileColors.svgIconColor, fontSize: 22.sp, fontWeight: FontWeight.w800, fontStyle: FontStyle.italic)),
            8.verticalSpace,
            Text(isMastercard ? 'Mastercard' : 'Visa', style: TextStyle(fontFamily: 'InstrumentSans', color: selected ? Colors.white : Colors.black, fontSize: 13.sp, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
