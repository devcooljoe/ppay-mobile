import 'package:flutter/material.dart';
import 'package:flutter/services.dart' hide MessageHandler;
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/auth/presentation/providers/auth_providers.dart';
import 'package:ppay_mobile/module/referral/presentation/providers/referral_providers.dart';
import 'package:ppay_mobile/shared/widgets/app_loader.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/skeleton_loader.dart';

@RoutePage()
class ReferPage extends HookConsumerWidget {
  const ReferPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authenticatedUserProvider).value;
    final referralState = ref.watch(getMyReferralsProvider);

    useEffect(() {
      Future.microtask(() => ref.read(getMyReferralsProvider.notifier).call());
      return null;
    }, []);

    ref.listen(withdrawPointsProvider, (previous, next) {
      if (next.isLoading) {
        AppLoader.show(context);
      } else if (previous?.isLoading == true) {
        AppLoader.hide(context);
        if (next.hasError) {
          MessageHandler.showErrorSnackBar(context, MessageHandler.getErrorMessage(next.error));
        } else {
          MessageHandler.showSuccessSnackBar(context, 'Points withdrawn to your wallet!');
          ref.read(getMyReferralsProvider.notifier).call();
        }
      }
    });

    final info = referralState.value;
    final referralCode = info?.referralCode ?? user?.referralCode ?? '';
    final totalReferrals = info?.totalReferrals ?? 0;
    final pointsBalance = info?.pointsBalance ?? 0;
    final pointsPerReferral = info?.pointsPerReferral ?? 0;
    final minimumWithdrawalPoints = info?.minimumWithdrawalPoints ?? 0;
    final referrals = info?.referrals ?? [];
    final canWithdraw = pointsBalance >= minimumWithdrawalPoints && pointsBalance > 0;

    void copyCode() {
      if (referralCode.isEmpty) return;
      Clipboard.setData(ClipboardData(text: referralCode));
      MessageHandler.showSuccessSnackBar(context, 'Referral code copied!');
    }

    String formatDate(String isoDate) {
      try {
        final date = DateTime.parse(isoDate);
        return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
      } catch (_) {
        return isoDate;
      }
    }

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: AppBar(
        backgroundColor: PPaymobileColors.backgroundColor,
        toolbarHeight: 56,
        leadingWidth: 56.w,
        centerTitle: true,
        title: Text(
          'Referral',
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
      ),
      body: SafeArea(
        child: ListView(
          children: [
            // Hero banner
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              color: PPaymobileColors.backgroundColor,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Refer your friends',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: PPaymobileColors.mainScreenBackground,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      1.verticalSpace,
                      SizedBox(
                        height: 76.h,
                        width: 200.w,
                        child: Text(
                          'Earn points for every friend you refer',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.mainScreenBackground,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 114.h,
                    width: 107.w,
                    child: Image.asset(
                      'assets/images/trophy.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),

            // Stats + Points card
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              decoration: BoxDecoration(
                color: PPaymobileColors.deepBackgroundColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        referralState.isLoading
                            ? SkeletonLoader(width: 40.w, height: 28.h)
                            : Text(
                                '$totalReferrals',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: PPaymobileColors.backgroundColor,
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                        4.verticalSpace,
                        Text(
                          'Total Referrals',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.svgIconColor,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(width: 1.w, height: 48.h, color: PPaymobileColors.textfiedBorder),
                  Expanded(
                    child: Column(
                      children: [
                        referralState.isLoading
                            ? SkeletonLoader(width: 60.w, height: 28.h)
                            : Text(
                                '$pointsBalance pts',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: PPaymobileColors.backgroundColor,
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                        4.verticalSpace,
                        Text(
                          'Points Balance',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.svgIconColor,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Points info
                  if (!referralState.isLoading && pointsPerReferral > 0)
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEFF5F2),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        'You earn $pointsPerReferral point${pointsPerReferral == 1 ? '' : 's'} (₦$pointsPerReferral) when a referred friend completes their first transaction.',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: PPaymobileColors.backgroundColor,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                  if (!referralState.isLoading && pointsPerReferral > 0) 16.verticalSpace,

                  // How it works steps
                  Text(
                    'How it works',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  20.verticalSpace,
                  _StepRow(
                    iconPath: 'assets/icon/link.svg',
                    label: 'Copy and share your referral code',
                    showConnector: true,
                  ),
                  _StepRow(
                    iconPath: 'assets/icon/signin.svg',
                    label: 'Your friend signs up with your code',
                    showConnector: true,
                  ),
                  _StepRow(
                    iconPath: 'assets/icon/money.svg',
                    label: 'They make their first transaction — you earn points',
                    showConnector: false,
                  ),
                  48.verticalSpace,

                  // Referral code section
                  Text(
                    'Your Referral Code',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  10.verticalSpace,
                  TouchOpacity(
                    onTap: copyCode,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                      decoration: BoxDecoration(
                        color: PPaymobileColors.deepBackgroundColor,
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: PPaymobileColors.textfiedBorder),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          referralState.isLoading
                              ? SkeletonLoader(width: 120.w, height: 18.h)
                              : Text(
                                  referralCode.isNotEmpty ? referralCode : '—',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 2,
                                  ),
                                ),
                          SvgPicture.asset(
                            'assets/icon/paste.svg',
                            width: 20.w,
                            height: 20.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                  32.verticalSpace,

                  // Withdraw points section
                  Text(
                    'Withdraw Points',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  8.verticalSpace,
                  Text(
                    minimumWithdrawalPoints > 0
                        ? 'Minimum $minimumWithdrawalPoints points required to withdraw. 1 point = ₦1.'
                        : '1 point = ₦1. Withdraw your points to your wallet.',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.svgIconColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  16.verticalSpace,
                  PPButton(
                    text: canWithdraw
                        ? 'Withdraw $pointsBalance Points (₦$pointsBalance)'
                        : pointsBalance == 0
                            ? 'No Points to Withdraw'
                            : 'Need $minimumWithdrawalPoints pts minimum (you have $pointsBalance)',
                    onPressed: canWithdraw
                        ? () => ref.read(withdrawPointsProvider.notifier).call()
                        : null,
                  ),
                  32.verticalSpace,

                  // Referral list
                  if (referralState.isLoading)
                    Column(
                      children: List.generate(
                        3,
                        (_) => Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: SkeletonLoader(width: double.infinity, height: 56.h),
                        ),
                      ),
                    )
                  else if (referrals.isEmpty)
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        child: Text(
                          'You have no referrals yet',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.svgIconColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    )
                  else
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your Referrals',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        12.verticalSpace,
                        ...referrals.map(
                          (r) => Container(
                            margin: EdgeInsets.only(bottom: 10.h),
                            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                            decoration: BoxDecoration(
                              color: PPaymobileColors.deepBackgroundColor,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 20.r,
                                  backgroundColor: PPaymobileColors.backgroundColor,
                                  child: Text(
                                    r.name.isNotEmpty ? r.name[0].toUpperCase() : '?',
                                    style: TextStyle(
                                      fontFamily: 'InstrumentSans',
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                12.horizontalSpace,
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        r.name,
                                        style: TextStyle(
                                          fontFamily: 'InstrumentSans',
                                          color: Colors.black,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      2.verticalSpace,
                                      Text(
                                        formatDate(r.joinedAt),
                                        style: TextStyle(
                                          fontFamily: 'InstrumentSans',
                                          color: PPaymobileColors.svgIconColor,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                                  decoration: BoxDecoration(
                                    color: r.pointsAwarded
                                        ? Colors.green.shade50
                                        : Colors.orange.shade50,
                                    borderRadius: BorderRadius.circular(4.r),
                                  ),
                                  child: Text(
                                    r.pointsAwarded ? 'Points Earned' : 'Pending',
                                    style: TextStyle(
                                      fontFamily: 'InstrumentSans',
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w600,
                                      color: r.pointsAwarded
                                          ? Colors.green.shade700
                                          : Colors.orange.shade700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  24.verticalSpace,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StepRow extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool showConnector;

  const _StepRow({
    required this.iconPath,
    required this.label,
    required this.showConnector,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 33.w,
              width: 33.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.5).r,
                border: Border.all(
                  width: 1.w,
                  color: PPaymobileColors.textfiedBorder,
                ),
              ),
              child: Center(
                child: SizedBox(
                  height: 20.w,
                  width: 20.w,
                  child: SvgPicture.asset(iconPath, fit: BoxFit.contain),
                ),
              ),
            ),
            8.horizontalSpace,
            Expanded(
              child: Text(
                label,
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
        if (showConnector)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 28.h,
                width: 1.w,
                color: PPaymobileColors.textfiedBorder,
              ),
            ),
          ),
      ],
    );
  }
}
