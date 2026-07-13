import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/module/shopping/presentation/providers/shopping_providers.dart';
import 'package:ppay_mobile/shared/utils/amount_formatter.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

class YourCartBottomsheet extends HookConsumerWidget {
  const YourCartBottomsheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(getCartProvider);

    useEffect(() {
      Future.microtask(() => ref.read(getCartProvider.notifier).call());
      return null;
    }, []);

    final items = cartState.value?.items ?? [];
    final subtotal = items.fold<double>(0, (sum, item) {
      final price = item.product.discountPrice ?? item.product.price;
      return sum + (price * item.quantity);
    });
    const deliveryFee = 6500.0;
    const discount = 1200.0;
    final total = subtotal + deliveryFee - discount;

    return FractionallySizedBox(
      heightFactor: 0.880,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          TouchOpacity(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 60.w,
              width: 60.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30).r,
                color: PPaymobileColors.mainScreenBackground,
              ),
              child: SizedBox(
                height: 18.h,
                width: 18.h,
                child: SvgPicture.asset('assets/icon/cancel.svg', fit: BoxFit.scaleDown),
              ),
            ),
          ),
          10.verticalSpace,
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 20.w, top: 29.h, right: 20.w),
              width: double.infinity,
              decoration: BoxDecoration(
                color: PPaymobileColors.mainScreenBackground,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Cart',
                    style: TextStyle(fontFamily: 'InstrumentSans', fontWeight: FontWeight.w500, fontSize: 24.sp, color: Colors.black),
                  ),
                  16.verticalSpace,
                  Expanded(
                    child: cartState.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : items.isEmpty
                            ? Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.shopping_cart_outlined, size: 64.w, color: PPaymobileColors.svgIconColor),
                                    16.verticalSpace,
                                    Text('Your cart is empty', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 16.sp)),
                                  ],
                                ),
                              )
                            : ListView.separated(
                                itemCount: items.length,
                                separatorBuilder: (_, __) => 20.verticalSpace,
                                itemBuilder: (context, index) {
                                  final item = items[index];
                                  final price = item.product.discountPrice ?? item.product.price;
                                  final imageUrl = item.product.images?.isNotEmpty == true ? item.product.images!.first.url : null;
                                  return Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 80.w,
                                        height: 80.h,
                                        decoration: BoxDecoration(
                                          color: PPaymobileColors.deepBackgroundColor,
                                          borderRadius: BorderRadius.circular(4.r),
                                        ),
                                        child: imageUrl != null
                                            ? ClipRRect(
                                                borderRadius: BorderRadius.circular(4.r),
                                                child: CachedNetworkImage(
                                                  imageUrl: imageUrl,
                                                  fit: BoxFit.cover,
                                                  errorWidget: (_, __, ___) => Icon(Icons.shopping_bag_outlined, color: PPaymobileColors.svgIconColor, size: 32.w),
                                                ),
                                              )
                                            : Center(child: Icon(Icons.shopping_bag_outlined, color: PPaymobileColors.svgIconColor, size: 32.w)),
                                      ),
                                      12.horizontalSpace,
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    item.product.name,
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(fontFamily: 'InstrumentSans', fontWeight: FontWeight.w500, fontSize: 14.sp, color: Colors.black),
                                                  ),
                                                ),
                                                TouchOpacity(
                                                  onTap: () async {
                                                    await ref.read(removeFromCartProvider.notifier).call(item.id);
                                                    ref.read(getCartProvider.notifier).call();
                                                  },
                                                  child: SizedBox(height: 20.w, width: 20.w, child: SvgPicture.asset('assets/icon/cancel.svg', fit: BoxFit.contain)),
                                                ),
                                              ],
                                            ),
                                            if (item.variant != null) ...[
                                              4.verticalSpace,
                                              Text(
                                                item.variant!.attributes.entries.map((e) => '${e.key}: ${e.value}').join(', '),
                                                style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 11.sp),
                                              ),
                                            ],
                                            8.verticalSpace,
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  '₦${AmountFormatter.formatBalance((price * item.quantity).toStringAsFixed(2))}',
                                                  style: TextStyle(fontFamily: 'InstrumentSans', fontWeight: FontWeight.w500, fontSize: 16.sp, color: Colors.black),
                                                ),
                                                Row(
                                                  children: [
                                                    _QtyButton(
                                                      icon: 'assets/icon/minus.svg',
                                                      onTap: item.quantity > 1
                                                          ? () async {
                                                              await ref.read(updateCartItemProvider.notifier).call(cartItemId: item.id, quantity: item.quantity - 1);
                                                              ref.read(getCartProvider.notifier).call();
                                                            }
                                                          : null,
                                                    ),
                                                    12.horizontalSpace,
                                                    Text('${item.quantity}', style: TextStyle(fontFamily: 'InstrumentSans', fontWeight: FontWeight.w500, fontSize: 16.sp, color: Colors.black)),
                                                    12.horizontalSpace,
                                                    _QtyButton(
                                                      icon: 'assets/icon/add.svg',
                                                      onTap: () async {
                                                        await ref.read(updateCartItemProvider.notifier).call(cartItemId: item.id, quantity: item.quantity + 1);
                                                        ref.read(getCartProvider.notifier).call();
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                  ),
                  if (items.isNotEmpty) ...[
                    16.verticalSpace,
                    Divider(color: PPaymobileColors.deepBackgroundColor, height: 1.h),
                    16.verticalSpace,
                    _SummaryRow(label: 'Subtotal', value: '₦${AmountFormatter.formatBalance(subtotal.toStringAsFixed(2))}'),
                    8.verticalSpace,
                    _SummaryRow(label: 'Delivery Fee', value: '₦${AmountFormatter.formatBalance(deliveryFee.toStringAsFixed(2))}'),
                    8.verticalSpace,
                    _SummaryRow(label: 'Discount', value: '-₦${AmountFormatter.formatBalance(discount.toStringAsFixed(2))}'),
                    12.verticalSpace,
                    Divider(color: PPaymobileColors.deepBackgroundColor, height: 1.h),
                    12.verticalSpace,
                    _SummaryRow(
                      label: 'Total',
                      value: '₦${AmountFormatter.formatBalance(total.toStringAsFixed(2))}',
                      isBold: true,
                    ),
                    20.verticalSpace,
                    TouchOpacity(
                      onTap: () {
                        Navigator.pop(context);
                        context.router.push(CheckOutRoute());
                      },
                      child: Container(
                        height: 54.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: PPaymobileColors.buttonColorandText,
                          borderRadius: BorderRadius.circular(56).r,
                        ),
                        child: Center(
                          child: Text(
                            'Checkout',
                            style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                    20.verticalSpace,
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _QtyButton extends StatelessWidget {
  final String icon;
  final VoidCallback? onTap;

  const _QtyButton({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return TouchOpacity(
      onTap: onTap,
      child: Opacity(
        opacity: onTap == null ? 0.4 : 1.0,
        child: Container(
          height: 25.w,
          width: 25.w,
          padding: EdgeInsets.all(4).r,
          decoration: BoxDecoration(
            border: Border.all(color: PPaymobileColors.textfiedBorder, width: 1.w),
          ),
          child: SvgPicture.asset(icon, fit: BoxFit.contain),
        ),
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;

  const _SummaryRow({required this.label, required this.value, this.isBold = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontFamily: 'InstrumentSans', color: isBold ? Colors.black : PPaymobileColors.svgIconColor, fontSize: isBold ? 16.sp : 14.sp, fontWeight: isBold ? FontWeight.w600 : FontWeight.w400)),
        Text(value, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: isBold ? 16.sp : 14.sp, fontWeight: isBold ? FontWeight.w600 : FontWeight.w500)),
      ],
    );
  }
}
