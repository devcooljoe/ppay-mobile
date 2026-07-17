import 'package:flutter/material.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/faq_tile.dart';

const _faqs = [
  _Faq(
    category: 'General',
    question: 'How do I fund my wallet?',
    answer:
        'Go to your wallet and tap "Fund Wallet". You will see your virtual account details. Make a bank transfer to that account and your wallet will be credited automatically within minutes.',
  ),
  _Faq(
    category: 'General',
    question: 'How long does it take for my wallet to be credited?',
    answer:
        'Wallet funding is usually instant. In rare cases it may take up to 5 minutes. If your wallet is not credited after 10 minutes, please contact support.',
  ),
  _Faq(
    category: 'General',
    question: 'How do I withdraw money from my wallet?',
    answer:
        'Tap "Transfer" on the home screen, enter the recipient\'s bank details and the amount, then confirm with your transaction PIN.',
  ),
  _Faq(
    category: 'KYC',
    question: 'Why do I need to verify my identity?',
    answer:
        'Identity verification (KYC) is required by financial regulations to protect you and prevent fraud. Completing KYC also unlocks higher transaction limits.',
  ),
  _Faq(
    category: 'KYC',
    question: 'What documents are accepted for KYC?',
    answer:
        'We accept National ID, Driver\'s License, Voter\'s Card, and International Passport. Make sure the document is valid and the details are clearly visible.',
  ),
  _Faq(
    category: 'KYC',
    question: 'How long does KYC verification take?',
    answer:
        'KYC verification is usually completed within 1–2 business days. You will receive a notification once your verification is complete.',
  ),
  _Faq(
    category: 'Gift Cards',
    question: 'How do gift card trades work?',
    answer:
        'Select "Sell Gift Card", choose the card type, enter the card details and amount, then submit. Our team will review and credit your wallet once verified.',
  ),
  _Faq(
    category: 'Gift Cards',
    question: 'How long does it take to receive payment for a gift card?',
    answer:
        'Gift card payments are typically processed within 30 minutes to 2 hours during business hours. You will be notified once your wallet is credited.',
  ),
  _Faq(
    category: 'Gift Cards',
    question: 'What gift card brands do you accept?',
    answer:
        'We accept a wide range of gift cards including Amazon, iTunes, Google Play, Steam, Xbox, PlayStation, and many more. Check the app for the full list.',
  ),
  _Faq(
    category: 'Crypto',
    question: 'How do I buy cryptocurrency?',
    answer:
        'Go to the Crypto section, select the coin you want to buy, enter the amount, and confirm the purchase. The crypto will be added to your portfolio instantly.',
  ),
  _Faq(
    category: 'Crypto',
    question: 'How do I sell cryptocurrency?',
    answer:
        'Go to your crypto portfolio, select the coin you want to sell, tap "Sell", enter the amount, and confirm. The equivalent naira value will be credited to your wallet.',
  ),
  _Faq(
    category: 'Crypto',
    question: 'Are crypto transactions reversible?',
    answer:
        'No. Cryptocurrency transactions are irreversible once confirmed. Please double-check all details before confirming any crypto transaction.',
  ),
  _Faq(
    category: 'Security',
    question: 'What should I do if I forget my transaction PIN?',
    answer:
        'Go to Settings → Change Transaction PIN. We will send a verification code to your registered email. Use it to reset your PIN.',
  ),
  _Faq(
    category: 'Security',
    question: 'How do I enable biometric login?',
    answer:
        'Go to Settings → Enable Biometric and toggle it on. You will be prompted to authenticate with your fingerprint or face ID to confirm.',
  ),
  _Faq(
    category: 'Security',
    question: 'What should I do if I suspect unauthorized access to my account?',
    answer:
        'Change your password immediately from Settings → Change Password. Then contact our support team via Live Chat or Support Ticket so we can investigate.',
  ),
];

class _Faq {
  final String category;
  final String question;
  final String answer;
  const _Faq({required this.category, required this.question, required this.answer});
}

@RoutePage()
class FaqTabPage extends HookConsumerWidget {
  const FaqTabPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = useState('All');
    final searchQuery = useState('');
    final searchController = useTextEditingController();

    final categories = ['All', 'General', 'KYC', 'Gift Cards', 'Crypto', 'Security'];

    final filtered = _faqs.where((faq) {
      final matchesCategory = selectedCategory.value == 'All' || faq.category == selectedCategory.value;
      final q = searchQuery.value.toLowerCase();
      final matchesSearch = q.isEmpty ||
          faq.question.toLowerCase().contains(q) ||
          faq.answer.toLowerCase().contains(q);
      return matchesCategory && matchesSearch;
    }).toList();

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      children: [
        32.verticalSpace,
        SizedBox(
          height: 54.h,
          child: TextFormField(
            controller: searchController,
            onChanged: (v) => searchQuery.value = v,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 14.w),
              prefixIcon: SizedBox(
                height: 24.w,
                width: 24.w,
                child: SvgPicture.asset('assets/icon/bank_search.svg', fit: BoxFit.scaleDown),
              ),
              hintText: 'Search questions...',
              hintStyle: TextStyle(
                fontFamily: 'InstrumentSans',
                color: PPaymobileColors.textfiedBorder,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
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
        20.verticalSpace,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: categories.map((cat) {
              final selected = selectedCategory.value == cat;
              return TouchOpacity(
                onTap: () => selectedCategory.value = cat,
                child: Container(
                  height: 34.h,
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: 10.w),
                  decoration: BoxDecoration(
                    color: selected ? PPaymobileColors.buttonColor : PPaymobileColors.mainScreenBackground,
                    borderRadius: BorderRadius.circular(46.r),
                    border: Border.all(
                      color: selected ? PPaymobileColors.buttonColor : PPaymobileColors.deepBackgroundColor,
                    ),
                  ),
                  child: Text(
                    cat,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: selected ? PPaymobileColors.mainScreenBackground : Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        24.verticalSpace,
        if (filtered.isEmpty)
          Padding(
            padding: EdgeInsets.only(top: 40.h),
            child: Center(
              child: Text(
                'No results found.',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.svgIconColor,
                  fontSize: 14.sp,
                ),
              ),
            ),
          )
        else
          ...filtered.map((faq) => FaqTile(question: faq.question, answer: faq.answer)),
        24.verticalSpace,
      ],
    );
  }
}
