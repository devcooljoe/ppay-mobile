import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/module/virtual_card/domain/entities/dollar_card_entity.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';

/// Maps a color key to a card gradient
LinearGradient cardGradient(String colorKey) {
  switch (colorKey) {
    case 'midnight':
      return const LinearGradient(colors: [Color(0xFF0D1B2A), Color(0xFF1B3A5C)], begin: Alignment.topLeft, end: Alignment.bottomRight);
    case 'gold':
      return const LinearGradient(colors: [Color(0xFF7B5E00), Color(0xFFD4A017)], begin: Alignment.topLeft, end: Alignment.bottomRight);
    case 'rose':
      return const LinearGradient(colors: [Color(0xFF6B1A2A), Color(0xFFB5445A)], begin: Alignment.topLeft, end: Alignment.bottomRight);
    case 'slate':
      return const LinearGradient(colors: [Color(0xFF2C3E50), Color(0xFF4A6274)], begin: Alignment.topLeft, end: Alignment.bottomRight);
    case 'forest':
      return const LinearGradient(colors: [Color(0xFF1A3A2A), Color(0xFF2E6B4A)], begin: Alignment.topLeft, end: Alignment.bottomRight);
    case 'teal':
    default:
      return const LinearGradient(colors: [Color(0xFF0C3C40), Color(0xFF26585F)], begin: Alignment.topLeft, end: Alignment.bottomRight);
  }
}

Color cardAccent(String colorKey) {
  switch (colorKey) {
    case 'midnight': return const Color(0xFF4BE292);
    case 'gold': return const Color(0xFFFFE082);
    case 'rose': return const Color(0xFFFFB3C1);
    case 'slate': return const Color(0xFFB0C4DE);
    case 'forest': return const Color(0xFF90EE90);
    case 'teal':
    default: return const Color(0xFF4BE292);
  }
}

class PPAYCardWidget extends StatelessWidget {
  final DollarCardEntity card;
  final bool compact;

  const PPAYCardWidget({super.key, required this.card, this.compact = false});

  @override
  Widget build(BuildContext context) {
    final gradient = cardGradient(card.color);
    final accent = cardAccent(card.color);
    final isFrozen = card.status == 'INACTIVE' || card.status == 'FROZEN';
    final last4 = card.maskedPan.length >= 4 ? card.maskedPan.substring(card.maskedPan.length - 4) : '****';
    final isMastercard = card.brand.toUpperCase() == 'MASTERCARD' || card.issuer.toUpperCase() == 'MASTERCARD';

    return Container(
      height: compact ? 140.h : 180.h,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(20).r,
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.18), blurRadius: 16, offset: const Offset(0, 6))],
      ),
      child: Stack(
        children: [
          // Background circle decoration
          Positioned(
            right: -30.w,
            top: -30.h,
            child: Container(
              width: 160.w,
              height: 160.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.05),
              ),
            ),
          ),
          Positioned(
            left: -20.w,
            bottom: -40.h,
            child: Container(
              width: 140.w,
              height: 140.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.04),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(compact ? 14.r : 20.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top row: brand + status
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: compact ? 26.h : 34.h,
                          width: compact ? 28.w : 36.w,
                          child: Image.asset('assets/images/pinnacle.png', fit: BoxFit.contain),
                        ),
                        8.horizontalSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('PINNACLEPAY', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.white, fontSize: compact ? 12.sp : 14.sp, fontWeight: FontWeight.w700, letterSpacing: 1.2)),
                            Text(card.name, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.white.withValues(alpha: 0.75), fontSize: compact ? 10.sp : 12.sp, fontWeight: FontWeight.w400)),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                      decoration: BoxDecoration(
                        color: isFrozen ? Colors.red.withValues(alpha: 0.2) : accent.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(20).r,
                        border: Border.all(color: isFrozen ? Colors.red.withValues(alpha: 0.5) : accent.withValues(alpha: 0.5)),
                      ),
                      child: Text(
                        isFrozen ? 'FROZEN' : 'ACTIVE',
                        style: TextStyle(fontFamily: 'InstrumentSans', color: isFrozen ? Colors.red[300] : accent, fontSize: 10.sp, fontWeight: FontWeight.w600, letterSpacing: 0.8),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                // Balance + last 4
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Balance', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.white.withValues(alpha: 0.6), fontSize: compact ? 10.sp : 12.sp)),
                        Text('\$${card.balance.toStringAsFixed(2)}', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.white, fontSize: compact ? 18.sp : 22.sp, fontWeight: FontWeight.w700)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('•••• •••• •••• $last4', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.white.withValues(alpha: 0.85), fontSize: compact ? 11.sp : 13.sp, letterSpacing: 1.5)),
                        4.verticalSpace,
                        _NetworkLogo(isMastercard: isMastercard, accent: accent, compact: compact),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NetworkLogo extends StatelessWidget {
  final bool isMastercard;
  final Color accent;
  final bool compact;

  const _NetworkLogo({required this.isMastercard, required this.accent, required this.compact});

  @override
  Widget build(BuildContext context) {
    if (isMastercard) {
      return SizedBox(
        width: compact ? 36.w : 44.w,
        height: compact ? 22.h : 28.h,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              child: Container(
                width: compact ? 22.w : 28.w,
                height: compact ? 22.w : 28.w,
                decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red.withValues(alpha: 0.85)),
              ),
            ),
            Positioned(
              right: 0,
              child: Container(
                width: compact ? 22.w : 28.w,
                height: compact ? 22.w : 28.w,
                decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.orange.withValues(alpha: 0.85)),
              ),
            ),
          ],
        ),
      );
    }
    // Visa
    return Text('VISA', style: TextStyle(fontFamily: 'InstrumentSans', color: accent, fontSize: compact ? 14.sp : 18.sp, fontWeight: FontWeight.w800, fontStyle: FontStyle.italic, letterSpacing: 1));
  }
}

/// Color picker for card creation
class CardColorPicker extends StatelessWidget {
  final String selected;
  final ValueChanged<String> onChanged;

  const CardColorPicker({super.key, required this.selected, required this.onChanged});

  static const _colors = [
    ('teal', 'Teal'),
    ('midnight', 'Midnight'),
    ('gold', 'Gold'),
    ('rose', 'Rose'),
    ('slate', 'Slate'),
    ('forest', 'Forest'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _colors.length,
        separatorBuilder: (_, __) => 10.horizontalSpace,
        itemBuilder: (context, i) {
          final (key, label) = _colors[i];
          final isSelected = selected == key;
          final gradient = cardGradient(key);
          return GestureDetector(
            onTap: () => onChanged(key),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 52.w,
              height: 52.h,
              decoration: BoxDecoration(
                gradient: gradient,
                borderRadius: BorderRadius.circular(12).r,
                border: Border.all(color: isSelected ? PPaymobileColors.highlightTextColor : Colors.transparent, width: 2.5),
                boxShadow: isSelected ? [BoxShadow(color: Colors.black.withValues(alpha: 0.2), blurRadius: 8, offset: const Offset(0, 3))] : [],
              ),
              child: isSelected ? Center(child: Icon(Icons.check_rounded, color: Colors.white, size: 20.w)) : null,
            ),
          );
        },
      ),
    );
  }
}
