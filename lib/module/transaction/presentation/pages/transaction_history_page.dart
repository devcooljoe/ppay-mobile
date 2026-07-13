import 'package:flutter/material.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/module/transaction/domain/entities/transaction_entity.dart';
import 'package:ppay_mobile/module/transaction/presentation/providers/transaction_providers.dart';
import 'package:ppay_mobile/shared/utils/amount_formatter.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/empty_state.dart';
import 'package:ppay_mobile/shared/widgets/skeleton_loader.dart';

@RoutePage()
class TransactionHistoryPage extends HookConsumerWidget {
  const TransactionHistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    final searchQuery = useState('');
    final transactionState = ref.watch(getMyTransactionsProvider);
    final isLoadingMore = useState(false);
    final scrollController = useScrollController();

    useEffect(() {
      Future.microtask(() => ref.read(getMyTransactionsProvider.notifier).call());
      return null;
    }, []);

    useEffect(() {
      void listener() => searchQuery.value = searchController.text.toLowerCase();
      searchController.addListener(listener);
      return () => searchController.removeListener(listener);
    }, []);

    // Pagination: load more when near bottom
    useEffect(() {
      void onScroll() {
        if (!scrollController.hasClients) return;
        final maxScroll = scrollController.position.maxScrollExtent;
        final current = scrollController.offset;
        if (current >= maxScroll - 200 && !isLoadingMore.value) {
          final data = transactionState.value;
          if (data != null && data.pageNumber < data.totalPages) {
            isLoadingMore.value = true;
            ref
                .read(getMyTransactionsProvider.notifier)
                .loadMore(data.pageNumber + 1)
                .then((_) => isLoadingMore.value = false);
          }
        }
      }

      scrollController.addListener(onScroll);
      return () => scrollController.removeListener(onScroll);
    }, [transactionState.value]);

    final allTransactions = transactionState.value?.transactions ?? [];

    final filtered = useMemoized(() {
      if (searchQuery.value.isEmpty) return allTransactions;
      return allTransactions.where((t) {
        return t.title.toLowerCase().contains(searchQuery.value) ||
            t.transactionId.toLowerCase().contains(searchQuery.value);
      }).toList();
    }, [allTransactions, searchQuery.value]);

    final grouped = useMemoized(() => _groupByDate(filtered), [filtered]);

    Future<void> onRefresh() async {
      await ref.read(getMyTransactionsProvider.notifier).call();
    }

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: const PPAppBar(title: 'Transaction History', showLeading: false),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              42.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 54.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4).r,
                          bottomLeft: Radius.circular(4).r,
                        ),
                      ),
                      child: TextFormField(
                        controller: searchController,
                        decoration: InputDecoration(
                          prefixIcon: SizedBox(
                            height: 24.w,
                            width: 24.w,
                            child: SvgPicture.asset(
                              'assets/icon/bank_search.svg',
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          hintText: 'Search Transaction',
                          hintStyle: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.textfiedBorder,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          filled: true,
                          fillColor: PPaymobileColors.deepBackgroundColor,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 14.h,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4).r,
                              bottomLeft: Radius.circular(4).r,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 54.h,
                    width: 86.w,
                    padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 12.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(6).r,
                        bottomRight: Radius.circular(6).r,
                      ),
                      border: Border.all(
                        width: 1.w,
                        color: PPaymobileColors.filterBorderColor,
                      ),
                      color: PPaymobileColors.mainScreenBackground,
                    ),
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 14.w,
                            width: 14.w,
                            child: SvgPicture.asset(
                              'assets/icon/filter.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                          6.horizontalSpace,
                          Text(
                            'Filter',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: PPaymobileColors.textfiedBorder,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              16.verticalSpace,
              Expanded(
                child: transactionState.isLoading
                    ? _buildSkeleton()
                    : transactionState.hasError
                        ? Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Failed to load transactions',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: PPaymobileColors.svgIconColor,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                16.verticalSpace,
                                TextButton(
                                  onPressed: () => ref
                                      .read(getMyTransactionsProvider.notifier)
                                      .call(),
                                  child: const Text('Retry'),
                                ),
                              ],
                            ),
                          )
                        : filtered.isEmpty
                            ? EmptyState(
                                imagePath: 'assets/images/transactionimage.png',
                                message: 'No Transactions Found',
                              )
                            : RefreshIndicator(
                                onRefresh: onRefresh,
                                color: PPaymobileColors.backgroundColor,
                                child: ListView.builder(
                                  controller: scrollController,
                                  physics: const AlwaysScrollableScrollPhysics(),
                                  itemCount: grouped.length + (isLoadingMore.value ? 1 : 0),
                                  itemBuilder: (context, groupIndex) {
                                    if (groupIndex == grouped.length) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(vertical: 16.h),
                                        child: Center(
                                          child: SizedBox(
                                            height: 24.w,
                                            width: 24.w,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                              color: PPaymobileColors.backgroundColor,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    final group = grouped[groupIndex];
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        24.verticalSpace,
                                        Text(
                                          group.label,
                                          style: TextStyle(
                                            fontFamily: 'InstrumentSans',
                                            color: Colors.black,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        20.verticalSpace,
                                        ListView.separated(
                                          itemCount: group.transactions.length,
                                          shrinkWrap: true,
                                          physics: const NeverScrollableScrollPhysics(),
                                          separatorBuilder: (_, __) => 20.verticalSpace,
                                          itemBuilder: (context, index) {
                                            final tx = group.transactions[index];
                                            return GestureDetector(
                                              onTap: () => _navigateToDetail(context, tx),
                                              child: _TransactionRow(transaction: tx),
                                            );
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkeleton() {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (_, __) => Padding(
        padding: EdgeInsets.only(bottom: 20.h),
        child: Row(
          children: [
            SkeletonLoader(width: 49.w, height: 49.w, borderRadius: BorderRadius.circular(100.r)),
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
    );
  }

  List<_TransactionGroup> _groupByDate(List<TransactionEntity> transactions) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    final Map<String, List<TransactionEntity>> groups = {};

    for (final tx in transactions) {
      final txDate = DateTime(tx.date.year, tx.date.month, tx.date.day);
      String label;
      if (txDate == today) {
        label = 'Today';
      } else if (txDate == yesterday) {
        label = 'Yesterday';
      } else {
        label = '${_monthName(tx.date.month)} ${tx.date.day}, ${tx.date.year}';
      }
      groups.putIfAbsent(label, () => []).add(tx);
    }

    return groups.entries
        .map((e) => _TransactionGroup(label: e.key, transactions: e.value))
        .toList();
  }

  void _navigateToDetail(BuildContext context, TransactionEntity tx) {
    switch (tx.type) {
      case TransactionType.giftcardPurchase:
        context.router.push(BuyGiftcardRoute(transaction: tx));
        break;
      case TransactionType.giftcardSale:
        context.router.push(SellGiftcardRoute(transaction: tx));
        break;
      default:
        context.router.push(TransactionHistoryDetailRoute(transaction: tx));
    }
  }

  String _monthName(int month) {
    const months = [
      '', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month];
  }
}

class _TransactionGroup {
  final String label;
  final List<TransactionEntity> transactions;
  const _TransactionGroup({required this.label, required this.transactions});
}

class _TransactionRow extends StatelessWidget {
  final TransactionEntity transaction;
  const _TransactionRow({required this.transaction});

  @override
  Widget build(BuildContext context) {
    final isCredit = transaction.type.isCredit;
    final amountColor = _statusColor(transaction.status, isCredit);
    final amountPrefix = isCredit ? '+' : '-';
    final formattedAmount =
        '$amountPrefix₦${AmountFormatter.formatBalance(transaction.amount)}';

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
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
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
      ),
      title: Text(
        transaction.title,
        style: TextStyle(
          fontFamily: 'InstrumentSans',
          color: Colors.black,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        _statusLabel(transaction.status),
        style: TextStyle(
          fontFamily: 'InstrumentSans',
          color: _statusTextColor(transaction.status),
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Text(
        formattedAmount,
        style: TextStyle(
          fontFamily: 'InstrumentSans',
          color: amountColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
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
        return 'assets/icon/money.svg';
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
        return 'assets/icon/bill.svg';
      case TransactionType.flightBooking:
        return 'assets/icon/bill.svg';
    }
  }

  Color _statusColor(TransactionStatus status, bool isCredit) {
    if (status == TransactionStatus.failed) return PPaymobileColors.redTextfield;
    if (status == TransactionStatus.pending) return PPaymobileColors.svgIconColor;
    return isCredit ? PPaymobileColors.buttonColor : PPaymobileColors.redTextfield;
  }

  Color _statusTextColor(TransactionStatus status) {
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
