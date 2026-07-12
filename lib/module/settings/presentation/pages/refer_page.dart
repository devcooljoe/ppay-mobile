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
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/skeleton_loader.dart';
import 'package:share_plus/share_plus.dart';

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

    final referralCode = referralState.value?.referralCode ?? user?.referralCode ?? '';
    final referralLink = referralState.value?.referralLink ??
        (referralCode.isNotEmpty
            ? 'https://app.pinnaclepay.ng/register?ref=$referralCode'
            : '');
    final totalReferrals = referralState.value?.totalReferrals ?? 0;
    final referrals = referralState.value?.referrals ?? [];

    void copyCode() {
      if (referralCode.isEmpty) return;
      Clipboard.setData(ClipboardData(text: referralCode));
      MessageHandler.showSuccessSnackBar(context, 'Referral code copied!');
    }

    void copyLink() {
      if (referralLink.isEmpty) return;
      Clipboard.setData(ClipboardData(text: referralLink));
      MessageHandler.showSuccessSnackBar(context, 'Referral link copied!');
    }

    void shareLink() {
      if (referralLink.isEmpty) return;
      Share.share(
        'Join me on PinnaclePay and enjoy seamless payments! Use my referral link: $referralLink',
        subject: 'Join PinnaclePay',
      );
    }

    String _formatDate(String isoDate) {
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
                          'Earn rewards for every friend you refer',
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

            // Stats card
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              decoration: BoxDecoration(
                color: PPaymobileColors.deepBackgroundColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
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
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // How it works
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 58.h,
                        width: 56.w,
                        child: Image.asset(
                          'assets/images/coins.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      10.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Get rewards by sharing with friends',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Earn for every successful referral',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: PPaymobileColors.svgIconColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  32.verticalSpace,
                  Text(
                    'Simple steps to get rewards',
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
                    label: 'Copy and share the link',
                    showConnector: true,
                  ),
                  _StepRow(
                    iconPath: 'assets/icon/signin.svg',
                    label: 'Your friends signup with your link',
                    showConnector: true,
                  ),
                  _StepRow(
                    iconPath: 'assets/icon/money.svg',
                    label: 'Get cashback for each referral',
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
                  16.verticalSpace,

                  // Referral link section
                  Text(
                    'Referral Link',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  10.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 46.h,
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          decoration: BoxDecoration(
                            color: PPaymobileColors.deepBackgroundColor,
                            border: Border.all(color: PPaymobileColors.textfiedBorder),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4.r),
                              bottomLeft: Radius.circular(4.r),
                            ),
                          ),
                          alignment: Alignment.centerLeft,
                          child: referralState.isLoading
                              ? SkeletonLoader(width: double.infinity, height: 14.h)
                              : Text(
                                  referralLink.isNotEmpty ? referralLink : '—',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: PPaymobileColors.svgIconColor,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                        ),
                      ),
                      TouchOpacity(
                        onTap: copyLink,
                        child: Container(
                          height: 46.h,
                          width: 72.w,
                          padding: EdgeInsets.all(10).r,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(4).r,
                              bottomRight: Radius.circular(4).r,
                            ),
                            color: PPaymobileColors.backgroundColor,
                          ),
                          child: Center(
                            child: Text(
                              'Copy',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: PPaymobileColors.mainScreenBackground,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  16.verticalSpace,

                  // Share button
                  TouchOpacity(
                    onTap: shareLink,
                    child: Container(
                      width: double.infinity,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: PPaymobileColors.backgroundColor,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              'assets/icon/link.svg',
                              width: 18.w,
                              height: 18.w,
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                            8.horizontalSpace,
                            Text(
                              'Share Referral Link',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: PPaymobileColors.mainScreenBackground,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 12.h),
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
                                    r.name.isNotEmpty
                                        ? r.name[0].toUpperCase()
                                        : '?',
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
                                        r.email,
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
                                Text(
                                  _formatDate(r.joinedAt),
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: PPaymobileColors.svgIconColor,
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w400,
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
            Text(
              label,
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
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
