import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/core/di/injection.dart';
import 'package:ppay_mobile/core/services/firebase_messaging_service.dart';
import 'package:ppay_mobile/module/auth/presentation/providers/auth_providers.dart';
import 'package:ppay_mobile/module/dashboard/providers/balance_visibility_provider.dart';
import 'package:ppay_mobile/module/dashboard/providers/wallet_provider.dart';
import 'package:ppay_mobile/module/notification/presentation/providers/notification_providers.dart';
import 'package:ppay_mobile/module/transaction/domain/entities/transaction_entity.dart';
import 'package:ppay_mobile/module/transaction/presentation/providers/transaction_providers.dart';
import 'package:ppay_mobile/shared/utils/amount_formatter.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/create_pin_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/empty_state.dart';
import 'package:ppay_mobile/shared/widgets/feature_icon_button.dart';
import 'package:ppay_mobile/shared/widgets/kyc_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/section_header.dart';
import 'package:ppay_mobile/shared/widgets/skeleton_loader.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ppay_mobile/shared/widgets/wallet_detail_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/withdrawal_bottomsheet.dart';

@RoutePage()
class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authenticatedUserProvider).value;

    // Request notification permission once on first dashboard visit
    useEffect(() {
      getIt<FirebaseMessagingService>().requestPermission();
      return null;
    }, const []);

    // Show create-pin bottomsheet once after 1s if pin is not set
    useEffect(() {
      if (user == null || user.isPinSet) return null;
      Future.delayed(const Duration(seconds: 1), () {
        if (context.mounted) {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            isDismissible: false,
            enableDrag: false,
            backgroundColor: Colors.transparent,
            builder: (_) => const CreatePinBottomsheet(),
          );
        }
      });
      return null;
    }, [user?.isPinSet]);

    // Complete Verification: show when KYC has not been submitted yet
    final needsVerification = user != null && !user.isKycSubmitted;

    // Documents Being Reviewed: show when BOTH are submitted and not both verified
    final underReview =
        user != null &&
        user.isBvnSubmitted &&
        user.isKycSubmitted &&
        (!user.isBvnVerified || !user.isKycVerified);

    final walletAsync = ref.watch(walletProvider);
    final isBalanceVisible = ref.watch(balanceVisibilityProvider);
    final transactionAsync = ref.watch(getMyTransactionsProvider);
    final notifState = ref.watch(getMyNotificationsProvider);
    final hasUnread = (notifState.value ?? []).any((n) => n.status != 'sent');

    // Load recent transactions on first build
    useEffect(() {
      Future.microtask(
        () => ref.read(getMyTransactionsProvider.notifier).call(),
      );
      return null;
    }, []);

    final fullName = user?.fullName ?? 'User';
    final firstName = fullName.split(' ').first;

    final initials = useMemoized(() {
      final parts = fullName.trim().split(' ');
      if (parts.length >= 2)
        return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
      return fullName.isNotEmpty ? fullName[0].toUpperCase() : '?';
    }, [fullName]);

    final wallet = walletAsync.value;
    final isWalletLoading = walletAsync.isLoading;

    final isAccountVerified =
        (user?.isBvnVerified ?? false) && (user?.isKycVerified ?? false);

    String displayBalance;
    if (!isBalanceVisible) {
      displayBalance = '₦••••';
    } else if (isWalletLoading) {
      displayBalance = '₦••••';
    } else {
      final formatted = AmountFormatter.formatBalance(
        wallet?.balance ?? '0.00',
      );
      displayBalance = '₦$formatted';
    }

    return Scaffold(
      backgroundColor: PPaymobileColors.deepBackgroundColor,
      appBar: AppBar(
        backgroundColor: PPaymobileColors.mainScreenBackground,
        toolbarHeight: 80.h,
        leadingWidth: 73.w,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Hello',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                3.horizontalSpace,
                SizedBox(
                  height: 17.w,
                  width: 17.w,
                  child: Image.asset(
                    'assets/images/thumbs.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
            Text(
              firstName,
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),

        leading: SizedBox(
          child: Center(
            child: Container(
              margin: EdgeInsets.only(left: 20.w),
              height: 53.w,
              width: 53.w,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.r),
                color: PPaymobileColors.deepBackgroundColor,
              ),
              child: user?.picture != null && user!.picture!.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: user.picture!,
                      fit: BoxFit.cover,
                      width: 53.w,
                      height: 53.w,
                      errorWidget: (_, __, ___) =>
                          _InitialsAvatar(initials: initials, size: 53.w),
                      placeholder: (_, __) =>
                          _InitialsAvatar(initials: initials, size: 53.w),
                    )
                  : _InitialsAvatar(initials: initials, size: 53.w),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: TouchOpacity(
              onTap: () => context.router.push(NotificationRoute()),
              child: Container(
                height: 47.w,
                width: 47.w,
                decoration: BoxDecoration(
                  color: const Color(0xffEFF5F2).withValues(alpha: 0.62),
                  borderRadius: BorderRadius.circular(23.r),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: SizedBox(
                        height: 24.w,
                        width: 24.w,
                        child: SvgPicture.asset(
                          'assets/icon/notif.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    if (hasUnread)
                      Positioned(
                        top: 9.h,
                        left: 26.w,
                        child: SizedBox(
                          height: 9.w,
                          width: 9.w,
                          child: SvgPicture.asset(
                            'assets/icon/newnotif.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: RefreshIndicator(
          color: PPaymobileColors.buttonColor,
          onRefresh: () async {
            await Future.wait([
              ref.read(authenticatedUserProvider.notifier).call(),
              ref.read(walletProvider.notifier).fetch(),
              ref.read(getMyTransactionsProvider.notifier).call(),
              ref.read(getMyNotificationsProvider.notifier).call(),
            ]);
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                19.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  child: Container(
                    height: 223.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/images/dash.png'),
                        fit: BoxFit.contain,
                      ),
                      borderRadius: BorderRadius.circular(19.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        13.verticalSpace,
                        Padding(
                          padding: EdgeInsets.only(left: 16.0.w),
                          child: SizedBox(
                            height: 29.h,
                            width: 77.w,
                            child: Image.asset(
                              'assets/images/currency_dash.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        2.5.verticalSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Wallet Balance',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color:
                                        PPaymobileColors.mainScreenBackground,
                                  ),
                                ),
                                8.horizontalSpace,
                                TouchOpacity(
                                  onTap: () => ref
                                      .read(balanceVisibilityProvider.notifier)
                                      .toggle(),
                                  child: SizedBox(
                                    height: 25.w,
                                    width: 25.w,
                                    child: SvgPicture.asset(
                                      isBalanceVisible
                                          ? 'assets/icon/eye-slash.svg'
                                          : 'assets/icon/eye.svg',
                                      fit: BoxFit.contain,
                                      colorFilter: const ColorFilter.mode(
                                        PPaymobileColors.mainScreenBackground,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            4.verticalSpace,
                            Text(
                              displayBalance,
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                fontSize: isBalanceVisible && !isWalletLoading
                                    ? 32.sp
                                    : 28.sp,
                                fontWeight: FontWeight.w600,
                                color: PPaymobileColors.mainScreenBackground,
                              ),
                            ),
                            27.verticalSpace,
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TouchOpacity(
                                    onTap: () {
                                      if (isAccountVerified && wallet != null) {
                                        showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          builder: (_) =>
                                              WalletDetailBottomsheet(
                                                wallet: wallet,
                                              ),
                                        );
                                      } else {
                                        showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          builder: (_) =>
                                              KycBottomsheet(user: user),
                                        );
                                      }
                                    },
                                    child: SizedBox(
                                      width: 172.5.w,
                                      height: 46.h,
                                      child: Image.asset(
                                        'assets/images/fund_dash.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  TouchOpacity(
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        builder: (_) => WithdrawalBottomsheet(),
                                      );
                                    },
                                    child: SizedBox(
                                      width: 172.5.w,
                                      height: 46.h,
                                      child: Image.asset(
                                        'assets/images/transfer_dash.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                18.verticalSpace,
                SizedBox(
                  height: 88.h,
                  width: 400.w,
                  child: Image.asset(
                    'assets/images/ads.png',
                    fit: BoxFit.contain,
                  ),
                ),
                18.verticalSpace,

                // Complete Verification banner — show when tier <= 1 and nothing submitted
                if (needsVerification)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: Container(
                      height: 61.h,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 13.w,
                        vertical: 7.h,
                      ),
                      decoration: BoxDecoration(
                        color: PPaymobileColors.kyccontainerColor,
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Complete Verification',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Unlock full access to your wallet',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          TouchOpacity(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (_) => KycBottomsheet(user: user),
                              );
                            },
                            child: Container(
                              height: 36.h,
                              width: 75.w,
                              padding: EdgeInsets.symmetric(
                                horizontal: 17.w,
                                vertical: 6.h,
                              ),
                              decoration: BoxDecoration(
                                color: PPaymobileColors.mainScreenBackground,
                                borderRadius: BorderRadius.circular(9.r),
                              ),
                              child: Center(
                                child: Text(
                                  'Verify',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                // Documents under review banner — show when submitted but not yet verified
                if (underReview) ...[
                  8.verticalSpace,
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 22.w,
                      vertical: 10.h,
                    ),
                    color: PPaymobileColors.mainScreenBackground,
                    child: TouchOpacity(
                      onTap: () => context.router.push(ReviewDocumentRoute()),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 11.w,
                          vertical: 9.h,
                        ),
                        decoration: BoxDecoration(
                          color: PPaymobileColors.warningColor,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 24.w,
                              width: 24.w,
                              child: SvgPicture.asset(
                                'assets/icon/warning.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                            8.horizontalSpace,
                            Expanded(
                              child: Text(
                                'Documents are being reviewed. This usually takes 24–48 hours. Tap to view status.',
                                softWrap: true,
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                  color: PPaymobileColors.warningTextColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],

                // const PPAlert(
                //   type: PPAlertType.success,
                //   message: 'All documents are verified. You can activate your wallet by making your first deposit. Click here',
                //   showCloseButton: true,
                // ),
                // const PPAlert(
                //   type: PPAlertType.error,
                //   message: 'Documents not fully verified please click to see more details. Click here',
                //   showCloseButton: true,
                // ),
                16.verticalSpace,
                Container(
                  height: 180.h,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0.w,
                    vertical: 20.0.h,
                  ).r,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Features',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      10.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FeatureIconButton(
                            iconPath: 'assets/icon/bill.svg',
                            label: 'Bills',
                            onTap: () => context.router.push(BillsRoute()),
                          ),
                          FeatureIconButton(
                            iconPath: 'assets/icon/gift.svg',
                            label: 'Gift Cards',
                            onTap: () => context.router.push(GiftcardRoute()),
                          ),
                          FeatureIconButton(
                            iconPath: 'assets/icon/crypto.svg',
                            label: 'Crypto',
                            onTap: () => context.router.push(CryptoRoute()),
                          ),
                          FeatureIconButton(
                            iconPath: 'assets/icon/more.svg',
                            label: 'More',
                            onTap: () {
                              context.router.push(FeaturesRoute());
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                16.verticalSpace,
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 16.h,
                  ),
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      SectionHeader(
                        title: 'Transaction History',

                        // actionText: 'See all',
                      ),
                      26.verticalSpace,
                      _buildRecentTransactions(context, transactionAsync),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRecentTransactions(
    BuildContext context,
    AsyncValue<PaginatedTransactionsEntity?> state,
  ) {
    if (state.isLoading) {
      return Column(
        children: List.generate(
          3,
          (_) => Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Row(
              children: [
                SkeletonLoader(
                  width: 49.w,
                  height: 49.w,
                  borderRadius: BorderRadius.circular(100.r),
                ),
                12.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SkeletonLoader(width: 140.w, height: 14.h),
                      6.verticalSpace,
                      SkeletonLoader(width: 100.w, height: 12.h),
                    ],
                  ),
                ),
                SkeletonLoader(width: 80.w, height: 14.h),
              ],
            ),
          ),
        ),
      );
    }

    final transactions = state.value?.transactions ?? [];
    final recent = transactions.take(5).toList();

    if (recent.isEmpty) {
      return EmptyState(
        imagePath: 'assets/images/transactionimage.png',
        message: 'No Transactions Yet',
        subtitle: 'Your recent activity will appear here.',
      );
    }

    return Column(
      children: List.generate(recent.length, (index) {
        final tx = recent[index];
        return Padding(
          padding: EdgeInsets.only(bottom: index < recent.length - 1 ? 20.h : 0),
          child: GestureDetector(
            onTap: () => context.router.push(
              TransactionHistoryDetailRoute(transaction: tx),
            ),
            child: _HomeTransactionRow(transaction: tx),
          ),
        );
      }),
    );
  }
}

class _HomeTransactionRow extends StatelessWidget {
  final TransactionEntity transaction;
  const _HomeTransactionRow({required this.transaction});

  @override
  Widget build(BuildContext context) {
    final time = _formatTime(transaction.date);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 49.w,
          width: 49.w,
          decoration: BoxDecoration(
            color: _iconBg(transaction.type),
            borderRadius: BorderRadius.circular(100.r),
          ),
          child: Center(
            child: SvgPicture.asset(
              _iconPath(transaction.type),
              width: 22.w,
              height: 22.w,
              fit: BoxFit.contain,
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
        ),
        12.horizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                transaction.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.verticalSpace,
              Row(
                children: [
                  Text(
                    time,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.svgIconColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Text(
                      '·',
                      style: TextStyle(
                        color: PPaymobileColors.svgIconColor,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  Text(
                    _statusLabel(transaction.status),
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: _statusColor(transaction.status),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        12.horizontalSpace,
        Text(
          '₦${AmountFormatter.formatBalance(transaction.amount)}',
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: Colors.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  String _formatTime(DateTime date) {
    final hour = date.hour;
    final minute = date.minute.toString().padLeft(2, '0');
    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour % 12 == 0 ? 12 : hour % 12;
    return '$displayHour:$minute $period';
  }

  Color _iconBg(TransactionType type) {
    switch (type) {
      case TransactionType.walletFunding:
      case TransactionType.cardFunding:
        return PPaymobileColors.backgroundColor;
      case TransactionType.walletWithdrawal:
      case TransactionType.cardWithdrawal:
        return PPaymobileColors.transactRed;
      case TransactionType.billPayment:
        return const Color(0xFF6B4EFF);
      case TransactionType.cryptoPurchase:
      case TransactionType.cryptoSale:
      case TransactionType.cryptoDeposit:
        return const Color(0xFFF7931A);
      case TransactionType.giftcardPurchase:
      case TransactionType.giftcardSale:
        return const Color(0xFF00A86B);
      case TransactionType.shopping:
        return const Color(0xFF0066CC);
      case TransactionType.flightBooking:
        return const Color(0xFF1A1A2E);
    }
  }

  String _iconPath(TransactionType type) {
    switch (type) {
      case TransactionType.walletFunding:
      case TransactionType.cardFunding:
      case TransactionType.walletWithdrawal:
      case TransactionType.cardWithdrawal:
        return 'assets/icon/money.svg';
      case TransactionType.billPayment:
        return 'assets/icon/bill.svg';
      case TransactionType.cryptoPurchase:
      case TransactionType.cryptoSale:
      case TransactionType.cryptoDeposit:
        return 'assets/icon/crypto.svg';
      case TransactionType.giftcardPurchase:
      case TransactionType.giftcardSale:
        return 'assets/icon/gift.svg';
      case TransactionType.shopping:
      case TransactionType.flightBooking:
        return 'assets/icon/bill.svg';
    }
  }

  Color _statusColor(TransactionStatus status) {
    switch (status) {
      case TransactionStatus.successful:
        return PPaymobileColors.buttonColor;
      case TransactionStatus.failed:
        return PPaymobileColors.redTextfield;
      case TransactionStatus.pending:
        return PPaymobileColors.svgIconColor;
    }
  }

  String _statusLabel(TransactionStatus status) {
    switch (status) {
      case TransactionStatus.successful:
        return 'Successful';
      case TransactionStatus.failed:
        return 'Failed';
      case TransactionStatus.pending:
        return 'Pending';
    }
  }
}


class _InitialsAvatar extends StatelessWidget {
  final String initials;
  final double size;

  const _InitialsAvatar({required this.initials, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      color: PPaymobileColors.backgroundColor,
      child: Center(
        child: Text(
          initials,
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: PPaymobileColors.mainScreenBackground,
            fontSize: size * 0.34,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
