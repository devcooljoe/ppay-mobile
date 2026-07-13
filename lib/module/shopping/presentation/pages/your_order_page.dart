import 'package:flutter/material.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/module/shopping/domain/entities/shopping_entity.dart';
import 'package:ppay_mobile/module/shopping/presentation/providers/shopping_providers.dart';
import 'package:ppay_mobile/shared/utils/amount_formatter.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/empty_state.dart';
import 'package:ppay_mobile/shared/widgets/skeleton_loader.dart';

@RoutePage()
class YourOrderPage extends HookConsumerWidget {
  const YourOrderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFilter = useState('All');
    final ordersState = ref.watch(getOrdersProvider);

    useEffect(() {
      Future.microtask(() => ref.read(getOrdersProvider.notifier).call());
      return null;
    }, []);

    final filters = ['All', 'Pending', 'Processing', 'Delivered', 'Cancelled'];
    final orders = ordersState.value ?? [];
    final filtered = selectedFilter.value == 'All'
        ? orders
        : orders.where((o) => o.status.toLowerCase() == selectedFilter.value.toLowerCase()).toList();

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: const PPAppBar(title: 'Your Orders'),
      body: SafeArea(
        child: Column(
          children: [
            39.verticalSpace,
            SizedBox(
              height: 38.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                itemCount: filters.length,
                separatorBuilder: (_, __) => 12.horizontalSpace,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  final isSelected = selectedFilter.value == filter;
                  return GestureDetector(
                    onTap: () => selectedFilter.value = filter,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(49.r),
                        color: isSelected ? PPaymobileColors.tabColor : PPaymobileColors.mainScreenBackground,
                        border: isSelected ? null : Border.all(color: PPaymobileColors.textfiedBorder, width: 1.w),
                      ),
                      child: Text(
                        filter,
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: isSelected ? PPaymobileColors.mainScreenBackground : Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            24.verticalSpace,
            Expanded(
              child: ordersState.isLoading
                  ? ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      itemCount: 3,
                      itemBuilder: (_, __) => Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: SkeletonLoader(width: double.infinity, height: 100.h, borderRadius: BorderRadius.circular(8.r)),
                      ),
                    )
                  : ordersState.hasError
                      ? Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Failed to load orders', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 14.sp)),
                              16.verticalSpace,
                              TextButton(onPressed: () => ref.read(getOrdersProvider.notifier).call(), child: const Text('Retry')),
                            ],
                          ),
                        )
                      : filtered.isEmpty
                          ? EmptyState(imagePath: 'assets/images/transactionimage.png', message: 'No orders found')
                          : RefreshIndicator(
                              onRefresh: () async => ref.read(getOrdersProvider.notifier).call(),
                              color: PPaymobileColors.backgroundColor,
                              child: ListView.separated(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                itemCount: filtered.length,
                                separatorBuilder: (_, __) => 16.verticalSpace,
                                itemBuilder: (context, index) => _OrderCard(order: filtered[index]),
                              ),
                            ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderCard extends StatelessWidget {
  final OrderEntity order;
  const _OrderCard({required this.order});

  @override
  Widget build(BuildContext context) {
    final statusColor = _statusColor(order.status);
    return Container(
      padding: EdgeInsets.all(16).r,
      decoration: BoxDecoration(
        color: PPaymobileColors.mainScreenBackground,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: PPaymobileColors.deepBackgroundColor, width: 1.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order #${order.orderNumber}',
                style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  order.status,
                  style: TextStyle(fontFamily: 'InstrumentSans', color: statusColor, fontSize: 11.sp, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          8.verticalSpace,
          if (order.items != null && order.items!.isNotEmpty)
            Text(
              '${order.items!.length} item${order.items!.length > 1 ? 's' : ''}',
              style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 12.sp),
            ),
          8.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '₦${AmountFormatter.formatBalance(order.total.toStringAsFixed(2))}',
                style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              GestureDetector(
                onTap: () => context.router.push(TrackOrderRoute(orderId: order.id)),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    color: PPaymobileColors.buttonColorandText,
                  ),
                  child: Text('Track', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.w600)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _statusColor(String status) {
    switch (status.toLowerCase()) {
      case 'delivered': return PPaymobileColors.buttonColor;
      case 'cancelled': return PPaymobileColors.redTextfield;
      case 'pending': return const Color(0xFF856404);
      default: return PPaymobileColors.svgIconColor;
    }
  }
}
