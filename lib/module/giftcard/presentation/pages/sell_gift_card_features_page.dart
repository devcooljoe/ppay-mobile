import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/giftcard/domain/entities/giftcard_entity.dart';
import 'package:ppay_mobile/module/giftcard/presentation/providers/giftcard_providers.dart';
import 'package:ppay_mobile/shared/utils/amount_formatter.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/skeleton_loader.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

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
    final amountText = useState('');

    useEffect(() {
      Future.microtask(
        () => ref.read(getSellGiftcardRatesProvider.notifier).call(),
      );
      void listener() => amountText.value = amountController.text;
      amountController.addListener(listener);
      return () => amountController.removeListener(listener);
    }, []);

    final rate = selectedSubcategory.value != null
        ? double.tryParse(selectedSubcategory.value!.sellRate) ?? 0
        : 0.0;
    final minAmount = selectedSubcategory.value != null
        ? double.tryParse(selectedSubcategory.value!.minAmount) ?? 0
        : 0.0;
    final maxAmount = selectedSubcategory.value != null
        ? double.tryParse(selectedSubcategory.value!.maxAmount) ?? 0
        : 0.0;
    final amount = double.tryParse(amountText.value) ?? 0;
    final nairaEquivalent = amount * rate;
    final isBelowMin = amount > 0 && amount < minAmount;
    final isAboveMax = maxAmount > 0 && amount > maxAmount;
    final hasAmountError = isBelowMin || isAboveMax;

    // ── Pickers ───────────────────────────────────────────────────────────────

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
        MessageHandler.showErrorSnackBar(
          context,
          'No regions available for this card',
        );
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
      final region = selectedRegion.value;
      if (region == null) {
        MessageHandler.showErrorSnackBar(context, 'Select a region first');
        return;
      }
      final subcategories = region.subcategories ?? [];
      if (subcategories.isEmpty) {
        MessageHandler.showErrorSnackBar(
          context,
          'No categories available for this region',
        );
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
      final hasSubcategories =
          (selectedRegion.value!.subcategories ?? []).isNotEmpty;
      if (hasSubcategories && selectedSubcategory.value == null) {
        MessageHandler.showErrorSnackBar(context, 'Select a card category');
        return;
      }
      if (amount <= 0) {
        MessageHandler.showErrorSnackBar(context, 'Enter an amount');
        return;
      }
      if (isBelowMin) {
        MessageHandler.showErrorSnackBar(
          context,
          'Minimum amount is \$$minAmount',
        );
        return;
      }
      if (isAboveMax && maxAmount > 0) {
        MessageHandler.showErrorSnackBar(
          context,
          'Maximum amount is \$$maxAmount',
        );
        return;
      }

      final card = selectedCard.value!;
      final region = selectedRegion.value!;
      final country = region.countryCode ?? region.name ?? '';

      context.router.push(
        ConfirmGiftCardSellRoute(
          cardType: card.type,
          logoUrl: card.logoUrl,
          subcategory: selectedSubcategory.value,
          country: country,
          amount: amount,
          nairaEquivalent: nairaEquivalent,
          sellRate: rate,
          ecode: ecodeController.text.isNotEmpty ? ecodeController.text : null,
          cardImages: pickedImages.value,
        ),
      );
    }

    // ── Build ─────────────────────────────────────────────────────────────────

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      body: CustomScrollView(
        slivers: [
          // ── Collapsing header ───────────────────────────────────────────────
          SliverAppBar(
            backgroundColor: PPaymobileColors.backgroundColor,
            toolbarHeight: 56,
            leadingWidth: 56.w,
            centerTitle: true,
            title: Text(
              'Sell Gift Card',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: PPaymobileColors.mainScreenBackground,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            leading: Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: TouchOpacity(
                onTap: () => Navigator.pop(context),
                child: SizedBox(
                  height: 24.w,
                  width: 24.w,
                  child: SvgPicture.asset(
                    'assets/icon/arrow_back_white.svg',
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
            expandedHeight: 200.h,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/buy_card_head.png'),
                    fit: BoxFit.cover,
                  ),
                  color: PPaymobileColors.backgroundColor,
                ),
                // Gradient overlay so text is always readable
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        PPaymobileColors.backgroundColor.withValues(alpha: 0.7),
                      ],
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 20.w,
                        right: 20.w,
                        bottom: 20.h,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sell your gift cards',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: Colors.white.withValues(alpha: 0.75),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          4.verticalSpace,
                          Text(
                            'Get paid instantly to your wallet',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // ── Body ────────────────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  32.verticalSpace,

                  Text(
                    'Enter Details',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  6.verticalSpace,
                  Text(
                    'Select a card, region and enter the amount to continue',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.svgIconColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  32.verticalSpace,

                  // ── Step 1: Card Type ──────────────────────────────────────
                  _StepLabel(number: '1', label: 'Card Type'),
                  8.verticalSpace,
                  ratesState.isLoading
                      ? SkeletonLoader(width: double.infinity, height: 56.h)
                      : _DropdownField(
                          onTap: showCardPicker,
                          child: selectedCard.value != null
                              ? Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(4).r,
                                      child: CachedNetworkImage(
                                        imageUrl: selectedCard.value!.logoUrl,
                                        width: 32.w,
                                        height: 32.w,
                                        fit: BoxFit.cover,
                                        errorWidget: (_, __, ___) => Container(
                                          width: 32.w,
                                          height: 32.w,
                                          color: PPaymobileColors
                                              .deepBackgroundColor,
                                        ),
                                      ),
                                    ),
                                    12.horizontalSpace,
                                    Expanded(
                                      child: Text(
                                        selectedCard.value!.type,
                                        style: TextStyle(
                                          fontFamily: 'InstrumentSans',
                                          color: Colors.black,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Text(
                                  'Select card type',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: PPaymobileColors.textfieldGrey,
                                    fontSize: 15.sp,
                                  ),
                                ),
                        ),
                  28.verticalSpace,

                  // ── Step 2: Region ─────────────────────────────────────────
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: selectedCard.value != null
                        ? Column(
                            key: const ValueKey('region'),
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _StepLabel(number: '2', label: 'Region'),
                              8.verticalSpace,
                              _DropdownField(
                                onTap: showRegionPicker,
                                child: selectedRegion.value != null
                                    ? Row(
                                        children: [
                                          ClipOval(
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  selectedRegion.value!.flagUrl,
                                              width: 26.w,
                                              height: 26.w,
                                              fit: BoxFit.cover,
                                              errorWidget: (_, __, ___) =>
                                                  SizedBox(
                                                    width: 26.w,
                                                    height: 26.w,
                                                  ),
                                            ),
                                          ),
                                          12.horizontalSpace,
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  selectedRegion
                                                          .value!
                                                          .countryName ??
                                                      selectedRegion
                                                          .value!
                                                          .name ??
                                                      '',
                                                  style: TextStyle(
                                                    fontFamily:
                                                        'InstrumentSans',
                                                    color: Colors.black,
                                                    fontSize: 15.sp,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                if (selectedRegion
                                                        .value!
                                                        .currency !=
                                                    null)
                                                  Text(
                                                    selectedRegion
                                                            .value!
                                                            .currency ??
                                                        '',
                                                    style: TextStyle(
                                                      fontFamily:
                                                          'InstrumentSans',
                                                      color: PPaymobileColors
                                                          .svgIconColor,
                                                      fontSize: 11.sp,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    : Text(
                                        'Select region',
                                        style: TextStyle(
                                          fontFamily: 'InstrumentSans',
                                          color: PPaymobileColors.textfieldGrey,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                              ),
                              28.verticalSpace,
                            ],
                          )
                        : const SizedBox.shrink(key: ValueKey('no-region')),
                  ),

                  // ── Step 3: Category ───────────────────────────────────────
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child:
                        selectedRegion.value != null &&
                            (selectedRegion.value!.subcategories ?? [])
                                .isNotEmpty
                        ? Column(
                            key: const ValueKey('category'),
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _StepLabel(number: '3', label: 'Card Category'),
                              8.verticalSpace,
                              _DropdownField(
                                onTap: showSubcategoryPicker,
                                child: selectedSubcategory.value != null
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            selectedSubcategory.value!.name,
                                            style: TextStyle(
                                              fontFamily: 'InstrumentSans',
                                              color: Colors.black,
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            '₦${selectedSubcategory.value!.sellRate}/\$ · \$${selectedSubcategory.value!.minAmount}–\$${selectedSubcategory.value!.maxAmount}',
                                            style: TextStyle(
                                              fontFamily: 'InstrumentSans',
                                              color:
                                                  PPaymobileColors.svgIconColor,
                                              fontSize: 11.sp,
                                            ),
                                          ),
                                        ],
                                      )
                                    : Text(
                                        'Select category',
                                        style: TextStyle(
                                          fontFamily: 'InstrumentSans',
                                          color: PPaymobileColors.textfieldGrey,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                              ),
                              28.verticalSpace,
                            ],
                          )
                        : const SizedBox.shrink(key: ValueKey('no-category')),
                  ),

                  // ── Amount ─────────────────────────────────────────────────
                  _StepLabel(
                    number:
                        selectedRegion.value != null &&
                            (selectedRegion.value!.subcategories ?? [])
                                .isNotEmpty
                        ? '4'
                        : '3',
                    label: 'Amount (USD)',
                  ),
                  8.verticalSpace,
                  _AmountField(
                    controller: amountController,
                    hasError: hasAmountError,
                    hint: selectedSubcategory.value != null
                        ? 'Min: \$${selectedSubcategory.value!.minAmount} · Max: \$${selectedSubcategory.value!.maxAmount}'
                        : 'Enter amount in USD',
                  ),
                  if (selectedSubcategory.value != null) ...[
                    8.verticalSpace,
                    _AmountHints(
                      rate: rate,
                      minAmount: minAmount,
                      maxAmount: maxAmount,
                      amount: amount,
                      nairaEquivalent: nairaEquivalent,
                      isBelowMin: isBelowMin,
                      isAboveMax: isAboveMax,
                    ),
                  ],
                  28.verticalSpace,

                  // ── Payout summary (shown once amount is valid) ────────────
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child:
                        amount > 0 &&
                            !hasAmountError &&
                            selectedSubcategory.value != null
                        ? _PayoutSummaryCard(
                            key: const ValueKey('payout'),
                            card: selectedCard.value!,
                            region: selectedRegion.value!,
                            subcategory: selectedSubcategory.value!,
                            amount: amount,
                            nairaEquivalent: nairaEquivalent,
                            rate: rate,
                          )
                        : const SizedBox.shrink(key: ValueKey('no-payout')),
                  ),

                  if (amount > 0 &&
                      !hasAmountError &&
                      selectedSubcategory.value != null)
                    28.verticalSpace,

                  // ── E-code ─────────────────────────────────────────────────
                  _SectionHeader(
                    icon: Icons.qr_code_rounded,
                    label: 'E-Code',
                    badge: 'Optional',
                  ),
                  8.verticalSpace,
                  _StyledTextField(
                    controller: ecodeController,
                    hint: 'Enter e-code if available',
                    keyboardType: TextInputType.text,
                  ),
                  28.verticalSpace,

                  // ── Upload images ──────────────────────────────────────────
                  _SectionHeader(
                    icon: Icons.image_outlined,
                    label: 'Card Images',
                    badge: 'Optional',
                  ),
                  8.verticalSpace,
                  _ImageUploadArea(
                    images: pickedImages.value,
                    onTap: pickImages,
                    onRemove: (img) {
                      final list = [...pickedImages.value];
                      list.remove(img);
                      pickedImages.value = list;
                    },
                  ),
                  28.verticalSpace,

                  // ── Notes ──────────────────────────────────────────────────
                  _NotesCard(),
                  32.verticalSpace,

                  PPButton(text: 'Proceed', onPressed: onProceed),
                  32.verticalSpace,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Shared form widgets ────────────────────────────────────────────────────────

class _StepLabel extends StatelessWidget {
  final String number;
  final String label;
  const _StepLabel({required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 22.w,
          height: 22.w,
          decoration: const BoxDecoration(
            color: PPaymobileColors.backgroundColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              number,
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: Colors.white,
                fontSize: 11.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        8.horizontalSpace,
        Text(
          label,
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: Colors.black,
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _DropdownField extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;
  const _DropdownField({required this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return TouchOpacity(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(minHeight: 56.h),
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
        decoration: BoxDecoration(
          border: Border.all(color: PPaymobileColors.textfiedBorder),
          borderRadius: BorderRadius.circular(10).r,
          color: PPaymobileColors.mainScreenBackground,
        ),
        child: Row(
          children: [
            Expanded(child: child),
            8.horizontalSpace,
            SvgPicture.asset(
              'assets/icon/arrow_down.svg',
              width: 14.w,
              height: 14.w,
              fit: BoxFit.scaleDown,
            ),
          ],
        ),
      ),
    );
  }
}

class _AmountField extends StatelessWidget {
  final TextEditingController controller;
  final bool hasError;
  final String hint;
  const _AmountField({
    required this.controller,
    required this.hasError,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      style: TextStyle(
        fontFamily: 'InstrumentSans',
        color: Colors.black,
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          fontFamily: 'InstrumentSans',
          color: PPaymobileColors.textfieldGrey,
          fontSize: 14.sp,
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Text(
            '\$',
            style: TextStyle(
              fontFamily: 'InstrumentSans',
              color: hasError
                  ? PPaymobileColors.redTextfield
                  : PPaymobileColors.svgIconColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 56.h),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: hasError
                ? PPaymobileColors.redTextfield
                : PPaymobileColors.textfiedBorder,
          ),
          borderRadius: BorderRadius.circular(10).r,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: hasError
                ? PPaymobileColors.redTextfield
                : PPaymobileColors.backgroundColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(10).r,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
      ),
    );
  }
}

class _AmountHints extends StatelessWidget {
  final double rate;
  final double minAmount;
  final double maxAmount;
  final double amount;
  final double nairaEquivalent;
  final bool isBelowMin;
  final bool isAboveMax;

  const _AmountHints({
    required this.rate,
    required this.minAmount,
    required this.maxAmount,
    required this.amount,
    required this.nairaEquivalent,
    required this.isBelowMin,
    required this.isAboveMax,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Rate: ₦${AmountFormatter.formatBalance(rate.toStringAsFixed(2))}/\$',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: PPaymobileColors.svgIconColor,
                fontSize: 12.sp,
              ),
            ),
            Text(
              'Range: \$${minAmount.toStringAsFixed(0)}–\$${maxAmount.toStringAsFixed(0)}',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: PPaymobileColors.svgIconColor,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
        if (isBelowMin) ...[
          4.verticalSpace,
          Row(
            children: [
              Icon(
                Icons.info_outline,
                size: 13.w,
                color: PPaymobileColors.redTextfield,
              ),
              4.horizontalSpace,
              Text(
                'Minimum amount is \$${minAmount.toStringAsFixed(0)}',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.redTextfield,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ] else if (isAboveMax) ...[
          4.verticalSpace,
          Row(
            children: [
              Icon(
                Icons.info_outline,
                size: 13.w,
                color: PPaymobileColors.redTextfield,
              ),
              4.horizontalSpace,
              Text(
                'Maximum amount is \$${maxAmount.toStringAsFixed(0)}',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.redTextfield,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ] else if (amount > 0) ...[
          4.verticalSpace,
          Row(
            children: [
              Icon(
                Icons.check_circle_outline,
                size: 13.w,
                color: PPaymobileColors.buttonColor,
              ),
              4.horizontalSpace,
              Text(
                'You will receive: ',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.svgIconColor,
                  fontSize: 12.sp,
                ),
              ),
              Text(
                '₦${AmountFormatter.formatBalance(nairaEquivalent.toStringAsFixed(2))}',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.backgroundColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}

class _StyledTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final TextInputType keyboardType;
  const _StyledTextField({
    required this.controller,
    required this.hint,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      style: TextStyle(
        fontFamily: 'InstrumentSans',
        color: Colors.black,
        fontSize: 15.sp,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          fontFamily: 'InstrumentSans',
          color: PPaymobileColors.textfieldGrey,
          fontSize: 14.sp,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: PPaymobileColors.textfiedBorder),
          borderRadius: BorderRadius.circular(10).r,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: PPaymobileColors.backgroundColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(10).r,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? badge;
  const _SectionHeader({required this.icon, required this.label, this.badge});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18.w, color: PPaymobileColors.backgroundColor),
        8.horizontalSpace,
        Text(
          label,
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: Colors.black,
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (badge != null) ...[
          8.horizontalSpace,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
            decoration: BoxDecoration(
              color: PPaymobileColors.deepBackgroundColor,
              borderRadius: BorderRadius.circular(20).r,
            ),
            child: Text(
              badge!,
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: PPaymobileColors.svgIconColor,
                fontSize: 10.sp,
              ),
            ),
          ),
        ],
      ],
    );
  }
}

// ── Content cards ──────────────────────────────────────────────────────────────

class _PayoutSummaryCard extends StatelessWidget {
  final SellGiftcardRateEntity card;
  final GiftcardRegionEntity region;
  final GiftcardSubcategoryEntity subcategory;
  final double amount;
  final double nairaEquivalent;
  final double rate;

  const _PayoutSummaryCard({
    super.key,
    required this.card,
    required this.region,
    required this.subcategory,
    required this.amount,
    required this.nairaEquivalent,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: PPaymobileColors.deepBackgroundColor,
        borderRadius: BorderRadius.circular(12).r,
        border: Border.all(color: PPaymobileColors.textfiedBorder),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            decoration: BoxDecoration(
              color: PPaymobileColors.backgroundColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(12).r),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6).r,
                  child: CachedNetworkImage(
                    imageUrl: card.logoUrl,
                    width: 36.w,
                    height: 36.w,
                    fit: BoxFit.cover,
                    errorWidget: (_, __, ___) => Container(
                      width: 36.w,
                      height: 36.w,
                      color: Colors.white24,
                    ),
                  ),
                ),
                12.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${card.type} Gift Card',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '${region.countryName ?? region.name ?? ''} · ${subcategory.name}',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.white70,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(20).r,
                  ),
                  child: Text(
                    'SELL',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.white,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Details
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                _SummaryRow(
                  label: 'Card Amount',
                  value: '\$${amount.toStringAsFixed(2)}',
                ),
                12.verticalSpace,
                _SummaryRow(
                  label: 'Sell Rate',
                  value:
                      '₦${AmountFormatter.formatBalance(rate.toStringAsFixed(2))}/\$',
                ),
                16.verticalSpace,
                Divider(height: 1, color: PPaymobileColors.textfiedBorder),
                16.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'You Receive',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '₦${AmountFormatter.formatBalance(nairaEquivalent.toStringAsFixed(2))}',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: PPaymobileColors.backgroundColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                12.verticalSpace,
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    color: PPaymobileColors.doneColor,
                    borderRadius: BorderRadius.circular(8).r,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        size: 14.w,
                        color: PPaymobileColors.doneTextColor,
                      ),
                      8.horizontalSpace,
                      Expanded(
                        child: Text(
                          'Payout is sent to your wallet after verification',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.doneTextColor,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  const _SummaryRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: PPaymobileColors.svgIconColor,
            fontSize: 13.sp,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: Colors.black,
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _ImageUploadArea extends StatelessWidget {
  final List<XFile> images;
  final VoidCallback onTap;
  final ValueChanged<XFile> onRemove;

  const _ImageUploadArea({
    required this.images,
    required this.onTap,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Upload tap area
        TouchOpacity(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 24.h),
            decoration: BoxDecoration(
              color: PPaymobileColors.deepBackgroundColor,
              borderRadius: BorderRadius.circular(10).r,
              border: Border.all(
                color: PPaymobileColors.textfiedBorder,
                style: BorderStyle.solid,
              ),
            ),
            child: Column(
              children: [
                Container(
                  width: 48.w,
                  height: 48.w,
                  decoration: BoxDecoration(
                    color: PPaymobileColors.mainScreenBackground,
                    shape: BoxShape.circle,
                    border: Border.all(color: PPaymobileColors.textfiedBorder),
                  ),
                  child: Icon(
                    Icons.add_photo_alternate_outlined,
                    size: 22.w,
                    color: PPaymobileColors.backgroundColor,
                  ),
                ),
                12.verticalSpace,
                Text(
                  'Tap to upload card images',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                4.verticalSpace,
                Text(
                  'JPG, PNG supported · Multiple allowed',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.svgIconColor,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Picked images preview
        if (images.isNotEmpty) ...[
          16.verticalSpace,
          Wrap(
            spacing: 10.w,
            runSpacing: 10.h,
            children: images
                .map(
                  (img) => Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8).r,
                        child: Image.file(
                          File(img.path),
                          width: 80.w,
                          height: 72.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 4,
                        right: 4,
                        child: TouchOpacity(
                          onTap: () => onRemove(img),
                          child: Container(
                            width: 20.w,
                            height: 20.w,
                            decoration: const BoxDecoration(
                              color: Colors.black54,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 12.w,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
          8.verticalSpace,
          Text(
            '${images.length} image${images.length == 1 ? '' : 's'} selected',
            style: TextStyle(
              fontFamily: 'InstrumentSans',
              color: PPaymobileColors.svgIconColor,
              fontSize: 12.sp,
            ),
          ),
        ],
      ],
    );
  }
}

class _NotesCard extends StatelessWidget {
  const _NotesCard();

  @override
  Widget build(BuildContext context) {
    const notes = [
      'Check your gift card expiry date before submitting',
      'Take a clear, unedited image of the gift card',
      'Ensure the card code is fully visible in the image',
      'Do not crop or alter the card image in any way',
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: PPaymobileColors.warningColor,
        borderRadius: BorderRadius.circular(10).r,
        border: Border.all(color: const Color(0xFFFFE0B2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.lightbulb_outline,
                size: 16.w,
                color: PPaymobileColors.warningTextColor,
              ),
              8.horizontalSpace,
              Text(
                'Tips for faster approval',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.warningTextColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          12.verticalSpace,
          ...notes.map(
            (note) => Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: Container(
                      width: 5.w,
                      height: 5.w,
                      decoration: BoxDecoration(
                        color: PPaymobileColors.warningTextColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  8.horizontalSpace,
                  Expanded(
                    child: Text(
                      note,
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black87,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
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

// ── Bottom sheet pickers ───────────────────────────────────────────────────────

class _SellCardPickerSheet extends StatelessWidget {
  final List<SellGiftcardRateEntity> rates;
  final SellGiftcardRateEntity? selected;
  final ValueChanged<SellGiftcardRateEntity> onSelect;

  const _SellCardPickerSheet({
    required this.rates,
    required this.selected,
    required this.onSelect,
  });

  bool _isAvailable(SellGiftcardRateEntity rate) =>
      rate.regions.any((r) => (r.subcategories ?? []).isNotEmpty);

  @override
  Widget build(BuildContext context) {
    return _SellBottomSheet(
      title: 'Select Card Type',
      subtitle: '${rates.length} cards available',
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: rates.length,
        separatorBuilder: (_, __) =>
            Divider(height: 1, color: PPaymobileColors.deepBackgroundColor),
        itemBuilder: (context, index) {
          final rate = rates[index];
          final available = _isAvailable(rate);
          final isSelected = selected?.id == rate.id;

          return TouchOpacity(
            onTap: () {
              if (!available) {
                MessageHandler.showErrorSnackBar(
                  context,
                  'This card is not available for sale',
                );
                return;
              }
              onSelect(rate);
              Navigator.pop(context);
            },
            child: Opacity(
              opacity: available ? 1.0 : 0.45,
              child: Container(
                color: isSelected
                    ? PPaymobileColors.doneColor
                    : Colors.transparent,
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 10.h),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6).r,
                      child: CachedNetworkImage(
                        imageUrl: rate.logoUrl,
                        width: 44.w,
                        height: 44.w,
                        fit: BoxFit.cover,
                        errorWidget: (_, __, ___) => Container(
                          width: 44.w,
                          height: 44.w,
                          color: PPaymobileColors.deepBackgroundColor,
                          child: Icon(
                            Icons.card_giftcard,
                            size: 20.w,
                            color: PPaymobileColors.svgIconColor,
                          ),
                        ),
                      ),
                    ),
                    14.horizontalSpace,
                    Expanded(
                      child: Text(
                        rate.type,
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    if (!available)
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 3.h,
                        ),
                        decoration: BoxDecoration(
                          color: PPaymobileColors.deepBackgroundColor,
                          borderRadius: BorderRadius.circular(4).r,
                        ),
                        child: Text(
                          'Unavailable',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.svgIconColor,
                            fontSize: 10.sp,
                          ),
                        ),
                      )
                    else if (isSelected)
                      Icon(
                        Icons.check_circle_rounded,
                        color: PPaymobileColors.buttonColor,
                        size: 22.w,
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SellRegionPickerSheet extends StatelessWidget {
  final List<GiftcardRegionEntity> regions;
  final GiftcardRegionEntity? selected;
  final ValueChanged<GiftcardRegionEntity> onSelect;

  const _SellRegionPickerSheet({
    required this.regions,
    required this.selected,
    required this.onSelect,
  });

  bool _isAvailable(GiftcardRegionEntity region) =>
      (region.subcategories ?? []).isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return _SellBottomSheet(
      title: 'Select Region',
      subtitle: '${regions.length} regions available',
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: regions.length,
        separatorBuilder: (_, __) =>
            Divider(height: 1, color: PPaymobileColors.deepBackgroundColor),
        itemBuilder: (context, index) {
          final region = regions[index];
          final available = _isAvailable(region);
          final isSelected = selected?.id == region.id;
          final displayName = region.countryName ?? region.name ?? '';

          return TouchOpacity(
            onTap: () {
              if (!available) {
                MessageHandler.showErrorSnackBar(
                  context,
                  'This region is not available for sale',
                );
                return;
              }
              onSelect(region);
              Navigator.pop(context);
            },
            child: Opacity(
              opacity: available ? 1.0 : 0.45,
              child: Container(
                color: isSelected
                    ? PPaymobileColors.doneColor
                    : Colors.transparent,
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 12.h),
                child: Row(
                  children: [
                    // Flag image from flagUrl
                    ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: region.flagUrl,
                        width: 40.w,
                        height: 40.w,
                        fit: BoxFit.cover,
                        errorWidget: (_, __, ___) => Container(
                          width: 40.w,
                          height: 40.w,
                          decoration: BoxDecoration(
                            color: PPaymobileColors.deepBackgroundColor,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              displayName.isNotEmpty
                                  ? displayName[0].toUpperCase()
                                  : '?',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: PPaymobileColors.svgIconColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    14.horizontalSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            displayName,
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          if (region.currency != null)
                            Text(
                              region.currency!,
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: PPaymobileColors.svgIconColor,
                                fontSize: 12.sp,
                              ),
                            ),
                        ],
                      ),
                    ),
                    if (!available)
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 3.h,
                        ),
                        decoration: BoxDecoration(
                          color: PPaymobileColors.deepBackgroundColor,
                          borderRadius: BorderRadius.circular(4).r,
                        ),
                        child: Text(
                          'Unavailable',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.svgIconColor,
                            fontSize: 10.sp,
                          ),
                        ),
                      )
                    else if (isSelected)
                      Icon(
                        Icons.check_circle_rounded,
                        color: PPaymobileColors.buttonColor,
                        size: 22.w,
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SubcategoryPickerSheet extends StatelessWidget {
  final List<GiftcardSubcategoryEntity> subcategories;
  final GiftcardSubcategoryEntity? selected;
  final ValueChanged<GiftcardSubcategoryEntity> onSelect;

  const _SubcategoryPickerSheet({
    required this.subcategories,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return _SellBottomSheet(
      title: 'Select Category',
      subtitle: 'Choose the card denomination type',
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: subcategories.length,
        separatorBuilder: (_, __) =>
            Divider(height: 1, color: PPaymobileColors.deepBackgroundColor),
        itemBuilder: (context, index) {
          final sub = subcategories[index];
          final isSelected = selected?.id == sub.id;

          return TouchOpacity(
            onTap: () {
              onSelect(sub);
              Navigator.pop(context);
            },
            child: Container(
              color: isSelected
                  ? PPaymobileColors.doneColor
                  : Colors.transparent,
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 14.h),
              child: Row(
                children: [
                  Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? PPaymobileColors.backgroundColor
                          : PPaymobileColors.deepBackgroundColor,
                      borderRadius: BorderRadius.circular(8).r,
                    ),
                    child: Icon(
                      Icons.sell_outlined,
                      size: 18.w,
                      color: isSelected
                          ? Colors.white
                          : PPaymobileColors.svgIconColor,
                    ),
                  ),
                  14.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          sub.name,
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        4.verticalSpace,
                        Text(
                          'Rate: ₦${sub.sellRate}/\$ · Range: \$${sub.minAmount}–\$${sub.maxAmount}',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.svgIconColor,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (isSelected)
                    Icon(
                      Icons.check_circle_rounded,
                      color: PPaymobileColors.buttonColor,
                      size: 22.w,
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ── Base bottom sheet ──────────────────────────────────────────────────────────

class _SellBottomSheet extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget child;

  const _SellBottomSheet({
    required this.title,
    this.subtitle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;
    return FractionallySizedBox(
      heightFactor: 0.72,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          TouchOpacity(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 52.w,
              width: 52.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: PPaymobileColors.mainScreenBackground,
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/icon/cancel.svg',
                  fit: BoxFit.scaleDown,
                  width: 18.w,
                  height: 18.w,
                ),
              ),
            ),
          ),
          8.verticalSpace,
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: PPaymobileColors.mainScreenBackground,
                borderRadius: BorderRadius.vertical(top: Radius.circular(28).r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 12.h, bottom: 20.h),
                      child: Container(
                        width: 40.w,
                        height: 4.h,
                        decoration: BoxDecoration(
                          color: PPaymobileColors.textfiedBorder,
                          borderRadius: BorderRadius.circular(2).r,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        if (subtitle != null) ...[
                          4.verticalSpace,
                          Text(
                            subtitle!,
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              fontSize: 13.sp,
                              color: PPaymobileColors.svgIconColor,
                            ),
                          ),
                        ],
                        16.verticalSpace,
                        Divider(
                          height: 1,
                          color: PPaymobileColors.deepBackgroundColor,
                        ),
                        12.verticalSpace,
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                        20.w,
                        0,
                        20.w,
                        bottomPadding + 16.h,
                      ),
                      child: child,
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
