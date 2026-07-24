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
import 'package:ppay_mobile/shared/widgets/colors.dart';

@RoutePage()
class TransactionLimitPage extends HookConsumerWidget {
  const TransactionLimitPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authenticatedUserProvider).value;
    final wallet = ref.watch(walletProvider).value;

    final tier = user?.tier ?? 1;
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
                                  Clipboard.setData(ClipboardData(text: accountNumber));
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
                _TierSection(
                  tierNumber: 1,
                  isCurrent: tier == 1,
                  requirement: 'Email & Phone Verified',
                  singleTransferLimit: '₦50,000',
                  dailyTransferLimit: '₦200,000',
                  walletBalance: '₦300,000',
                  fundingMin: '₦100',
                  fundingMax: '₦300,000',
                ),
                32.verticalSpace,
                _TierSection(
                  tierNumber: 2,
                  isCurrent: tier == 2,
                  requirement: 'Email, Phone & BVN Verified',
                  singleTransferLimit: '₦200,000',
                  dailyTransferLimit: '₦500,000',
                  walletBalance: '₦500,000',
                  fundingMin: '₦100',
                  fundingMax: '₦500,000',
                ),
                32.verticalSpace,
                _TierSection(
                  tierNumber: 3,
                  isCurrent: tier == 3,
                  requirement: 'Email, Phone, BVN & ID Verified',
                  singleTransferLimit: '₦1,000,000',
                  dailyTransferLimit: '₦5,000,000',
                  walletBalance: 'Unlimited',
                  fundingMin: '₦100',
                  fundingMax: 'Unlimited',
                ),
                32.verticalSpace,
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
  final String walletBalance;
  final String fundingMin;
  final String fundingMax;

  const _TierSection({
    required this.tierNumber,
    required this.isCurrent,
    required this.requirement,
    required this.singleTransferLimit,
    required this.dailyTransferLimit,
    required this.walletBalance,
    required this.fundingMin,
    required this.fundingMax,
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
        _LimitRow(label: 'Single Transfer', value: singleTransferLimit),
        10.verticalSpace,
        _LimitRow(label: 'Daily Transfer', value: dailyTransferLimit),
        10.verticalSpace,
        _LimitRow(label: 'Max Wallet Balance', value: walletBalance),
        10.verticalSpace,
        _LimitRow(label: 'Min Funding', value: fundingMin),
        10.verticalSpace,
        _LimitRow(label: 'Max Funding', value: fundingMax),
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
