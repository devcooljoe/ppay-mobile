import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/faq_tile.dart';

@RoutePage()
class FaqTabPage extends HookConsumerWidget {
  const FaqTabPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState(0);

    return Scaffold(
      backgroundColor: PPaymobileColors.deepBackgroundColor,
      appBar: AppBar(
        backgroundColor: PPaymobileColors.mainScreenBackground,
        toolbarHeight: 56,
        leadingWidth: 56.w,
        title: Text(
          'FAQ',
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: GestureDetector(
            onTap: () => context.router.pop(),
            child: SizedBox(
              height: 24.w,
              width: 24.w,
              child: SvgPicture.asset(
                'assets/icon/arrow_back.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              24.verticalSpace,
              SizedBox(
                height: 36.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _FaqChip(
                      label: 'General',
                      selected: selectedIndex.value == 0,
                      onTap: () {
                        selectedIndex.value = 0;
                      },
                    ),
                    _FaqChip(
                      label: 'Crypto',
                      selected: selectedIndex.value == 1,
                      onTap: () {
                        selectedIndex.value = 1;
                      },
                    ),
                    _FaqChip(
                      label: 'Shopping',
                      selected: selectedIndex.value == 2,
                      onTap: () {
                        selectedIndex.value = 2;
                      },
                    ),
                    _FaqChip(
                      label: 'Gift Cards',
                      selected: selectedIndex.value == 3,
                      onTap: () {
                        selectedIndex.value = 3;
                      },
                    ),
                  ],
                ),
              ),
              56.verticalSpace,
              Expanded(
                child: ListView(
                  children: [
                    FaqTile(
                      question: 'How do I fund my wallet on the app?',
                      answer:
                          'You can fund your wallet using your virtual account details provided in the app. Simply make a transfer from your bank, and your wallet will be credited automatically',
                    ),
                    FaqTile(
                      question: 'How do gift card trades work?',
                      answer:
                          'You can fund your wallet using your virtual account details provided in the app. Simply make a transfer from your bank, and your wallet will be credited automatically',
                    ),
                    FaqTile(
                      question: 'How do I buy or sell cryptocurrency?',
                      answer:
                          'You can fund your wallet using your virtual account details provided in the app. Simply make a transfer from your bank, and your wallet will be credited automatically',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FaqChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback? onTap;

  const _FaqChip({required this.label, this.selected = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 36.h,
        constraints: BoxConstraints(minWidth: 90.w),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 24.w),
        decoration: BoxDecoration(
          color: selected
              ? PPaymobileColors.buttonColor
              : PPaymobileColors.mainScreenBackground,
          borderRadius: BorderRadius.circular(46.r),
          border: Border.all(
            color: selected
                ? PPaymobileColors.buttonColor
                : PPaymobileColors.deepBackgroundColor,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: selected
                  ? PPaymobileColors.mainScreenBackground
                  : Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
            ),
          ),
        ),
      ),
    );
  }
}
