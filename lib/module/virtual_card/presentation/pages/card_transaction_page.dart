import 'package:flutter/material.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/module/virtual_card/domain/entities/dollar_card_transaction_entity.dart';
import 'package:ppay_mobile/module/virtual_card/presentation/providers/virtual_card_providers.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class CardTransactionPage extends HookConsumerWidget {
  const CardTransactionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final txState = ref.watch(getDollarCardTransactionsProvider);
    final searchCtrl = useTextEditingController();
    final searchQuery = useState('');

    useEffect(() {
      Future.microtask(() => ref.read(getDollarCardTransactionsProvider.notifier).call());
      searchCtrl.addListener(() => searchQuery.value = searchCtrl.text.toLowerCase());
      return null;
    }, []);

    final allTx = txState.value ?? [];
    final filtered = searchQuery.value.isEmpty
        ? allTx
        : allTx.where((t) => (t.description.toLowerCase().contains(searchQuery.value) || (t.merchant.name.toLowerCase().contains(searchQuery.value)))).toList();

    String formatDate(String createdAt) {
      try {
        final dt = DateTime.parse(createdAt).toLocal();
        final now = DateTime.now();
        final today = DateTime(now.year, now.month, now.day);
        final yesterday = today.subtract(const Duration(days: 1));
        final txDay = DateTime(dt.year, dt.month, dt.day);
        if (txDay == today) return 'Today';
        if (txDay == yesterday) return 'Yesterday';
        return '${dt.day} ${_month(dt.month)}, ${dt.year}';
      } catch (_) {
        return createdAt;
      }
    }

    String formatTime(String createdAt) {
      try {
        final dt = DateTime.parse(createdAt).toLocal();
        final h = dt.hour > 12 ? dt.hour - 12 : (dt.hour == 0 ? 12 : dt.hour);
        final m = dt.minute.toString().padLeft(2, '0');
        final period = dt.hour >= 12 ? 'PM' : 'AM';
        return '${_month(dt.month)} ${dt.day}, $h:$m$period';
      } catch (_) {
        return '';
      }
    }

    // Group by date label
    final Map<String, List<DollarCardTransactionEntity>> grouped = {};
    for (final tx in filtered) {
      final label = formatDate(tx.createdAt);
      grouped.putIfAbsent(label, () => []).add(tx);
    }

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: const PPAppBar(title: 'Card Transaction'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              40.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: searchCtrl,
                      decoration: InputDecoration(
                        prefixIcon: SizedBox(height: 24.w, width: 24.w, child: SvgPicture.asset('assets/icon/bank_search.svg', fit: BoxFit.scaleDown)),
                        hintText: 'Search Transaction',
                        hintStyle: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.textfiedBorder, fontSize: 16.sp, fontWeight: FontWeight.w500),
                        filled: true,
                        fillColor: PPaymobileColors.deepBackgroundColor,
                        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
                        border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(4).r),
                      ),
                    ),
                  ),
                ],
              ),
              42.verticalSpace,
              if (txState is AsyncLoading)
                const Expanded(child: Center(child: CircularProgressIndicator()))
              else if (txState is AsyncError)
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(txState.error.toString(), textAlign: TextAlign.center, style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 14.sp)),
                        16.verticalSpace,
                        TextButton(onPressed: () => ref.read(getDollarCardTransactionsProvider.notifier).call(), child: const Text('Retry')),
                      ],
                    ),
                  ),
                )
              else if (filtered.isEmpty)
                Expanded(
                  child: Center(
                    child: Text('No transactions yet', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 16.sp, fontWeight: FontWeight.w500)),
                  ),
                )
              else
                Expanded(
                  child: ListView.builder(
                    itemCount: grouped.keys.length,
                    itemBuilder: (context, groupIndex) {
                      final dateLabel = grouped.keys.elementAt(groupIndex);
                      final txList = grouped[dateLabel]!;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(dateLabel, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
                          20.verticalSpace,
                          ...txList.map((tx) {
                            final isDebit = tx.entry == 'DEBIT';
                            return TouchOpacity(
                              onTap: () => context.router.push(TransactionDetailsRoute(transaction: tx)),
                              child: Container(
                                height: 68.h,
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(vertical: 9.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 50.w, width: 50.w,
                                          decoration: BoxDecoration(shape: BoxShape.circle, color: PPaymobileColors.deepBackgroundColor),
                                          child: Center(
                                            child: Text(
                                              tx.merchant.name.isNotEmpty ? tx.merchant.name[0].toUpperCase() : tx.description[0].toUpperCase(),
                                              style: TextStyle(fontFamily: 'InstrumentSans', fontSize: 20.sp, fontWeight: FontWeight.w600, color: PPaymobileColors.backgroundColor),
                                            ),
                                          ),
                                        ),
                                        7.horizontalSpace,
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              tx.merchant.name.isNotEmpty ? tx.merchant.name : tx.description,
                                              style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500),
                                            ),
                                            6.verticalSpace,
                                            Text(formatTime(tx.createdAt), style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 12.sp, fontWeight: FontWeight.w500)),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '${isDebit ? '-' : '+'} \$${tx.amount.toStringAsFixed(2)}',
                                      style: TextStyle(fontFamily: 'InstrumentSans', color: isDebit ? PPaymobileColors.transactRed : PPaymobileColors.doneTextColor, fontSize: 16.sp, fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                          22.verticalSpace,
                        ],
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

String _month(int m) {
  const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  return months[m - 1];
}
