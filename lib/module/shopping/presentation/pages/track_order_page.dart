import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/module/shopping/domain/entities/shopping_entity.dart';
import 'package:ppay_mobile/module/shopping/presentation/providers/shopping_providers.dart';
import 'package:ppay_mobile/shared/utils/amount_formatter.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/skeleton_loader.dart';

@RoutePage()
class TrackOrderPage extends HookConsumerWidget {
  final String orderId;

  const TrackOrderPage({super.key, required this.orderId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderState = ref.watch(getOrderDetailsProvider);

    useEffect(() {
      Future.microtask(() => ref.read(getOrderDetailsProvider.notifier).call(orderId));
      return null;
    }, [orderId]);

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(title: 'Track Order'),
      body: SafeArea(
        child: orderState.isLoading
            ? _LoadingSkeleton()
            : orderState.hasError
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Failed to load order',
                          style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 14.sp),
                        ),
                        16.verticalSpace,
                        TextButton(
                          onPressed: () => ref.read(getOrderDetailsProvider.notifier).call(orderId),
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  )
                : orderState.value == null
                    ? const SizedBox.shrink()
                    : _OrderTrackingContent(order: orderState.value!),
      ),
    );
  }
}

class _OrderTrackingContent extends StatelessWidget {
  final OrderEntity order;

  const _OrderTrackingContent({required this.order});

  @override
  Widget build(BuildContext context) {
    final items = order.items ?? [];
    final address = order.shippingAddress;
    final tracking = order.tracking ?? [];

    // Determine the latest tracking ID if any
    final latestTracking = tracking.isNotEmpty ? tracking.last : null;
    final trackingId = latestTracking?.trackingId;

    // Determine expected delivery date (7 days from order creation)
    String expectedDelivery = '';
    try {
      final created = DateTime.parse(order.createdAt);
      final delivery = created.add(const Duration(days: 7));
      const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
      expectedDelivery = '${_ordinal(delivery.day)} ${months[delivery.month - 1]}, ${delivery.year}';
    } catch (_) {}

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: ListView(
        children: [
          46.verticalSpace,

          // Items
          if (items.isNotEmpty) ...[
            ...items.map((item) => Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 92.h,
                    width: 92.w,
                    decoration: BoxDecoration(
                      color: PPaymobileColors.deepBackgroundColor,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Center(
                      child: Icon(Icons.shopping_bag_outlined, color: PPaymobileColors.svgIconColor, size: 36.w),
                    ),
                  ),
                  12.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.product.name,
                          style: TextStyle(fontFamily: 'InstrumentSans', fontWeight: FontWeight.w500, fontSize: 16.sp, color: Colors.black),
                        ),
                        6.verticalSpace,
                        Text(
                          'Qty: ${item.quantity}',
                          style: TextStyle(fontFamily: 'InstrumentSans', fontWeight: FontWeight.w400, fontSize: 12.sp, color: PPaymobileColors.svgIconColor),
                        ),
                        6.verticalSpace,
                        Text(
                          '₦${AmountFormatter.formatBalance((item.price * item.quantity).toStringAsFixed(2))}',
                          style: TextStyle(fontFamily: 'InstrumentSans', fontWeight: FontWeight.w500, fontSize: 18.sp, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
            23.verticalSpace,
            Divider(color: PPaymobileColors.filterBorderColor, height: 1.h),
            30.verticalSpace,
          ],

          // Order Details
          Text('Order Details', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w500)),
          20.verticalSpace,
          if (expectedDelivery.isNotEmpty)
            _DetailRow(label: 'Expected Delivery Date:', value: expectedDelivery),
          if (trackingId != null && trackingId.isNotEmpty) ...[
            16.verticalSpace,
            _DetailRow(label: 'Tracking ID:', value: trackingId),
          ],
          16.verticalSpace,
          _DetailRow(label: 'Order #:', value: order.orderNumber),
          17.verticalSpace,
          Divider(color: PPaymobileColors.filterBorderColor, height: 1.h),
          30.verticalSpace,

          // Address
          if (address != null) ...[
            Text('Address', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w500)),
            20.verticalSpace,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 35.w, width: 35.w, child: Image.asset('assets/images/location.png', fit: BoxFit.contain)),
                10.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(address.country, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500)),
                      9.verticalSpace,
                      Text(
                        '${address.address}, ${address.state}',
                        style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500),
                      ),
                      4.verticalSpace,
                      Text(address.receiverName, style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 13.sp, fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
              ],
            ),
            17.verticalSpace,
            Divider(color: PPaymobileColors.filterBorderColor, height: 1.h),
            43.verticalSpace,
          ],

          // Order Status Timeline
          Text('Order Status', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w500)),
          24.verticalSpace,
          _StatusTimeline(orderStatus: order.status, tracking: tracking),
          108.verticalSpace,
        ],
      ),
    );
  }

  String _ordinal(int day) {
    if (day >= 11 && day <= 13) return '${day}th';
    switch (day % 10) {
      case 1: return '${day}st';
      case 2: return '${day}nd';
      case 3: return '${day}rd';
      default: return '${day}th';
    }
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 14.sp, fontWeight: FontWeight.w500)),
        Text(value, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w600)),
      ],
    );
  }
}

class _StatusTimeline extends StatelessWidget {
  final String orderStatus;
  final List<OrderTrackingEntity> tracking;

  const _StatusTimeline({required this.orderStatus, required this.tracking});

  static const _steps = ['pending', 'processing', 'shipped', 'delivered'];

  int get _currentStepIndex {
    final idx = _steps.indexOf(orderStatus.toLowerCase());
    return idx == -1 ? 0 : idx;
  }

  String _trackingDateFor(String stepStatus) {
    try {
      final match = tracking.lastWhere(
        (t) => t.status.toLowerCase() == stepStatus.toLowerCase(),
        orElse: () => tracking.first,
      );
      final dt = DateTime.parse(match.createdAt).toLocal();
      const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
      return '${dt.day} ${months[dt.month - 1]}, ${dt.year}';
    } catch (_) {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentIdx = _currentStepIndex;
    final stepLabels = ['Order Placed', 'Processing', 'Shipped', 'Delivered'];
    final stepStatuses = ['pending', 'processing', 'shipped', 'delivered'];
    final stepIcons = ['assets/icon/package.svg', 'assets/icon/process.svg', 'assets/icon/delivery_truck_1.svg', 'assets/icon/delivered_1.svg'];
    final stepIconsDone = ['assets/icon/package.svg', 'assets/icon/process.svg', 'assets/icon/delivery_truck.svg', 'assets/icon/delivered.svg'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(_steps.length, (i) {
        final isDone = i <= currentIdx;
        final dateStr = isDone && tracking.isNotEmpty ? _trackingDateFor(stepStatuses[i]) : '';
        final isLast = i == _steps.length - 1;

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 36.w,
                      width: 36.w,
                      child: Image.asset(
                        isDone ? 'assets/images/big_check.png' : 'assets/images/big_check_1.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    17.horizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(stepLabels[i], style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500)),
                        if (dateStr.isNotEmpty) ...[
                          1.verticalSpace,
                          Text(dateStr, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w500)),
                        ],
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 24.w,
                  width: 24.w,
                  child: SvgPicture.asset(isDone ? stepIconsDone[i] : stepIcons[i], fit: BoxFit.contain),
                ),
              ],
            ),
            if (!isLast)
              Container(
                width: 37.w,
                height: 52.h,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Container(
                  height: 52.h,
                  width: 5.w,
                  color: isDone ? PPaymobileColors.buttonColor : PPaymobileColors.deepBackgroundColor,
                ),
              ),
          ],
        );
      }),
    );
  }
}

class _LoadingSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          46.verticalSpace,
          Row(
            children: [
              SkeletonLoader(width: 92.w, height: 92.h, borderRadius: BorderRadius.circular(4.r)),
              12.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SkeletonLoader(width: 160.w, height: 16.h, borderRadius: BorderRadius.circular(4.r)),
                    8.verticalSpace,
                    SkeletonLoader(width: 80.w, height: 12.h, borderRadius: BorderRadius.circular(4.r)),
                    8.verticalSpace,
                    SkeletonLoader(width: 100.w, height: 18.h, borderRadius: BorderRadius.circular(4.r)),
                  ],
                ),
              ),
            ],
          ),
          30.verticalSpace,
          SkeletonLoader(width: 140.w, height: 20.h, borderRadius: BorderRadius.circular(4.r)),
          20.verticalSpace,
          SkeletonLoader(width: double.infinity, height: 14.h, borderRadius: BorderRadius.circular(4.r)),
          16.verticalSpace,
          SkeletonLoader(width: double.infinity, height: 14.h, borderRadius: BorderRadius.circular(4.r)),
        ],
      ),
    );
  }
}
