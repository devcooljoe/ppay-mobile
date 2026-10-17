import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/auth/presentation/providers/auth_providers.dart';
import 'package:ppay_mobile/module/dashboard/providers/wallet_provider.dart';
import 'package:ppay_mobile/module/giftcard/domain/entities/giftcard_entity.dart';
import 'package:ppay_mobile/module/giftcard/presentation/providers/giftcard_providers.dart';
import 'package:ppay_mobile/shared/utils/amount_formatter.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/kyc_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/security_pin_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/skeleton_loader.dart';

@RoutePage()
class BuyGiftCardFeaturesPage extends HookConsumerWidget {
  const BuyGiftCardFeaturesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ratesState = ref.watch(getBuyGiftcardRatesProvider);
    final buyState = ref.watch(buyGiftcardProvider);
    final walletState = ref.watch(walletProvider);
    final user = ref.watch(authenticatedUserProvider).value;

    final selectedCard = useState<BuyGiftcardRateEntity?>(null);
    final selectedRegion = useState<GiftcardRegionEntity?>(null);
    final selectedItem = useState<GiftcardItemEntity?>(null);
    final quantity = useState(1);

    useEffect(() {
      Future.microtask(
        () => ref.read(getBuyGiftcardRatesProvider.notifier).call(),
      );
      return null;
    }, []);

    final totalNaira =
        selectedItem.value != null
            ? selectedItem.value!.amountInNaira * quantity.value
            : 0.0;
    final walletBalance =
        double.tryParse(walletState.value?.balance ?? '0') ?? 0;
    final isInsufficient = totalNaira > 0 && totalNaira > walletBalance;

    // ── Step helpers ──────────────────────────────────────────────────────────

    void showCardPicker() {
      final rates = ratesState.value ?? [];
      if (rates.isEmpty) return;
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder:
            (_) => _CardPickerSheet(
              rates: rates,
              selected: selectedCard.value,
              onSelect: (card) {
                selectedCard.value = card;
                selectedRegion.value = null;
                selectedItem.value = null;
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
        builder:
            (_) => _RegionPickerSheet(
              regions: card.regions,
              selected: selectedRegion.value,
              onSelect: (region) {
                selectedRegion.value = region;
                selectedItem.value = null;
              },
            ),
      );
    }

    void showValuePicker() {
      if (selectedCard.value == null) {
        MessageHandler.showErrorSnackBar(context, 'Select a card type first');
        return;
      }
      final region = selectedRegion.value;
      if (region == null) {
        MessageHandler.showErrorSnackBar(context, 'Select a region first');
        return;
      }
      final items = region.items;
      if (items == null || items.isEmpty) {
        MessageHandler.showErrorSnackBar(
          context,
          'No values available for this region',
        );
        return;
      }
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder:
            (_) => _ValuePickerSheet(
              items: items,
              selected: selectedItem.value,
              currency: region.currency ?? '',
              onSelect: (item) => selectedItem.value = item,
            ),
      );
    }

    Future<void> onProceed() async {
      if (selectedCard.value == null) {
        MessageHandler.showErrorSnackBar(context, 'Select a card type');
        return;
      }
      if (selectedRegion.value == null) {
        MessageHandler.showErrorSnackBar(context, 'Select a region');
        return;
      }
      if (selectedItem.value == null) {
        MessageHandler.showErrorSnackBar(context, 'Select a card value');
        return;
      }
      if (isInsufficient) {
        MessageHandler.showErrorSnackBar(context, 'Insufficient balance');
        return;
      }

      final confirmed = await showSecurityPinBottomsheet(context);
      if (!confirmed) return;

      // Check BVN+KYC verification
      final isVerified =
          (user?.isBvnVerified ?? false) && (user?.isKycVerified ?? false);
      if (!isVerified) {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (_) => KycBottomsheet(user: user),
        );
        return;
      }

      final item = selectedItem.value!;
      final region = selectedRegion.value!;
      final card = selectedCard.value!;

      await ref
          .read(buyGiftcardProvider.notifier)
          .call(
            identifier: item.kudaIdentifier,
            fullName: user?.fullName ?? '',
            email: user?.emailAddress ?? '',
            phoneNumber: user?.phoneNumber ?? '',
            amountInUSD: item.minAmount * quantity.value,
            amountInNaira: totalNaira,
            title: card.type,
            region: region.name ?? '',
            rate: item.rate,
          );

      if (!context.mounted) return;
      final state = ref.read(buyGiftcardProvider);
      if (state.hasError) {
        MessageHandler.showErrorSnackBar(
          context,
          MessageHandler.getErrorMessage(state.error),
        );
      } else {
        ref.read(walletProvider.notifier).fetch();
        context.router.replace(
          GiftCardSuccessRoute(
            cardType: card.type,
            amountInNaira: totalNaira,
            amountInUSD: item.minAmount * quantity.value,
            region: region.name ?? '',
            rate: item.rate,
          ),
        );
      }
    }

    // ── Build ─────────────────────────────────────────────────────────────────

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      body: CustomScrollView(
        slivers: [
          // ── App bar with hero header ────────────────────────────────────────
          SliverAppBar(
            backgroundColor: PPaymobileColors.backgroundColor,
            toolbarHeight: 56,
            leadingWidth: 56.w,
            centerTitle: true,
            title: Text(
              'Buy Gift Card',
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
                          'Wallet Balance',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.white.withValues(alpha: 0.75),
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        4.verticalSpace,
                        walletState.isLoading
                            ? SkeletonLoader(width: 160.w, height: 32.h)
                            : Text(
                              '₦${AmountFormatter.formatBalance(walletState.value?.balance ?? '0')}',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.white,
                                fontSize: 28.sp,
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

          // ── Body ────────────────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  32.verticalSpace,

                  // ── Section header ─────────────────────────────────────────
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
                    'Select a gift card, region and value to continue',
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
                        child:
                            selectedCard.value != null
                                ? Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(4).r,
                                      child: CachedNetworkImage(
                                        imageUrl: selectedCard.value!.logoUrl,
                                        width: 32.w,
                                        height: 32.w,
                                        fit: BoxFit.cover,
                                        errorWidget:
                                            (_, __, ___) => Container(
                                              width: 32.w,
                                              height: 32.w,
                                              color:
                                                  PPaymobileColors
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
                    child:
                        selectedCard.value != null
                            ? Column(
                              key: const ValueKey('region'),
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _StepLabel(number: '2', label: 'Region'),
                                8.verticalSpace,
                                _DropdownField(
                                  onTap: showRegionPicker,
                                  child:
                                      selectedRegion.value != null
                                          ? Row(
                                            children: [
                                              ClipOval(
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      selectedRegion
                                                          .value!
                                                          .flagUrl,
                                                  width: 26.w,
                                                  height: 26.w,
                                                  fit: BoxFit.cover,
                                                  errorWidget:
                                                      (_, __, ___) => SizedBox(
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
                                                              .name ??
                                                          '',
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'InstrumentSans',
                                                        color: Colors.black,
                                                        fontSize: 15.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                                          color:
                                                              PPaymobileColors
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
                                              color:
                                                  PPaymobileColors
                                                      .textfieldGrey,
                                              fontSize: 15.sp,
                                            ),
                                          ),
                                ),
                                28.verticalSpace,
                              ],
                            )
                            : const SizedBox.shrink(key: ValueKey('no-region')),
                  ),

                  // ── Step 3: Card Value + Quantity ──────────────────────────
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child:
                        selectedRegion.value != null
                            ? Column(
                              key: const ValueKey('value'),
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _StepLabel(number: '3', label: 'Card Value'),
                                8.verticalSpace,
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: _DropdownField(
                                        onTap: showValuePicker,
                                        child:
                                            selectedItem.value != null
                                                ? Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      '\$${selectedItem.value!.minAmount.toStringAsFixed(0)}',
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'InstrumentSans',
                                                        color: Colors.black,
                                                        fontSize: 15.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    Text(
                                                      '₦${AmountFormatter.formatBalance(selectedItem.value!.amountInNaira.toStringAsFixed(2))}',
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'InstrumentSans',
                                                        color:
                                                            PPaymobileColors
                                                                .svgIconColor,
                                                        fontSize: 11.sp,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                                : Text(
                                                  'Select value',
                                                  style: TextStyle(
                                                    fontFamily:
                                                        'InstrumentSans',
                                                    color:
                                                        PPaymobileColors
                                                            .textfieldGrey,
                                                    fontSize: 15.sp,
                                                  ),
                                                ),
                                      ),
                                    ),
                                    20.horizontalSpace,
                                    _QuantitySelector(
                                      quantity: quantity.value,
                                      onDecrement: () {
                                        if (quantity.value > 1) {
                                          quantity.value--;
                                        }
                                      },
                                      onIncrement: () => quantity.value++,
                                    ),
                                  ],
                                ),
                                28.verticalSpace,
                              ],
                            )
                            : const SizedBox.shrink(key: ValueKey('no-value')),
                  ),

                  // ── Order Summary ──────────────────────────────────────────
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child:
                        selectedItem.value != null
                            ? _OrderSummaryCard(
                              key: const ValueKey('summary'),
                              card: selectedCard.value!,
                              region: selectedRegion.value!,
                              item: selectedItem.value!,
                              quantity: quantity.value,
                              totalNaira: totalNaira,
                              isInsufficient: isInsufficient,
                            )
                            : const SizedBox.shrink(
                              key: ValueKey('no-summary'),
                            ),
                  ),

                  if (selectedItem.value != null) 28.verticalSpace,

                  // ── Proceed button ─────────────────────────────────────────
                  PPButton(
                    text: 'Proceed to Pay',
                    isLoading: buyState.isLoading,
                    onPressed: buyState.isLoading ? null : onProceed,
                  ),
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

// ── Shared helper widgets ──────────────────────────────────────────────────────

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
          decoration: BoxDecoration(
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
          border: Border.all(color: PPaymobileColors.textfiedBorder, width: 1),
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

class _QuantitySelector extends StatelessWidget {
  final int quantity;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  const _QuantitySelector({
    required this.quantity,
    required this.onDecrement,
    required this.onIncrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: PPaymobileColors.textfiedBorder),
        borderRadius: BorderRadius.circular(10).r,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TouchOpacity(
            onTap: onDecrement,
            child: Container(
              width: 38.w,
              height: 56.h,
              alignment: Alignment.center,
              child: Icon(
                Icons.remove,
                size: 18.w,
                color:
                    quantity > 1
                        ? PPaymobileColors.backgroundColor
                        : PPaymobileColors.textfieldGrey,
              ),
            ),
          ),
          Container(
            width: 1,
            height: 56.h,
            color: PPaymobileColors.textfiedBorder,
          ),
          SizedBox(
            width: 38.w,
            height: 56.h,
            child: Center(
              child: Text(
                '$quantity',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Container(
            width: 1,
            height: 56.h,
            color: PPaymobileColors.textfiedBorder,
          ),
          TouchOpacity(
            onTap: onIncrement,
            child: Container(
              width: 38.w,
              height: 56.h,
              alignment: Alignment.center,
              child: Icon(
                Icons.add,
                size: 18.w,
                color: PPaymobileColors.backgroundColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OrderSummaryCard extends StatelessWidget {
  final BuyGiftcardRateEntity card;
  final GiftcardRegionEntity region;
  final GiftcardItemEntity item;
  final int quantity;
  final double totalNaira;
  final bool isInsufficient;

  const _OrderSummaryCard({
    super.key,
    required this.card,
    required this.region,
    required this.item,
    required this.quantity,
    required this.totalNaira,
    required this.isInsufficient,
  });

  @override
  Widget build(BuildContext context) {
    final totalUsd = item.minAmount * quantity;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: PPaymobileColors.deepBackgroundColor,
        borderRadius: BorderRadius.circular(12).r,
        border: Border.all(
          color:
              isInsufficient
                  ? PPaymobileColors.redTextfield.withValues(alpha: 0.3)
                  : PPaymobileColors.textfiedBorder,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    errorWidget:
                        (_, __, ___) => Container(
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
                        region.name ?? '',
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
                    'x$quantity',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.white,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
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
                  label: 'Card Value',
                  value:
                      '\$${item.minAmount.toStringAsFixed(0)} × $quantity = \$${totalUsd.toStringAsFixed(0)}',
                ),
                12.verticalSpace,
                _SummaryRow(
                  label: 'Rate',
                  value:
                      '₦${AmountFormatter.formatBalance(item.rate.toStringAsFixed(2))}/\$',
                ),
                12.verticalSpace,
                _SummaryRow(
                  label: 'Naira Equivalent',
                  value:
                      '₦${AmountFormatter.formatBalance((item.amountInNaira * quantity).toStringAsFixed(2))}',
                ),
                16.verticalSpace,
                Divider(height: 1, color: PPaymobileColors.textfiedBorder),
                16.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '₦${AmountFormatter.formatBalance(totalNaira.toStringAsFixed(2))}',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color:
                            isInsufficient
                                ? PPaymobileColors.redTextfield
                                : PPaymobileColors.backgroundColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                if (isInsufficient) ...[
                  8.verticalSpace,
                  Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        size: 14.w,
                        color: PPaymobileColors.redTextfield,
                      ),
                      6.horizontalSpace,
                      Text(
                        'Insufficient wallet balance',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: PPaymobileColors.redTextfield,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
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
            fontWeight: FontWeight.w400,
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

// ── Bottom sheet pickers ───────────────────────────────────────────────────────

class _CardPickerSheet extends StatelessWidget {
  final List<BuyGiftcardRateEntity> rates;
  final BuyGiftcardRateEntity? selected;
  final ValueChanged<BuyGiftcardRateEntity> onSelect;

  const _CardPickerSheet({
    required this.rates,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return _BottomSheet(
      title: 'Select Card Type',
      subtitle: '${rates.length} cards available',
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: rates.length,
        separatorBuilder:
            (_, __) =>
                Divider(height: 1, color: PPaymobileColors.deepBackgroundColor),
        itemBuilder: (context, index) {
          final rate = rates[index];
          final isSelected = selected?.type == rate.type;
          return TouchOpacity(
            onTap: () {
              onSelect(rate);
              Navigator.pop(context);
            },
            child: Container(
              color:
                  isSelected ? PPaymobileColors.doneColor : Colors.transparent,
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
                      errorWidget:
                          (_, __, ___) => Container(
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          rate.type,
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if (rate.category.isNotEmpty)
                          Text(
                            rate.category,
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

class _RegionPickerSheet extends StatelessWidget {
  final List<GiftcardRegionEntity> regions;
  final GiftcardRegionEntity? selected;
  final ValueChanged<GiftcardRegionEntity> onSelect;

  const _RegionPickerSheet({
    required this.regions,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return _BottomSheet(
      title: 'Select Region',
      subtitle: '${regions.length} regions available',
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: regions.length,
        separatorBuilder:
            (_, __) =>
                Divider(height: 1, color: PPaymobileColors.deepBackgroundColor),
        itemBuilder: (context, index) {
          final region = regions[index];
          final isSelected = selected?.name == region.name;
          return TouchOpacity(
            onTap: () {
              onSelect(region);
              Navigator.pop(context);
            },
            child: Container(
              color:
                  isSelected ? PPaymobileColors.doneColor : Colors.transparent,
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 12.h),
              child: Row(
                children: [
                  ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: region.flagUrl,
                      width: 38.w,
                      height: 38.w,
                      fit: BoxFit.cover,
                      errorWidget:
                          (_, __, ___) => Container(
                            width: 38.w,
                            height: 38.w,
                            color: PPaymobileColors.deepBackgroundColor,
                          ),
                    ),
                  ),
                  14.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          region.name ?? '',
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

class _ValuePickerSheet extends StatelessWidget {
  final List<GiftcardItemEntity> items;
  final GiftcardItemEntity? selected;
  final String currency;
  final ValueChanged<GiftcardItemEntity> onSelect;

  const _ValuePickerSheet({
    required this.items,
    required this.selected,
    required this.currency,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return _BottomSheet(
      title: 'Select Card Value',
      subtitle: 'Tap a denomination to select',
      child: GridView.builder(
        padding: EdgeInsets.only(bottom: 8.h),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h,
          childAspectRatio: 1.1,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          final isSelected = selected?.kudaIdentifier == item.kudaIdentifier;
          return TouchOpacity(
            onTap: () {
              onSelect(item);
              Navigator.pop(context);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              decoration: BoxDecoration(
                color:
                    isSelected
                        ? PPaymobileColors.backgroundColor
                        : PPaymobileColors.deepBackgroundColor,
                borderRadius: BorderRadius.circular(10).r,
                border: Border.all(
                  color:
                      isSelected
                          ? PPaymobileColors.backgroundColor
                          : PPaymobileColors.textfiedBorder,
                  width: isSelected ? 2 : 1,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '\$${item.minAmount.toStringAsFixed(0)}',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: isSelected ? Colors.white : Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  4.verticalSpace,
                  Text(
                    '₦${AmountFormatter.formatBalance(item.amountInNaira.toStringAsFixed(0))}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color:
                          isSelected
                              ? Colors.white70
                              : PPaymobileColors.svgIconColor,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  if (isSelected) ...[
                    4.verticalSpace,
                    Icon(
                      Icons.check_circle,
                      size: 14.w,
                      color: PPaymobileColors.highlightTextColor,
                    ),
                  ],
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

class _BottomSheet extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget child;

  const _BottomSheet({required this.title, this.subtitle, required this.child});

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;
    return FractionallySizedBox(
      heightFactor: 0.72,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          // Close button
          TouchOpacity(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 52.w,
              width: 52.w,
              decoration: BoxDecoration(
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
                  // Handle bar
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
                  // Title block
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
                              fontWeight: FontWeight.w400,
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
                  // Scrollable content
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
