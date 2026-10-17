import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/module/transaction/domain/entities/transaction_entity.dart';
import 'package:ppay_mobile/module/transaction/presentation/providers/transaction_providers.dart';
import 'package:ppay_mobile/module/transaction/presentation/widgets/transaction_filter.dart';
import 'package:ppay_mobile/shared/utils/amount_formatter.dart';
import 'package:ppay_mobile/shared/utils/transaction_amount_utils.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/empty_state.dart';
import 'package:ppay_mobile/shared/widgets/filter_transactions_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/skeleton_loader.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class TransactionHistoryPage extends HookConsumerWidget {
  const TransactionHistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    final searchQuery = useState('');
    final activeFilter = useState(const TransactionFilter());
    final transactionState = ref.watch(getMyTransactionsProvider);
    final isLoadingMore = useState(false);
    final hasLoadedAll = useState(false);
    final scrollController = useScrollController();

    // Initial load
    useEffect(() {
      Future.microtask(
        () => ref.read(getMyTransactionsProvider.notifier).call(),
      );
      return null;
    }, []);

    // Search listener
    useEffect(() {
      void listener() =>
          searchQuery.value = searchController.text.toLowerCase();
      searchController.addListener(listener);
      return () => searchController.removeListener(listener);
    }, []);

    // Scroll-based pagination: loads next page until all pages are fetched
    useEffect(() {
      void onScroll() {
        if (!scrollController.hasClients) return;
        final maxScroll = scrollController.position.maxScrollExtent;
        final current = scrollController.offset;
        if (current < maxScroll - 200) return;
        if (isLoadingMore.value || hasLoadedAll.value) return;

        final data = transactionState.value;
        if (data == null) return;
        if (data.pageNumber >= data.totalPages) {
          hasLoadedAll.value = true;
          return;
        }

        isLoadingMore.value = true;
        ref
            .read(getMyTransactionsProvider.notifier)
            .loadMore(data.pageNumber + 1)
            .then((_) {
              isLoadingMore.value = false;
              // Check again after loading
              final updated = ref.read(getMyTransactionsProvider).value;
              if (updated != null && updated.pageNumber >= updated.totalPages) {
                hasLoadedAll.value = true;
              }
            });
      }

      scrollController.addListener(onScroll);
      return () => scrollController.removeListener(onScroll);
    }, [transactionState.value, isLoadingMore.value, hasLoadedAll.value]);

    final allTransactions = transactionState.value?.transactions ?? [];

    // Apply search + filter client-side
    final filtered = useMemoized(() {
      var list = allTransactions;

      // Search
      if (searchQuery.value.isNotEmpty) {
        list =
            list.where((t) {
              return t.title.toLowerCase().contains(searchQuery.value) ||
                  t.transactionId.toLowerCase().contains(searchQuery.value);
            }).toList();
      }

      // Status filter
      if (activeFilter.value.status != null) {
        list =
            list.where((t) => t.status == activeFilter.value.status).toList();
      }

      // Type filter: group crypto and giftcard types together
      if (activeFilter.value.type != null) {
        list =
            list.where((t) {
              return _matchesTypeFilter(t.type, activeFilter.value.type!);
            }).toList();
      }

      // Date from
      if (activeFilter.value.dateFrom != null) {
        final from = DateTime(
          activeFilter.value.dateFrom!.year,
          activeFilter.value.dateFrom!.month,
          activeFilter.value.dateFrom!.day,
        );
        list = list.where((t) => !t.date.isBefore(from)).toList();
      }

      // Date to
      if (activeFilter.value.dateTo != null) {
        final to = DateTime(
          activeFilter.value.dateTo!.year,
          activeFilter.value.dateTo!.month,
          activeFilter.value.dateTo!.day,
          23,
          59,
          59,
        );
        list = list.where((t) => !t.date.isAfter(to)).toList();
      }

      return list;
    }, [allTransactions, searchQuery.value, activeFilter.value]);

    final grouped = useMemoized(() => _groupByDate(filtered), [filtered]);

    Future<void> onRefresh() async {
      hasLoadedAll.value = false;
      await ref.read(getMyTransactionsProvider.notifier).call();
    }

    final hasActiveFilter = !activeFilter.value.isEmpty;

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
                    child: SizedBox(
                      height: 54.h,
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
                  TouchOpacity(
                    onTap: () async {
                      final result =
                          await showModalBottomSheet<TransactionFilter>(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder:
                                (_) => FilterTransactionsBottomsheet(
                                  initialFilter: activeFilter.value,
                                ),
                          );
                      if (result != null) {
                        activeFilter.value = result;
                      }
                    },
                    child: Container(
                      height: 54.h,
                      width: 86.w,
                      padding: EdgeInsets.symmetric(
                        horizontal: 11.w,
                        vertical: 12.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(6).r,
                          bottomRight: Radius.circular(6).r,
                        ),
                        border: Border.all(
                          width: 1.w,
                          color:
                              hasActiveFilter
                                  ? PPaymobileColors.buttonColor
                                  : PPaymobileColors.filterBorderColor,
                        ),
                        color:
                            hasActiveFilter
                                ? PPaymobileColors.buttonColor.withValues(
                                  alpha: 0.08,
                                )
                                : PPaymobileColors.mainScreenBackground,
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
                                colorFilter: ColorFilter.mode(
                                  hasActiveFilter
                                      ? PPaymobileColors.buttonColor
                                      : PPaymobileColors.textfiedBorder,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                            6.horizontalSpace,
                            Text(
                              'Filter',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color:
                                    hasActiveFilter
                                        ? PPaymobileColors.buttonColor
                                        : PPaymobileColors.textfiedBorder,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Active filter chips
              if (hasActiveFilter) ...[
                8.verticalSpace,
                SizedBox(
                  height: 32.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      if (activeFilter.value.type != null)
                        _FilterChip(
                          label: _typeLabel(activeFilter.value.type!),
                          onRemove:
                              () =>
                                  activeFilter.value = activeFilter.value
                                      .copyWith(type: null),
                        ),
                      if (activeFilter.value.status != null)
                        _FilterChip(
                          label: _statusLabel(activeFilter.value.status!),
                          onRemove:
                              () =>
                                  activeFilter.value = activeFilter.value
                                      .copyWith(status: null),
                        ),
                      if (activeFilter.value.dateFrom != null)
                        _FilterChip(
                          label:
                              'From ${_formatDate(activeFilter.value.dateFrom!)}',
                          onRemove:
                              () =>
                                  activeFilter.value = activeFilter.value
                                      .copyWith(dateFrom: null),
                        ),
                      if (activeFilter.value.dateTo != null)
                        _FilterChip(
                          label:
                              'To ${_formatDate(activeFilter.value.dateTo!)}',
                          onRemove:
                              () =>
                                  activeFilter.value = activeFilter.value
                                      .copyWith(dateTo: null),
                        ),
                    ],
                  ),
                ),
              ],
              16.verticalSpace,
              Expanded(
                child:
                    transactionState.isLoading && allTransactions.isEmpty
                        ? _buildSkeleton()
                        : transactionState.hasError && allTransactions.isEmpty
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
                                onPressed:
                                    () =>
                                        ref
                                            .read(
                                              getMyTransactionsProvider
                                                  .notifier,
                                            )
                                            .call(),
                                child: const Text('Retry'),
                              ),
                            ],
                          ),
                        )
                        : filtered.isEmpty
                        ? Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 40.h),
                            child: EmptyState(
                              imagePath: 'assets/images/transactionimage.png',
                              message:
                                  hasActiveFilter ||
                                          searchQuery.value.isNotEmpty
                                      ? 'No Matching Transactions'
                                      : 'No Transactions Yet',
                              subtitle:
                                  hasActiveFilter ||
                                          searchQuery.value.isNotEmpty
                                      ? 'Try adjusting your search or filters.'
                                      : 'Your transaction history will appear here.',
                            ),
                          ),
                        )
                        : RefreshIndicator(
                          onRefresh: onRefresh,
                          color: PPaymobileColors.backgroundColor,
                          child: ListView.builder(
                            controller: scrollController,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemCount:
                                grouped.length + (isLoadingMore.value ? 1 : 0),
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
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    separatorBuilder:
                                        (_, __) => 20.verticalSpace,
                                    itemBuilder: (context, index) {
                                      final tx = group.transactions[index];
                                      return TouchOpacity(
                                        onTap:
                                            () =>
                                                _navigateToDetail(context, tx),
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

  bool _matchesTypeFilter(TransactionType type, TransactionType filter) {
    switch (filter) {
      case TransactionType.cryptoPurchase:
        return type == TransactionType.cryptoPurchase ||
            type == TransactionType.cryptoSale ||
            type == TransactionType.cryptoDeposit;
      case TransactionType.giftcardPurchase:
        return type == TransactionType.giftcardPurchase ||
            type == TransactionType.giftcardSale;
      case TransactionType.walletFunding:
        return type == TransactionType.walletFunding ||
            type == TransactionType.cardFunding;
      case TransactionType.walletWithdrawal:
        return type == TransactionType.walletWithdrawal ||
            type == TransactionType.cardWithdrawal;
      default:
        return type == filter;
    }
  }

  Widget _buildSkeleton() {
    return ListView.builder(
      itemCount: 6,
      itemBuilder:
          (_, __) => Padding(
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
    context.router.push(TransactionHistoryDetailRoute(transaction: tx));
  }

  String _monthName(int month) {
    const months = [
      '',
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return months[month];
  }

  String _formatDate(DateTime d) =>
      '${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')}/${d.year}';

  String _typeLabel(TransactionType type) {
    switch (type) {
      case TransactionType.walletFunding:
        return 'Wallet Funding';
      case TransactionType.walletWithdrawal:
        return 'Withdrawal';
      case TransactionType.billPayment:
        return 'Bill Payment';
      case TransactionType.cryptoPurchase:
        return 'Crypto';
      case TransactionType.giftcardPurchase:
        return 'Gift Card';
      case TransactionType.shopping:
        return 'Gift Order';
      case TransactionType.flightBooking:
        return 'Flight';
      default:
        return type.name;
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

class _TransactionGroup {
  final String label;
  final List<TransactionEntity> transactions;
  const _TransactionGroup({required this.label, required this.transactions});
}

class _FilterChip extends StatelessWidget {
  final String label;
  final VoidCallback onRemove;

  const _FilterChip({required this.label, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8.w),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: PPaymobileColors.buttonColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: PPaymobileColors.buttonColor.withValues(alpha: 0.3),
          width: 1.w,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: 'InstrumentSans',
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: PPaymobileColors.buttonColor,
            ),
          ),
          6.horizontalSpace,
          TouchOpacity(
            onTap: onRemove,
            child: Icon(
              Icons.close,
              size: 14.sp,
              color: PPaymobileColors.buttonColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _TransactionRow extends StatelessWidget {
  final TransactionEntity transaction;
  const _TransactionRow({required this.transaction});

  @override
  Widget build(BuildContext context) {
    final isCredit = transaction.type.isCredit;
    final amountColor = TransactionAmountUtils.getAmountColor(
      transaction.status,
      isCredit,
    );
    final amountPrefix = TransactionAmountUtils.getAmountPrefix(isCredit);
    final formattedAmount =
        '$amountPrefix₦${AmountFormatter.formatBalance(transaction.amount)}';
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
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
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
                      color: _statusTextColor(transaction.status),
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
          formattedAmount,
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: amountColor,
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
      case TransactionType.cardTermination:
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
      case TransactionType.cardTermination:
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
