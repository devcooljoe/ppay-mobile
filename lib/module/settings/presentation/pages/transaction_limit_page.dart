import 'package:flutter/material.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:flutter/services.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/module/auth/presentation/providers/auth_providers.dart';
import 'package:ppay_mobile/module/dashboard/providers/wallet_provider.dart';
import 'package:ppay_mobile/module/settings/presentation/providers/transaction_limit_provider.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';

// Formats a limit amount, showing "Unlimited" when the value is null or 0.
String _formatLimit(double? value) {
  if (value == null || value <= 0) return 'Unlimited';
  final whole = value.truncateToDouble() == value;
  final str = value.toStringAsFixed(whole ? 0 : 2);
  final buffer = StringBuffer();
  final parts = str.split('.');
  final intPart = parts[0];
  for (int i = 0; i < intPart.length; i++) {
    if (i > 0 && (intPart.length - i) % 3 == 0) buffer.write(',');
    buffer.write(intPart[i]);
  }
  if (parts.length > 1) {
    buffer.write('.');
    buffer.write(parts[1]);
  }
  return '₦$buffer';
}

const Map<int, String> _tierRequirements = {
  1: 'Email Verified',
  2: 'Email & BVN Verified',
  3: 'Email, BVN & ID Verified',
};

@RoutePage()
class TransactionLimitPage extends HookConsumerWidget {
  const TransactionLimitPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authenticatedUserProvider).value;
    final wallet = ref.watch(walletProvider).value;
    final limitsAsync = ref.watch(transactionLimitsProvider);
    final limits = limitsAsync.value;

    final tier = limits?.currentTier ?? user?.tier ?? 1;
    final accountNumber = wallet?.accountNumber ?? '—';
    final accountName = wallet?.accountName ?? user?.fullName ?? '—';
    final bankName = wallet?.bankName ?? '—';

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: const PPAppBar(title: 'Transaction Limit'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            34.verticalSpace,
            // Wallet card
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12).r,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xFFFFFAAA), Color(0xFFFFE761)],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Wallet Details',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        8.verticalSpace,
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                accountNumber,
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            if (accountNumber != '—') ...[
                              12.horizontalSpace,
                              TouchOpacity(
                                onTap: () {
                                  Clipboard.setData(
                                    ClipboardData(text: accountNumber),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Account number copied'),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                },
                                child: SizedBox(
                                  height: 24.w,
                                  width: 24.w,
                                  child: SvgPicture.asset(
                                    'assets/icon/copy_black.svg',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                        2.verticalSpace,
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                bankName,
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            if (bankName != '—' && accountName != '—') ...[
                              7.horizontalSpace,
                              SizedBox(
                                height: 11.w,
                                width: 11.w,
                                child: SvgPicture.asset(
                                  'assets/icon/big_dot.svg',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              7.horizontalSpace,
                            ],
                            Flexible(
                              child: Text(
                                accountName,
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 57.w,
                        width: 57.w,
                        child: Image.asset(
                          'assets/images/tier_award.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      20.verticalSpace,
                      Container(
                        height: 24.h,
                        width: 57.w,
                        color: PPaymobileColors.mainScreenBackground,
                        child: Center(
                          child: Text(
                            'Tier $tier',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: PPaymobileColors.buttonColorandText,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            34.verticalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Limit Details',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                10.verticalSpace,
                Text(
                  'The higher your tier level the higher you can make transactions. Please ensure to complete all verification to enjoy unlimited transactions',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                48.verticalSpace,
                Text(
                  'Limit Breakdown',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                30.verticalSpace,
                if (limitsAsync.isLoading && limits == null)
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 40.h),
                    child: const Center(child: CircularProgressIndicator()),
                  )
                else if (limits == null || limits.tiers.isEmpty)
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 40.h),
                    child: Center(
                      child: Text(
                        'Unable to load limits right now.',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black54,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                else
                  ...(() {
                    final sorted = [...limits.tiers]
                      ..sort((a, b) => a.tier.compareTo(b.tier));
                    final widgets = <Widget>[];
                    for (final t in sorted) {
                      widgets.add(
                        _TierSection(
                          tierNumber: t.tier,
                          isCurrent: tier == t.tier,
                          requirement: _tierRequirements[t.tier] ?? '',
                          singleTransferLimit: _formatLimit(t.singleLimit),
                          dailyTransferLimit: _formatLimit(t.dailyLimit),
                          monthlyTransferLimit: _formatLimit(t.monthlyLimit),
                        ),
                      );
                      widgets.add(32.verticalSpace);
                    }
                    return widgets;
                  })(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _TierSection extends StatelessWidget {
  final int tierNumber;
  final bool isCurrent;
  final String requirement;
  final String singleTransferLimit;
  final String dailyTransferLimit;
  final String monthlyTransferLimit;

  const _TierSection({
    required this.tierNumber,
    required this.isCurrent,
    required this.requirement,
    required this.singleTransferLimit,
    required this.dailyTransferLimit,
    required this.monthlyTransferLimit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Tier $tierNumber',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (isCurrent) ...[
              13.horizontalSpace,
              Container(
                height: 20.h,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: PPaymobileColors.doneColor,
                  borderRadius: BorderRadius.circular(4).r,
                ),
                child: Text(
                  'Current',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.doneTextColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ],
        ),
        4.verticalSpace,
        Text(
          requirement,
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: Colors.black54,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        10.verticalSpace,
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(10).r,
          color: PPaymobileColors.deepBackgroundColor,
          child: Row(
            children: [
              Text(
                'Limit Type',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Text(
                'Amount',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        14.verticalSpace,
        _LimitRow(label: 'Single Transaction', value: singleTransferLimit),
        10.verticalSpace,
        _LimitRow(label: 'Daily Transaction', value: dailyTransferLimit),
        10.verticalSpace,
        _LimitRow(label: 'Monthly Transaction', value: monthlyTransferLimit),
      ],
    );
  }
}

class _LimitRow extends StatelessWidget {
  final String label;
  final String value;

  const _LimitRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: 'InstrumentSans',
              color: Colors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: TextStyle(
              fontFamily: 'InstrumentSans',
              color: Colors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
