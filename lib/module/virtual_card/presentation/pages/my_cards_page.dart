import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
class MyCardsPage extends HookConsumerWidget {
  const MyCardsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardsState = ref.watch(getDollarCardsProvider);
    // Per-card color map stored locally (color is a UI-only preference)
    final colorMap = useState<Map<String, String>>({});

    useEffect(() {
      Future.microtask(() => ref.read(getDollarCardsProvider.notifier).call());
      return null;
    }, []);

    final cards = cardsState.value ?? [];

    String colorFor(DollarCardEntity card) => colorMap.value[card.dbId] ?? card.color;

    void setColor(String dbId, String color) {
      colorMap.value = {...colorMap.value, dbId: color};
    }

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(title: 'My Cards'),
      body: SafeArea(
        child: cardsState is AsyncLoading && cards.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : cardsState is AsyncError && cards.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(MessageHandler.getErrorMessage(cardsState.error), textAlign: TextAlign.center, style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 14.sp)),
                        16.verticalSpace,
                        TextButton(onPressed: () => ref.read(getDollarCardsProvider.notifier).call(), child: const Text('Retry')),
                      ],
                    ),
                  )
                : cards.isEmpty
                    ? _EmptyCardsView(onCreateTap: () => context.router.push(CreateVirtualCardRoute()))
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.separated(
                                padding: EdgeInsets.only(top: 24.h, bottom: 24.h),
                                itemCount: cards.length,
                                separatorBuilder: (_, __) => 20.verticalSpace,
                                itemBuilder: (context, i) {
                                  final card = cards[i].copyWith(color: colorFor(cards[i]));
                                  return _CardListItem(
                                    card: card,
                                    onColorChanged: (c) => setColor(card.dbId, c),
                                    onTap: () => context.router.push(CardRoute(card: card)),
                                  );
                                },
                              ),
                            ),
                            PPButton(
                              text: '+ Add New Card',
                              onPressed: () => context.router.push(AddDollarCardRoute()),
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

class _CardListItem extends StatelessWidget {
  final DollarCardEntity card;
  final ValueChanged<String> onColorChanged;
  final VoidCallback onTap;

  const _CardListItem({required this.card, required this.onColorChanged, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TouchOpacity(
          onTap: onTap,
          child: PPAYCardWidget(card: card),
        ),
        12.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CardColorPicker(
                selected: card.color,
                onChanged: onColorChanged,
              ),
            ),
            12.horizontalSpace,
            TouchOpacity(
              onTap: onTap,
              child: Container(
                height: 44.h,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  color: PPaymobileColors.anotherbuttonbgColor,
                  borderRadius: BorderRadius.circular(8).r,
                  border: Border.all(color: PPaymobileColors.onTapButtonColor),
                ),
                child: Row(
                  children: [
                    Text('Manage', style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 13.sp, fontWeight: FontWeight.w500, color: Colors.black)),
                    6.horizontalSpace,
                    SizedBox(height: 14.h, width: 8.w, child: SvgPicture.asset('assets/icon/arrow_forward.svg', fit: BoxFit.contain)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _EmptyCardsView extends StatelessWidget {
  final VoidCallback onCreateTap;
  const _EmptyCardsView({required this.onCreateTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          28.verticalSpace,
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 12.0.w),
                child: Container(
                  height: 256.h, width: 256.h,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: PPaymobileColors.deepBackgroundColor),
                ),
              ),
              Positioned(
                top: 30.h, left: 26.w,
                child: SizedBox(height: 250.71.h, width: 354.w, child: Image.asset('assets/images/dollar_card.png', fit: BoxFit.contain)),
              ),
            ],
          ),
          37.verticalSpace,
          Text('Spend Globally. Pay Securely.', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.buttonColor, fontSize: 20.sp, fontWeight: FontWeight.w600)),
          16.verticalSpace,
          Text('Activate a virtual USD card in seconds to make international payments, shop online, and more.', textAlign: TextAlign.center, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 15.sp, fontWeight: FontWeight.w500)),
          const Spacer(),
          PPButton(text: 'Create Dollar Card', onPressed: onCreateTap),
          20.verticalSpace,
        ],
      ),
    );
  }
}
