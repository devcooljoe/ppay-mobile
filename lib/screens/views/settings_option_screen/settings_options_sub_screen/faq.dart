import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/faq_tile.dart';

class FaqTab extends StatefulWidget {
  const FaqTab({super.key});

  @override
  State<FaqTab> createState() => _FaqTabState();
}

class _FaqTabState extends State<FaqTab> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20).w,
      children: [
        32.verticalSpace,
        SizedBox(
          height: 54.h,
          width: double.infinity,
          child: TextFormField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10.h,
                vertical: 14.w,
              ),
              prefixIcon: SizedBox(
                height: 24.w,
                width: 24.w,
                child: SvgPicture.asset(
                  'assets/icon/bank_search.svg',
                  fit: BoxFit.scaleDown,
                ),
              ),
              hintText: 'Search',
              hintStyle: TextStyle(
                fontFamily: 'InstrumentSans',
                color: PPaymobileColors.textfiedBorder,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              filled: true,
              fillColor: PPaymobileColors.deepBackgroundColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4).r,
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        32.verticalSpace,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _FaqChip(
                label: 'All',
                selected: selectedIndex == 0,
                onTap: () {
                  setState(() {
                    selectedIndex = 0;
                  });
                },
              ),
              _FaqChip(
                label: 'Crypto',
                selected: selectedIndex == 1,
                onTap: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                },
              ),
              _FaqChip(
                label: 'Shopping',
                selected: selectedIndex == 2,
                onTap: () {
                  setState(() {
                    selectedIndex = 2;
                  });
                },
              ),
              _FaqChip(
                label: 'Gift Cards',
                selected: selectedIndex == 3,
                onTap: () {
                  setState(() {
                    selectedIndex = 3;
                  });
                },
              ),
            ],
          ),
        ),
        56.verticalSpace,
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
