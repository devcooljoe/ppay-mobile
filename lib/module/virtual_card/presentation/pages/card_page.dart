import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:flutter/material.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/module/virtual_card/domain/entities/dollar_card_entity.dart';
import 'package:ppay_mobile/module/virtual_card/presentation/providers/virtual_card_providers.dart';
import 'package:ppay_mobile/module/virtual_card/presentation/widgets/ppay_card_widget.dart';
import 'package:ppay_mobile/shared/widgets/card_details_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/custom_switch.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

Future<bool?> _showFreezeDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (context) => Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 28.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Freeze Card', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 24.sp, fontWeight: FontWeight.w500)),
                TouchOpacity(onTap: () => Navigator.pop(context, false), child: SizedBox(height: 20.56.h, width: 20.56.w, child: SvgPicture.asset('assets/icon/cancel1.svg', fit: BoxFit.contain))),
              ],
            ),
            20.verticalSpace,
            Text('Are you sure you want to freeze card. All transactions will be put on hold.', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500)),
            40.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TouchOpacity(
                  onTap: () => Navigator.pop(context, true),
                  child: Container(height: 50.h, width: 152.w, decoration: BoxDecoration(color: PPaymobileColors.buttonColorandText, borderRadius: BorderRadius.circular(6).r), child: Center(child: Text('Yes', style: TextStyle(fontFamily: 'InstrumentSans', fontWeight: FontWeight.w500, fontSize: 14.sp, color: PPaymobileColors.mainScreenBackground)))),
                ),
                TouchOpacity(
                  onTap: () => Navigator.pop(context, false),
                  child: Container(height: 50.h, width: 152.w, decoration: BoxDecoration(color: PPaymobileColors.deepBackgroundColor, borderRadius: BorderRadius.circular(6).r), child: Center(child: Text('Cancel', style: TextStyle(fontFamily: 'InstrumentSans', fontWeight: FontWeight.w500, fontSize: 14.sp, color: Colors.black)))),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Future<bool?> _showTerminateDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (context) => Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 28.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Terminate Card', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.red, fontSize: 24.sp, fontWeight: FontWeight.w500)),
                TouchOpacity(onTap: () => Navigator.pop(context, false), child: SizedBox(height: 20.56.h, width: 20.56.w, child: SvgPicture.asset('assets/icon/cancel1.svg', fit: BoxFit.contain))),
              ],
            ),
            20.verticalSpace,
            Text('Are you sure you want to permanently terminate this card? Any remaining balance will be refunded to your wallet.', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500)),
            40.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TouchOpacity(
                  onTap: () => Navigator.pop(context, true),
                  child: Container(height: 50.h, width: 152.w, decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(6).r), child: Center(child: Text('Terminate', style: TextStyle(fontFamily: 'InstrumentSans', fontWeight: FontWeight.w500, fontSize: 14.sp, color: Colors.white)))),
                ),
                TouchOpacity(
                  onTap: () => Navigator.pop(context, false),
                  child: Container(height: 50.h, width: 152.w, decoration: BoxDecoration(color: PPaymobileColors.deepBackgroundColor, borderRadius: BorderRadius.circular(6).r), child: Center(child: Text('Cancel', style: TextStyle(fontFamily: 'InstrumentSans', fontWeight: FontWeight.w500, fontSize: 14.sp, color: Colors.black)))),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

void _showBillingDialog(BuildContext context, DollarCardAddressEntity address) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Billing Address', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w500)),
            24.verticalSpace,
            Text('Billing Address', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 12.sp)),
            Text('${address.street}, ${address.city}, ${address.state}, ${address.country}', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500)),
            20.verticalSpace,
            Text('Postal Code', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 12.sp)),
            Text(address.postalCode, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500)),
            30.verticalSpace,
            TouchOpacity(
              onTap: () => Navigator.pop(context),
              child: Container(height: 50.h, width: 152.w, decoration: BoxDecoration(color: PPaymobileColors.deepBackgroundColor, borderRadius: BorderRadius.circular(6).r), child: Center(child: Text('Go Back', style: TextStyle(fontFamily: 'InstrumentSans', fontWeight: FontWeight.w500, fontSize: 16.sp, color: Colors.black)))),
            ),
          ],
        ),
      ),
    ),
  );
}

@RoutePage()
class CardPage extends HookConsumerWidget {
  final DollarCardEntity card;
  const CardPage({super.key, required this.card});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardState = ref.watch(getDollarCardProvider);
    final freezeState = ref.watch(freezeDollarCardProvider);
    final unfreezeState = ref.watch(unfreezeDollarCardProvider);
    final terminateState = ref.watch(terminateDollarCardProvider);

    final currentCard = cardState.value ?? card;
    final isFrozen = currentCard.status == 'INACTIVE' || currentCard.status == 'FROZEN';
    final isLoading = freezeState is AsyncLoading || unfreezeState is AsyncLoading || terminateState is AsyncLoading;

    useEffect(() {
      Future.microtask(() => ref.read(getDollarCardProvider.notifier).call(cardId: card.dbId));
      return null;
    }, []);

    ref.listen(freezeDollarCardProvider, (_, next) {
      if (next is AsyncData && next.value == null) {
        ref.read(getDollarCardProvider.notifier).call(cardId: card.dbId);
      } else if (next is AsyncError) {
        MessageHandler.showErrorSnackBar(context, MessageHandler.getErrorMessage(next.error));
      }
    });

    ref.listen(unfreezeDollarCardProvider, (_, next) {
      if (next is AsyncData && next.value == null) {
        ref.read(getDollarCardProvider.notifier).call(cardId: card.dbId);
      } else if (next is AsyncError) {
        MessageHandler.showErrorSnackBar(context, MessageHandler.getErrorMessage(next.error));
      }
    });

    ref.listen(terminateDollarCardProvider, (_, next) {
      if (next is AsyncData && next.value == null) {
        MessageHandler.showSuccessSnackBar(context, 'Card terminated successfully');
        ref.read(getDollarCardsProvider.notifier).call();
        context.router.popUntilRouteWithName(MyCardsRoute.name);
      } else if (next is AsyncError) {
        MessageHandler.showErrorSnackBar(context, MessageHandler.getErrorMessage(next.error));
      }
    });

    Future<void> onFreezeSwitchTapped(bool newValue) async {
      if (newValue) {
        final confirmed = await _showFreezeDialog(context);
        if (confirmed != true) return;
        await ref.read(freezeDollarCardProvider.notifier).call(cardId: card.dbId);
      } else {
        await ref.read(unfreezeDollarCardProvider.notifier).call(cardId: card.dbId);
      }
    }

    Widget menuRow(String title, String subtitle, Widget trailing, VoidCallback? onTap) {
      return TouchOpacity(
        onTap: onTap,
        child: Container(
          height: 61.h,
          width: double.infinity,
          padding: EdgeInsets.only(bottom: 10.h),
          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: PPaymobileColors.textfiedBorder, width: 1.w))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w600)),
                    Text(subtitle, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              trailing,
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(title: 'Virtual Card', onBackPressed: () => context.router.popUntilRouteWithName(MyCardsRoute.name)),
      body: cardState is AsyncLoading && cardState.value == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ListView(
                children: [
                  40.verticalSpace,
                  PPAYCardWidget(card: currentCard),
                  12.verticalSpace,
                  if (currentCard.balance == 0)
                    Container(
                      color: PPaymobileColors.warningColor,
                      padding: EdgeInsets.symmetric(vertical: 9.0.h, horizontal: 8.w),
                      child: Row(
                        children: [
                          SizedBox(height: 22.6.h, width: 26.w, child: SvgPicture.asset('assets/icon/alert.svg', fit: BoxFit.contain)),
                          8.horizontalSpace,
                          Expanded(
                            child: Text(
                              'Your USD card has been created, to fully activate your card, click the fund card button',
                              style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.warningTextColor, fontSize: 12.sp, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  20.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TouchOpacity(
                        onTap: isFrozen ? null : () => context.router.push(FundCardRoute(card: currentCard)),
                        child: Opacity(
                          opacity: isFrozen ? 0.4 : 1.0,
                          child: Container(
                            height: 49.h, width: 190.w,
                            decoration: BoxDecoration(color: PPaymobileColors.anotherbuttonbgColor, borderRadius: BorderRadius.circular(6).r, border: Border.all(color: PPaymobileColors.onTapButtonColor, width: 1.w)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 20.h, width: 20.h, child: SvgPicture.asset('assets/icon/fund_add.svg', fit: BoxFit.contain)),
                                8.horizontalSpace,
                                Text('Fund', style: TextStyle(fontFamily: 'InstrumentSans', fontWeight: FontWeight.w500, fontSize: 14.sp, color: Colors.black)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      TouchOpacity(
                        onTap: () => context.router.push(CardTransactionRoute(card: currentCard)),
                        child: Container(
                          height: 49.h, width: 190.w,
                          decoration: BoxDecoration(color: PPaymobileColors.anotherbuttonbgColor, borderRadius: BorderRadius.circular(6).r, border: Border.all(color: PPaymobileColors.onTapButtonColor, width: 1.w)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 20.h, width: 20.h, child: SvgPicture.asset('assets/icon/transact_ic.svg', fit: BoxFit.contain)),
                              8.horizontalSpace,
                              Text('Transactions', style: TextStyle(fontFamily: 'InstrumentSans', fontWeight: FontWeight.w500, fontSize: 14.sp, color: Colors.black)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  48.verticalSpace,
                  menuRow(
                    'Card Details',
                    'Get and copy card information here',
                    SizedBox(height: 24.h, width: 12.w, child: SvgPicture.asset('assets/icon/arrow_forward.svg', fit: BoxFit.contain)),
                    () async {
                      await showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (_) => CardDetailsBottomsheet(card: currentCard),
                      );
                    },
                  ),
                  27.verticalSpace,
                  menuRow(
                    'Freeze Card',
                    'Click to pause all card activities',
                    isLoading
                        ? SizedBox(height: 25.h, width: 43.w, child: const Center(child: SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2))))
                        : SizedBox(width: 43.w, height: 25.h, child: CustomSwitch(value: isFrozen, onChanged: onFreezeSwitchTapped)),
                    null,
                  ),
                  27.verticalSpace,
                  menuRow(
                    'Billing Address',
                    'Get your billing address info',
                    SizedBox(height: 24.h, width: 12.w, child: SvgPicture.asset('assets/icon/arrow_forward.svg', fit: BoxFit.contain)),
                    () => _showBillingDialog(context, currentCard.address),
                  ),
                  27.verticalSpace,
                  menuRow(
                    'Card Limit',
                    'View your card spending limits',
                    SizedBox(height: 24.h, width: 12.w, child: SvgPicture.asset('assets/icon/arrow_forward.svg', fit: BoxFit.contain)),
                    () => context.router.push(CardLimitRoute()),
                  ),
                  27.verticalSpace,
                  menuRow(
                    'Terminate Card',
                    'Permanently close this card',
                    SizedBox(height: 24.h, width: 12.w, child: SvgPicture.asset('assets/icon/arrow_forward.svg', fit: BoxFit.contain)),
                    () async {
                      final confirmed = await _showTerminateDialog(context);
                      if (confirmed == true) {
                        await ref.read(terminateDollarCardProvider.notifier).call(cardId: card.dbId);
                      }
                    },
                  ),
                  27.verticalSpace,
                ],
              ),
            ),
    );
  }
}
