import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/skeleton_loader.dart';

@RoutePage()
class SellGiftCardFeaturesPage extends HookConsumerWidget {
  const SellGiftCardFeaturesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ratesState = ref.watch(getSellGiftcardRatesProvider);

    final selectedCard = useState<SellGiftcardRateEntity?>(null);
    final selectedRegion = useState<GiftcardRegionEntity?>(null);
    final selectedSubcategory = useState<GiftcardSubcategoryEntity?>(null);
    final amountController = useTextEditingController();
    final ecodeController = useTextEditingController();
    final pickedImages = useState<List<XFile>>([]);

    useEffect(() {
      Future.microtask(() => ref.read(getSellGiftcardRatesProvider.notifier).call());
      return null;
    }, []);

    final rate = selectedSubcategory.value != null
        ? double.tryParse(selectedSubcategory.value!.sellRate) ?? 0
        : 0.0;
    final minAmount = selectedSubcategory.value != null
        ? double.tryParse(selectedSubcategory.value!.minAmount) ?? 0
        : 0.0;
    final amount = double.tryParse(amountController.text) ?? 0;
    final nairaEquivalent = amount * rate;
    final isBelowMin = amount > 0 && amount < minAmount;

    void showCardPicker() {
      final rates = ratesState.value ?? [];
      if (rates.isEmpty) return;
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (_) => _SellCardPickerSheet(
          rates: rates,
          selected: selectedCard.value,
          onSelect: (card) {
            selectedCard.value = card;
            selectedRegion.value = null;
            selectedSubcategory.value = null;
          },
        ),
      );
    }

    void showRegionPicker() {
      final card = selectedCard.value;
      if (card == null) {
        MessageHandler.showErrorSnackBar(context, 'Select a card type first');
        return;
      }
      if (card.regions.isEmpty) {
        MessageHandler.showErrorSnackBar(context, 'No regions available for this card');
        return;
      }
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (_) => _SellRegionPickerSheet(
          regions: card.regions,
          selected: selectedRegion.value,
          onSelect: (region) {
            selectedRegion.value = region;
            selectedSubcategory.value = null;
          },
        ),
      );
    }

    void showSubcategoryPicker() {
      if (selectedCard.value == null) {
        MessageHandler.showErrorSnackBar(context, 'Select a card type first');
        return;
      }
      final region = selectedRegion.value;
      if (region == null) {
        MessageHandler.showErrorSnackBar(context, 'Select a region first');
        return;
      }
      final subcategories = region.subcategories ?? [];
      if (subcategories.isEmpty) {
        MessageHandler.showErrorSnackBar(context, 'No subcategories available for this region');
        return;
      }
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (_) => _SubcategoryPickerSheet(
          subcategories: subcategories,
          selected: selectedSubcategory.value,
          onSelect: (sub) => selectedSubcategory.value = sub,
        ),
      );
    }

    Future<void> pickImages() async {
      final picker = ImagePicker();
      final images = await picker.pickMultiImage(imageQuality: 80);
      if (images.isNotEmpty) {
        pickedImages.value = [...pickedImages.value, ...images];
      }
    }

    void onProceed() {
      if (selectedCard.value == null) {
        MessageHandler.showErrorSnackBar(context, 'Select a card type');
        return;
      }
      if (selectedRegion.value == null) {
        MessageHandler.showErrorSnackBar(context, 'Select a region');
        return;
      }
      final hasSubcategories = (selectedRegion.value!.subcategories ?? []).isNotEmpty;
      if (hasSubcategories && selectedSubcategory.value == null) {
        MessageHandler.showErrorSnackBar(context, 'Select a card category');
        return;
      }
      if (amount <= 0) {
        MessageHandler.showErrorSnackBar(context, 'Enter an amount');
        return;
      }
      if (amount < minAmount) {
        MessageHandler.showErrorSnackBar(context, 'Minimum amount is \$$minAmount');
        return;
      }

      final card = selectedCard.value!;
      final sub = selectedSubcategory.value;
      final region = selectedRegion.value!;
      final country = region.countryCode ?? region.name ?? '';

      context.router.push(ConfirmGiftCardSellRoute(
        cardType: card.type,
        logoUrl: card.logoUrl,
        subcategory: sub,
        country: country,
        amount: amount,
        nairaEquivalent: nairaEquivalent,
        sellRate: rate,
        ecode: ecodeController.text.isNotEmpty ? ecodeController.text : null,
        cardImages: pickedImages.value,
      ));
    }

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: PPaymobileColors.backgroundColor,
            toolbarHeight: 56,
            leadingWidth: 56.w,
            centerTitle: true,
            title: Text(
              'Sell Gift Card',
              style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.mainScreenBackground, fontSize: 18.sp, fontWeight: FontWeight.w500),
            ),
            leading: Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: TouchOpacity(
                onTap: () => Navigator.pop(context),
                child: SizedBox(height: 24.w, width: 24.w, child: SvgPicture.asset('assets/icon/arrow_back_white.svg', fit: BoxFit.scaleDown)),
              ),
            ),
            expandedHeight: 239.h,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/buy_card_head.png'), fit: BoxFit.cover),
                  color: PPaymobileColors.backgroundColor,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  32.verticalSpace,
                  Text('Enter Details', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 20.sp, fontWeight: FontWeight.w500)),
                  5.verticalSpace,
                  Text('Please enter the details below to sell a giftcard', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
                  40.verticalSpace,

                  // Step 1: Card Type
                  Text('Card Type', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500)),
                  4.verticalSpace,
                  ratesState.isLoading
                      ? SkeletonLoader(width: double.infinity, height: 54.h)
                      : _DropdownField(
                          onTap: showCardPicker,
                          child: selectedCard.value != null
                              ? Row(
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: selectedCard.value!.logoUrl,
                                      width: 28.w,
                                      height: 28.w,
                                      errorWidget: (_, __, ___) => SizedBox(width: 28.w, height: 28.w),
                                    ),
                                    12.horizontalSpace,
                                    Text(selectedCard.value!.type, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500)),
                                  ],
                                )
                              : Text('Select card type', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.textfiedBorder, fontSize: 16.sp)),
                        ),
                  32.verticalSpace,

                  // Step 2: Region (only after card selected)
                  if (selectedCard.value != null) ...[
                    Text('Region', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500)),
                    4.verticalSpace,
                    _DropdownField(
                      onTap: showRegionPicker,
                      child: selectedRegion.value != null
                          ? Text(selectedRegion.value!.countryName ?? selectedRegion.value!.name ?? '', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500))
                          : Text('Select region', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.textfiedBorder, fontSize: 16.sp)),
                    ),
                    32.verticalSpace,
                  ],

                  // Step 3: Subcategory (only after region selected AND region has subcategories)
                  if (selectedRegion.value != null && (selectedRegion.value!.subcategories ?? []).isNotEmpty) ...[
                    Text('Card Category', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500)),
                    4.verticalSpace,
                    _DropdownField(
                      onTap: showSubcategoryPicker,
                      child: selectedSubcategory.value != null
                          ? Text(selectedSubcategory.value!.name, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500))
                          : Text('Select category', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.textfiedBorder, fontSize: 16.sp)),
                    ),
                    32.verticalSpace,
                  ],

                  // Amount
                  Text('Amount (\$)', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500)),
                  4.verticalSpace,
                  SizedBox(
                    height: 54.h,
                    child: TextFormField(
                      controller: amountController,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      onChanged: (_) {},
                      decoration: InputDecoration(
                        hintText: selectedSubcategory.value != null
                            ? '\$ Min: ${selectedSubcategory.value!.minAmount}'
                            : '\$ Enter Amount',
                        hintStyle: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.textfiedBorder, fontSize: 16.sp),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: isBelowMin ? PPaymobileColors.redTextfield : PPaymobileColors.textfieldGrey, width: 1.w),
                          borderRadius: BorderRadius.circular(6).r,
                        ),
                        border: OutlineInputBorder(borderSide: BorderSide(color: PPaymobileColors.textfieldGrey, width: 1.w), borderRadius: BorderRadius.circular(6).r),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
                      ),
                    ),
                  ),
                  if (selectedSubcategory.value != null) ...[
                    6.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rate: ₦${AmountFormatter.formatBalance(selectedSubcategory.value!.sellRate)}/\$',
                          style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 12.sp),
                        ),
                        Text(
                          'Min: \$${selectedSubcategory.value!.minAmount}',
                          style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 12.sp),
                        ),
                      ],
                    ),
                    if (isBelowMin) ...[
                      4.verticalSpace,
                      Text(
                        'Amount must be at least \$${selectedSubcategory.value!.minAmount}',
                        style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.redTextfield, fontSize: 12.sp),
                      ),
                    ],
                    if (amount > 0 && !isBelowMin) ...[
                      4.verticalSpace,
                      Row(
                        children: [
                          Text(
                            'You will receive: ',
                            style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 13.sp),
                          ),
                          Text(
                            '₦${AmountFormatter.formatBalance(nairaEquivalent.toStringAsFixed(2))}',
                            style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 13.sp, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ],
                  32.verticalSpace,

                  // E-code (optional)
                  Text('E-Code (Optional)', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500)),
                  4.verticalSpace,
                  SizedBox(
                    height: 54.h,
                    child: TextFormField(
                      controller: ecodeController,
                      decoration: InputDecoration(
                        hintText: 'Enter e-code if available',
                        hintStyle: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.textfiedBorder, fontSize: 16.sp),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: PPaymobileColors.textfieldGrey, width: 1.w), borderRadius: BorderRadius.circular(6).r),
                        border: OutlineInputBorder(borderSide: BorderSide(color: PPaymobileColors.textfieldGrey, width: 1.w), borderRadius: BorderRadius.circular(6).r),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
                      ),
                    ),
                  ),
                  32.verticalSpace,

                  // Upload Images (optional, multiple)
                  Text('Upload Images (Optional)', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500)),
                  4.verticalSpace,
                  TouchOpacity(
                    onTap: pickImages,
                    child: Container(
                      height: 109.h,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 19.h),
                      decoration: BoxDecoration(
                        color: PPaymobileColors.deepBackgroundColor,
                        borderRadius: BorderRadius.circular(4).r,
                      ),
                      child: Center(
                        child: SizedBox(
                          height: 71.h,
                          width: 283.w,
                          child: Image.asset('assets/images/add_image.png', fit: BoxFit.contain),
                        ),
                      ),
                    ),
                  ),
                  if (pickedImages.value.isNotEmpty) ...[
                    16.verticalSpace,
                    Row(
                      children: [
                        ...pickedImages.value.take(3).map((img) => Padding(
                          padding: EdgeInsets.only(right: 12.w),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4).r,
                                child: Image.file(File(img.path), width: 80.w, height: 68.h, fit: BoxFit.cover),
                              ),
                              Positioned(
                                top: 2,
                                right: 2,
                                child: GestureDetector(
                                  onTap: () {
                                    final list = [...pickedImages.value];
                                    list.remove(img);
                                    pickedImages.value = list;
                                  },
                                  child: Container(
                                    width: 18.w,
                                    height: 18.w,
                                    decoration: BoxDecoration(color: Colors.black54, shape: BoxShape.circle),
                                    child: Icon(Icons.close, color: Colors.white, size: 12.w),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                      ],
                    ),
                  ],
                  32.verticalSpace,

                  // Notes
                  Text('Note:', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500)),
                  12.verticalSpace,
                  ...[
                    'Check your gift card expiry date',
                    'Take a clear image of gift card',
                    'Only upload original card images. Do not crop out sections',
                    'Ensure you capture the card code',
                  ].map((note) => Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: Row(
                      children: [
                        SizedBox(height: 8.h, width: 8.h, child: SvgPicture.asset('assets/icon/indicator_2.svg', fit: BoxFit.contain)),
                        6.horizontalSpace,
                        Expanded(child: Text(note, style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 14.sp, fontWeight: FontWeight.w500))),
                      ],
                    ),
                  )),
                  32.verticalSpace,
                  PPButton(
                    text: 'Proceed',
                    onPressed: onProceed,
                  ),
                  16.verticalSpace,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DropdownField extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;

  const _DropdownField({required this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 54.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
        decoration: BoxDecoration(
          border: Border.all(color: PPaymobileColors.textfieldGrey, width: 1.w),
          borderRadius: BorderRadius.circular(6).r,
        ),
        child: Row(
          children: [
            Expanded(child: child),
            SvgPicture.asset('assets/icon/arrow_down.svg', width: 12.w, height: 12.w, fit: BoxFit.scaleDown),
          ],
        ),
      ),
    );
  }
}

class _SellCardPickerSheet extends StatelessWidget {
  final List<SellGiftcardRateEntity> rates;
  final SellGiftcardRateEntity? selected;
  final ValueChanged<SellGiftcardRateEntity> onSelect;

  const _SellCardPickerSheet({required this.rates, required this.selected, required this.onSelect});

  bool _isAvailable(SellGiftcardRateEntity rate) {
    return rate.regions.any((r) => (r.subcategories ?? []).isNotEmpty);
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.65,
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 60.w,
              width: 60.w,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30).r, color: PPaymobileColors.mainScreenBackground),
              child: Center(child: SvgPicture.asset('assets/icon/cancel.svg', fit: BoxFit.scaleDown)),
            ),
          ),
          8.verticalSpace,
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              decoration: BoxDecoration(color: PPaymobileColors.mainScreenBackground, borderRadius: BorderRadius.vertical(top: Radius.circular(36).r)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Select Card Type', style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.black)),
                  16.verticalSpace,
                  Expanded(
                    child: ListView.separated(
                      itemCount: rates.length,
                      separatorBuilder: (_, __) => Divider(height: 1.h, color: PPaymobileColors.deepBackgroundColor),
                      itemBuilder: (context, index) {
                        final rate = rates[index];
                        final available = _isAvailable(rate);
                        return GestureDetector(
                          onTap: () {
                            if (!available) {
                              MessageHandler.showErrorSnackBar(context, 'This gift card is currently not available for sale');
                              return;
                            }
                            onSelect(rate);
                            Navigator.pop(context);
                          },
                          child: Opacity(
                            opacity: available ? 1.0 : 0.4,
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: CachedNetworkImage(
                                imageUrl: rate.logoUrl,
                                width: 40.w,
                                height: 40.w,
                                errorWidget: (_, __, ___) => Container(width: 40.w, height: 40.w, color: PPaymobileColors.deepBackgroundColor),
                              ),
                              title: Text(rate.type, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
                              trailing: available
                                  ? (selected?.id == rate.id ? Icon(Icons.check_circle, color: PPaymobileColors.buttonColor, size: 20.w) : null)
                                  : Icon(Icons.block, color: Colors.grey, size: 18.w),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SellRegionPickerSheet extends StatelessWidget {
  final List<GiftcardRegionEntity> regions;
  final GiftcardRegionEntity? selected;
  final ValueChanged<GiftcardRegionEntity> onSelect;

  const _SellRegionPickerSheet({required this.regions, required this.selected, required this.onSelect});

  bool _isAvailable(GiftcardRegionEntity region) {
    return (region.subcategories ?? []).isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.65,
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 60.w,
              width: 60.w,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30).r, color: PPaymobileColors.mainScreenBackground),
              child: Center(child: SvgPicture.asset('assets/icon/cancel.svg', fit: BoxFit.scaleDown)),
            ),
          ),
          8.verticalSpace,
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              decoration: BoxDecoration(color: PPaymobileColors.mainScreenBackground, borderRadius: BorderRadius.vertical(top: Radius.circular(36).r)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Select Region', style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.black)),
                  16.verticalSpace,
                  Expanded(
                    child: ListView.separated(
                      itemCount: regions.length,
                      separatorBuilder: (_, __) => Divider(height: 1.h, color: PPaymobileColors.deepBackgroundColor),
                      itemBuilder: (context, index) {
                        final region = regions[index];
                        final available = _isAvailable(region);
                        return GestureDetector(
                          onTap: () {
                            if (!available) {
                              MessageHandler.showErrorSnackBar(context, 'This region is currently not available for sale');
                              return;
                            }
                            onSelect(region);
                            Navigator.pop(context);
                          },
                          child: Opacity(
                            opacity: available ? 1.0 : 0.4,
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(region.countryName ?? region.name ?? '', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
                              trailing: available
                                  ? (selected?.id == region.id ? Icon(Icons.check_circle, color: PPaymobileColors.buttonColor, size: 20.w) : null)
                                  : Icon(Icons.block, color: Colors.grey, size: 18.w),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SubcategoryPickerSheet extends StatelessWidget {
  final List<GiftcardSubcategoryEntity> subcategories;
  final GiftcardSubcategoryEntity? selected;
  final ValueChanged<GiftcardSubcategoryEntity> onSelect;

  const _SubcategoryPickerSheet({required this.subcategories, required this.selected, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.65,
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 60.w,
              width: 60.w,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30).r, color: PPaymobileColors.mainScreenBackground),
              child: Center(child: SvgPicture.asset('assets/icon/cancel.svg', fit: BoxFit.scaleDown)),
            ),
          ),
          8.verticalSpace,
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              decoration: BoxDecoration(color: PPaymobileColors.mainScreenBackground, borderRadius: BorderRadius.vertical(top: Radius.circular(36).r)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Select Category', style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.black)),
                  16.verticalSpace,
                  Expanded(
                    child: ListView.separated(
                      itemCount: subcategories.length,
                      separatorBuilder: (_, __) => Divider(height: 1.h, color: PPaymobileColors.deepBackgroundColor),
                      itemBuilder: (context, index) {
                        final sub = subcategories[index];
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(sub.name, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
                          subtitle: Text('Rate: ₦${sub.sellRate}/\$ • \$${sub.minAmount}–\$${sub.maxAmount}', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 12.sp)),
                          trailing: selected?.id == sub.id ? Icon(Icons.check_circle, color: PPaymobileColors.buttonColor, size: 20.w) : null,
                          onTap: () { onSelect(sub); Navigator.pop(context); },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
