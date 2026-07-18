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

    // Step-by-step: card → region → value
    final selectedCard = useState<BuyGiftcardRateEntity?>(null);
    final selectedRegion = useState<GiftcardRegionEntity?>(null);
    final selectedItem = useState<GiftcardItemEntity?>(null);
    final quantity = useState(1);

    useEffect(() {
      Future.microtask(() => ref.read(getBuyGiftcardRatesProvider.notifier).call());
      return null;
    }, []);

    final totalNaira = selectedItem.value != null
        ? selectedItem.value!.amountInNaira * quantity.value
        : 0.0;
    final walletBalance = double.tryParse(walletState.value?.balance ?? '0') ?? 0;
    final isInsufficient = totalNaira > 0 && totalNaira > walletBalance;

    void showCardPicker() {
      final rates = ratesState.value ?? [];
      if (rates.isEmpty) return;
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (_) => _CardPickerSheet(
          rates: rates,
          selected: selectedCard.value,
          onSelect: (card) {
            // Reset downstream selections when card changes
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
        MessageHandler.showErrorSnackBar(context, 'No regions available for this card');
        return;
      }
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (_) => _RegionPickerSheet(
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
        MessageHandler.showErrorSnackBar(context, 'No values available for this region');
        return;
      }
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (_) => _ValuePickerSheet(
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

      final item = selectedItem.value!;
      final region = selectedRegion.value!;
      final card = selectedCard.value!;

      await ref.read(buyGiftcardProvider.notifier).call(
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
        MessageHandler.showErrorSnackBar(context, MessageHandler.getErrorMessage(state.error));
      } else {
        ref.read(walletProvider.notifier).fetch();
        context.router.replace(GiftCardSuccessRoute(
          cardType: card.type,
          amountInNaira: totalNaira,
          amountInUSD: item.minAmount * quantity.value,
          region: region.name ?? '',
          rate: item.rate,
        ));
      }
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
                  child: SvgPicture.asset('assets/icon/arrow_back_white.svg', fit: BoxFit.scaleDown),
                ),
              ),
            ),
            expandedHeight: 239.h,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/buy_card_head.png'),
                    fit: BoxFit.cover,
                  ),
                  color: PPaymobileColors.backgroundColor,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      109.verticalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Wallet Balance',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: PPaymobileColors.mainScreenBackground,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          2.verticalSpace,
                          walletState.isLoading
                              ? SkeletonLoader(width: 160.w, height: 32.h)
                              : Text(
                                  '₦${AmountFormatter.formatBalance(walletState.value?.balance ?? '0')}',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: PPaymobileColors.mainScreenBackground,
                                    fontSize: 32.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        ],
                      ),
                    ],
                  ),
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
                  Text(
                    'Enter Details',
                    style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 20.sp, fontWeight: FontWeight.w500),
                  ),
                  5.verticalSpace,
                  Text(
                    'Please enter the details below to purchase a giftcard',
                    style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500),
                  ),
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
                                    Text(
                                      selectedCard.value!.type,
                                      style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                )
                              : Text('Select card type', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.textfiedBorder, fontSize: 16.sp)),
                        ),
                  32.verticalSpace,

                  // Step 2: Region (only shown after card is selected)
                  if (selectedCard.value != null) ...[
                    Text('Region', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500)),
                    4.verticalSpace,
                    _DropdownField(
                      onTap: showRegionPicker,
                      child: selectedRegion.value != null
                          ? Row(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: selectedRegion.value!.flagUrl,
                                  width: 23.w,
                                  height: 23.w,
                                  errorWidget: (_, __, ___) => SizedBox(width: 23.w, height: 23.w),
                                ),
                                12.horizontalSpace,
                                Text(
                                  selectedRegion.value!.name ?? '',
                                  style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500),
                                ),
                              ],
                            )
                          : Text('Select region', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.textfiedBorder, fontSize: 16.sp)),
                    ),
                    32.verticalSpace,
                  ],

                  // Step 3: Card Value + Quantity (only shown after region is selected)
                  if (selectedRegion.value != null) ...[
                    Text('Card Value', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500)),
                    4.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: _DropdownField(
                            onTap: showValuePicker,
                            child: selectedItem.value != null
                                ? Text(
                                    '\$${selectedItem.value!.minAmount.toStringAsFixed(0)} (₦${AmountFormatter.formatBalance(selectedItem.value!.amountInNaira.toStringAsFixed(2))})',
                                    style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500),
                                  )
                                : Text('Select value', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.textfiedBorder, fontSize: 16.sp)),
                          ),
                        ),
                        24.horizontalSpace,
                        Row(
                          children: [
                            TouchOpacity(
                              onTap: () { if (quantity.value > 1) quantity.value--; },
                              child: SizedBox(height: 38.w, width: 38.w, child: Image.asset('assets/images/remove_green.png', fit: BoxFit.contain)),
                            ),
                            16.horizontalSpace,
                            Text('${quantity.value}', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500)),
                            16.horizontalSpace,
                            TouchOpacity(
                              onTap: () => quantity.value++,
                              child: SizedBox(height: 38.w, width: 38.w, child: Image.asset('assets/images/add_green.png', fit: BoxFit.contain)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    if (selectedItem.value != null) ...[
                      8.verticalSpace,
                      RichText(
                        text: TextSpan(
                          text: 'You will pay: ₦${AmountFormatter.formatBalance(totalNaira.toStringAsFixed(2))} ',
                          style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500),
                          children: isInsufficient
                              ? [
                                  TextSpan(
                                    text: '(Insufficient Fund)',
                                    style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.redTextfield, fontSize: 14.sp, fontWeight: FontWeight.w500),
                                  ),
                                ]
                              : [],
                        ),
                      ),
                    ],
                    32.verticalSpace,
                  ],

                  78.verticalSpace,
                  PPButton(
                    text: buyState.isLoading ? 'Processing...' : 'Proceed to Pay',
                    onPressed: buyState.isLoading ? null : onProceed,
                  ),
                  20.verticalSpace,
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

class _CardPickerSheet extends StatelessWidget {
  final List<BuyGiftcardRateEntity> rates;
  final BuyGiftcardRateEntity? selected;
  final ValueChanged<BuyGiftcardRateEntity> onSelect;

  const _CardPickerSheet({required this.rates, required this.selected, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return _BottomSheet(
      title: 'Select Card Type',
      child: ListView.separated(
        itemCount: rates.length,
        separatorBuilder: (_, __) => Divider(height: 1.h, color: PPaymobileColors.deepBackgroundColor),
        itemBuilder: (context, index) {
          final rate = rates[index];
          return ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CachedNetworkImage(
              imageUrl: rate.logoUrl,
              width: 40.w,
              height: 40.w,
              errorWidget: (_, __, ___) => Container(width: 40.w, height: 40.w, color: PPaymobileColors.deepBackgroundColor),
            ),
            title: Text(rate.type, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
            subtitle: Text(rate.category, style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 12.sp)),
            trailing: selected?.type == rate.type ? Icon(Icons.check_circle, color: PPaymobileColors.buttonColor, size: 20.w) : null,
            onTap: () { onSelect(rate); Navigator.pop(context); },
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

  const _RegionPickerSheet({required this.regions, required this.selected, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return _BottomSheet(
      title: 'Select Region',
      child: ListView.separated(
        itemCount: regions.length,
        separatorBuilder: (_, __) => Divider(height: 1.h, color: PPaymobileColors.deepBackgroundColor),
        itemBuilder: (context, index) {
          final region = regions[index];
          return ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CachedNetworkImage(
              imageUrl: region.flagUrl,
              width: 32.w,
              height: 32.w,
              errorWidget: (_, __, ___) => SizedBox(width: 32.w, height: 32.w),
            ),
            title: Text(region.name ?? '', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
            subtitle: Text(region.currency ?? '', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 12.sp)),
            trailing: selected?.name == region.name ? Icon(Icons.check_circle, color: PPaymobileColors.buttonColor, size: 20.w) : null,
            onTap: () { onSelect(region); Navigator.pop(context); },
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

  const _ValuePickerSheet({required this.items, required this.selected, required this.currency, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return _BottomSheet(
      title: 'Select Card Value',
      child: Wrap(
        spacing: 12.w,
        runSpacing: 12.h,
        children: items.map((item) {
          final isSelected = selected?.kudaIdentifier == item.kudaIdentifier;
          return GestureDetector(
            onTap: () { onSelect(item); Navigator.pop(context); },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                border: Border.all(
                  color: isSelected ? PPaymobileColors.buttonColor : PPaymobileColors.filterBorderColor,
                  width: isSelected ? 2.w : 1.w,
                ),
                borderRadius: BorderRadius.circular(4).r,
                color: isSelected ? PPaymobileColors.doneColor : PPaymobileColors.mainScreenBackground,
              ),
              child: Column(
                children: [
                  Text(
                    '\$${item.minAmount.toStringAsFixed(0)}',
                    style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500),
                  ),
                  2.verticalSpace,
                  Text(
                    '₦${AmountFormatter.formatBalance(item.amountInNaira.toStringAsFixed(2))}',
                    style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 11.sp),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _BottomSheet extends StatelessWidget {
  final String title;
  final Widget child;

  const _BottomSheet({required this.title, required this.child});

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
              decoration: BoxDecoration(
                color: PPaymobileColors.mainScreenBackground,
                borderRadius: BorderRadius.vertical(top: Radius.circular(36).r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.black)),
                  16.verticalSpace,
                  Expanded(child: child),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
