import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/module/transaction/domain/entities/transaction_entity.dart';
import 'package:ppay_mobile/module/transaction/presentation/providers/transaction_providers.dart';
import 'package:ppay_mobile/shared/utils/amount_formatter.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/empty_state.dart';
import 'package:ppay_mobile/shared/widgets/filter_transactions_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/skeleton_loader.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class CryptoTransactionsHistoryPage extends HookConsumerWidget {
  const CryptoTransactionsHistoryPage({super.key});

  static const _cryptoTypes = {
    TransactionType.cryptoPurchase,
    TransactionType.cryptoSale,
    TransactionType.cryptoDeposit,
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    final searchQuery = useState('');
    final transactionState = ref.watch(getMyTransactionsProvider);

    useEffect(() {
      Future.microtask(() => ref.read(getMyTransactionsProvider.notifier).call());
      return null;
    }, []);

    useEffect(() {
      void listener() => searchQuery.value = searchController.text.toLowerCase();
      searchController.addListener(listener);
      return () => searchController.removeListener(listener);
    }, []);

    final cryptoTransactions = useMemoized(() {
      final all = transactionState.value?.transactions ?? [];
      final filtered = all.where((t) => _cryptoTypes.contains(t.type)).toList();
      if (searchQuery.value.isEmpty) return filtered;
      return filtered.where((t) {
        return t.title.toLowerCase().contains(searchQuery.value) ||
            t.transactionId.toLowerCase().contains(searchQuery.value);
      }).toList();
    }, [transactionState.value, searchQuery.value]);

    final grouped = useMemoized(() => _groupByDate(cryptoTransactions), [cryptoTransactions]);

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(title: 'Transactions'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            37.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 51.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4).r,
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
                        hintText: 'Search',
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
                          borderRadius: BorderRadius.circular(4).r,
                        ),
                      ),
                    ),
                  ),
                ),
                12.horizontalSpace,
                TouchOpacity(
                  onTap: () async {
                    await showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => const FilterTransactionsBottomsheet(),
                    );
                  },
                  child: Container(
                    height: 51.h,
                    width: 92.w,
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.w, color: PPaymobileColors.textfiedBorder),
                      borderRadius: BorderRadius.circular(6).r,
                      color: PPaymobileColors.mainScreenBackground,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 18.w,
                          width: 18.w,
                          child: SvgPicture.asset('assets/icon/filter.svg', fit: BoxFit.contain),
                        ),
                        6.horizontalSpace,
                        Text(
                          'Filter',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            36.verticalSpace,
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
                                onPressed: () =>
                                    ref.read(getMyTransactionsProvider.notifier).call(),
                                child: const Text('Retry'),
                              ),
                            ],
                          ),
                        )
                      : cryptoTransactions.isEmpty
                          ? EmptyState(
                              imagePath: 'assets/images/transactionimage.png',
                              message: 'No Crypto Transactions',
                            )
                          : RefreshIndicator(
                              onRefresh: () async =>
                                  ref.read(getMyTransactionsProvider.notifier).call(),
                              color: PPaymobileColors.backgroundColor,
                              child: ListView.builder(
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemCount: grouped.length,
                                itemBuilder: (context, groupIndex) {
                                  final group = grouped[groupIndex];
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        group.label,
                                        style: TextStyle(
                                          fontFamily: 'InstrumentSans',
                                          color: Colors.black,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      15.verticalSpace,
                                      ListView.separated(
                                        shrinkWrap: true,
                                        physics: const NeverScrollableScrollPhysics(),
                                        separatorBuilder: (_, __) => 24.verticalSpace,
                                        itemCount: group.transactions.length,
                                        itemBuilder: (context, index) {
                                          final tx = group.transactions[index];
                                          return TouchOpacity(
                                            onTap: () => context.router.push(
                                              CryptoTransactionsDetailRoute(transaction: tx),
                                            ),
                                            child: _CryptoTransactionRow(transaction: tx),
                                          );
                                        },
                                      ),
                                      16.verticalSpace,
                                    ],
                                  );
                                },
                              ),
                            ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkeleton() {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (_, __) => Padding(
        padding: EdgeInsets.only(bottom: 24.h),
        child: Row(
          children: [
            SkeletonLoader(width: 45.w, height: 45.w, borderRadius: BorderRadius.circular(100.r)),
            5.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SkeletonLoader(width: 120.w, height: 14.h),
                  6.verticalSpace,
                  SkeletonLoader(width: 80.w, height: 12.h),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SkeletonLoader(width: 80.w, height: 14.h),
                6.verticalSpace,
                SkeletonLoader(width: 60.w, height: 12.h),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<_TxGroup> _groupByDate(List<TransactionEntity> transactions) {
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
        const months = ['', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
        label = '${months[tx.date.month]} ${tx.date.day}, ${tx.date.year}';
      }
      groups.putIfAbsent(label, () => []).add(tx);
    }

    return groups.entries.map((e) => _TxGroup(label: e.key, transactions: e.value)).toList();
  }
}

class _TxGroup {
  final String label;
  final List<TransactionEntity> transactions;
  const _TxGroup({required this.label, required this.transactions});
}

class _CryptoTransactionRow extends StatelessWidget {
  final TransactionEntity transaction;
  const _CryptoTransactionRow({required this.transaction});

  @override
  Widget build(BuildContext context) {
    final currency = (transaction.details?['currency'] as String? ?? '').toUpperCase();
    final cryptoAmount = transaction.details?['amountInCrypto']?.toString() ?? '';
    final subtitle = cryptoAmount.isNotEmpty && currency.isNotEmpty
        ? '$cryptoAmount $currency'
        : transaction.title;

    final isDeposit = transaction.type == TransactionType.cryptoDeposit;
    final isSale = transaction.type == TransactionType.cryptoSale;
    final amountColor = transaction.status == TransactionStatus.failed
        ? PPaymobileColors.redTextfield
        : isDeposit
            ? PPaymobileColors.buttonColor
            : Colors.black;
    final amountPrefix = isDeposit ? '+' : '-';
    final statusLabel = isSale ? 'Sold' : isDeposit ? 'Received' : 'Purchased';
    final statusColor = isSale
        ? PPaymobileColors.cryptoNumbersColor
        : PPaymobileColors.doneTextColor;

    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 45.w,
                width: 45.w,
                decoration: BoxDecoration(
                  color: const Color(0xFFF7931A),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    currency.isNotEmpty ? currency.substring(0, 1) : 'C',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              5.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction.title,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$amountPrefix₦${AmountFormatter.formatBalance(transaction.amount)}',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: amountColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                statusLabel,
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: statusColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
