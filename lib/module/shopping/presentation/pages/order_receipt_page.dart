import 'package:flutter/material.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/module/shopping/domain/entities/shopping_entity.dart';
import 'package:ppay_mobile/shared/utils/amount_formatter.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';

@RoutePage()
class OrderReceiptPage extends HookConsumerWidget {
  final OrderEntity order;

  const OrderReceiptPage({super.key, required this.order});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = order.items ?? [];
    final address = order.shippingAddress;

    String formatDate(String iso) {
      try {
        final dt = DateTime.parse(iso).toLocal();
        return '${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')}/${dt.year}';
      } catch (_) {
        return iso;
      }
    }

    return Scaffold(
      backgroundColor: PPaymobileColors.deepBackgroundColor,
      appBar: const PPAppBar(title: 'Receipt'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              16.verticalSpace,

              // Order Details card
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 20.w, left: 16.h, right: 16.w, bottom: 30.h),
                decoration: BoxDecoration(
                  color: PPaymobileColors.mainScreenBackground,
                  borderRadius: BorderRadius.horizontal(left: Radius.circular(4).r, right: Radius.circular(4).r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Order Details', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 20.sp, fontWeight: FontWeight.w500)),
                        SizedBox(height: 38.h, width: 100.w, child: Image.asset('assets/images/status.png', fit: BoxFit.contain)),
                      ],
                    ),
                    21.verticalSpace,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 40.h, width: 44.w, child: Image.asset('assets/images/car.png', fit: BoxFit.contain)),
                        12.horizontalSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order #${order.orderNumber}', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500)),
                            Text(formatDate(order.createdAt), style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ],
                    ),
                    21.verticalSpace,

                    // Items header
                    Row(
                      children: [
                        SizedBox(
                          width: 226.w,
                          child: Text('Order', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
                        ),
                        20.horizontalSpace,
                        Text('Qty', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
                      ],
                    ),
                    15.verticalSpace,

                    // Items list
                    if (items.isEmpty)
                      Text('No items', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 14.sp))
                    else
                      ...items.map((item) => Padding(
                        padding: EdgeInsets.only(bottom: 12.h),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 226.w,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 9.h, width: 9.h, child: Image.asset('assets/images/rectangle.png', fit: BoxFit.contain)),
                                  8.horizontalSpace,
                                  Expanded(
                                    child: Text(
                                      item.product.name,
                                      style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            20.horizontalSpace,
                            Text('x${item.quantity}', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
                          ],
                        ),
                      )),

                    32.verticalSpace,

                    // Address + Date
                    Row(
                      children: [
                        SizedBox(
                          width: 226.w,
                          child: Text('Address', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
                        ),
                        20.horizontalSpace,
                        Text('Ordered Date', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
                      ],
                    ),
                    15.verticalSpace,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 226.w,
                          child: Text(
                            address != null ? '${address.address}, ${address.state}, ${address.country}' : '—',
                            style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500),
                          ),
                        ),
                        20.horizontalSpace,
                        Text(formatDate(order.createdAt), style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ],
                ),
              ),

              15.verticalSpace,

              // Payment Details card
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 20.w, left: 16.h, right: 16.w, bottom: 20.h),
                decoration: BoxDecoration(
                  color: PPaymobileColors.mainScreenBackground,
                  borderRadius: BorderRadius.horizontal(left: Radius.circular(4).r, right: Radius.circular(4).r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Payment Details', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 20.sp, fontWeight: FontWeight.w500)),
                    18.verticalSpace,
                    _PaymentRow(label: 'Subtotal:', value: '₦${AmountFormatter.formatBalance(order.subtotal.toStringAsFixed(2))}'),
                    19.verticalSpace,
                    _PaymentRow(label: 'Delivery Fee:', value: '₦${AmountFormatter.formatBalance(order.deliveryFee.toStringAsFixed(2))}'),
                    if (order.discount > 0) ...[
                      19.verticalSpace,
                      _PaymentRow(
                        label: 'Discount:',
                        value: '-₦${AmountFormatter.formatBalance(order.discount.toStringAsFixed(2))}',
                        valueColor: PPaymobileColors.buttonColor,
                      ),
                    ],
                    13.verticalSpace,
                    Divider(color: PPaymobileColors.filterBorderColor, height: 1.w),
                    18.verticalSpace,
                    _PaymentRow(
                      label: 'Total:',
                      value: '₦${AmountFormatter.formatBalance(order.total.toStringAsFixed(2))}',
                      isBold: true,
                    ),
                  ],
                ),
              ),

              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}

class _PaymentRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;
  final Color? valueColor;

  const _PaymentRow({required this.label, required this.value, this.isBold = false, this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: isBold ? 18.sp : 16.sp, fontWeight: isBold ? FontWeight.w600 : FontWeight.w500)),
        Text(value, style: TextStyle(fontFamily: 'InstrumentSans', color: valueColor ?? Colors.black, fontSize: isBold ? 18.sp : 16.sp, fontWeight: isBold ? FontWeight.w600 : FontWeight.w500)),
      ],
    );
  }
}
