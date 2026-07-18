import 'package:flutter/material.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/shopping/presentation/providers/shopping_providers.dart';
import 'package:ppay_mobile/shared/utils/amount_formatter.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';
import 'package:ppay_mobile/shared/widgets/security_pin_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/skeleton_loader.dart';

@RoutePage()
class CheckOutPage extends HookConsumerWidget {
  const CheckOutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final receiverController = useTextEditingController();
    final phoneController = useTextEditingController();
    final addressController = useTextEditingController();
    final noteController = useTextEditingController();
    final countryController = useTextEditingController(text: 'Nigeria');
    final stateController = useTextEditingController();
    final promoController = useTextEditingController();
    final cartState = ref.watch(getCartProvider);
    final createOrderState = ref.watch(createOrderProvider);
    final summaryState = ref.watch(getCheckoutSummaryProvider);
    final appliedPromo = useState<String?>(null);
    final promoLoading = useState(false);

    useEffect(() {
      Future.microtask(() => ref.read(getCartProvider.notifier).call());
      return null;
    }, []);

    final cart = cartState.value;
    final items = cart?.items ?? [];
    final subtotal = items.fold<double>(0, (sum, item) {
      final price = item.product.discountPrice ?? item.product.price;
      return sum + (price * item.quantity);
    });

    // Fetch summary whenever subtotal changes (and on first load)
    useEffect(() {
      if (subtotal > 0) {
        Future.microtask(() => ref
            .read(getCheckoutSummaryProvider.notifier)
            .call(subtotal, promoCode: appliedPromo.value));
      }
      return null;
    }, [subtotal]);

    final deliveryFee = summaryState.value?.deliveryFee ?? 0.0;
    final discount = summaryState.value?.discount ?? 0.0;
    final total = subtotal + deliveryFee - discount;

    Future<void> onApplyPromo() async {
      final code = promoController.text.trim();
      if (code.isEmpty) return;
      promoLoading.value = true;
      try {
        await ref
            .read(getCheckoutSummaryProvider.notifier)
            .call(subtotal, promoCode: code);
        final state = ref.read(getCheckoutSummaryProvider);
        if (state.hasError) {
          if (context.mounted) MessageHandler.showErrorSnackBar(context, MessageHandler.getErrorMessage(state.error));
        } else {
          appliedPromo.value = code;
          if (context.mounted) MessageHandler.showSuccessSnackBar(context, 'Promo code applied!');
        }
      } finally {
        promoLoading.value = false;
      }
    }

    void onRemovePromo() {
      appliedPromo.value = null;
      promoController.clear();
      ref.read(getCheckoutSummaryProvider.notifier).call(subtotal);
    }

    Future<void> onConfirm() async {
      if (receiverController.text.isEmpty) {
        MessageHandler.showErrorSnackBar(context, 'Enter receiver name');
        return;
      }
      if (phoneController.text.isEmpty) {
        MessageHandler.showErrorSnackBar(context, 'Enter phone number');
        return;
      }
      if (addressController.text.isEmpty) {
        MessageHandler.showErrorSnackBar(context, 'Enter delivery address');
        return;
      }
      if (stateController.text.isEmpty) {
        MessageHandler.showErrorSnackBar(context, 'Enter state');
        return;
      }
      if (items.isEmpty) {
        MessageHandler.showErrorSnackBar(context, 'Your cart is empty');
        return;
      }

      final confirmed = await showSecurityPinBottomsheet(context);
      if (!confirmed) return;

      await ref.read(createOrderProvider.notifier).call(
        receiverName: receiverController.text.trim(),
        phoneNumber: phoneController.text.trim(),
        country: countryController.text.trim(),
        orderState: stateController.text.trim(),
        address: addressController.text.trim(),
        note: noteController.text.isNotEmpty ? noteController.text.trim() : null,
        promoCode: appliedPromo.value,
        items: items.map((item) => {
          'productId': item.product.id,
          if (item.variant != null) 'variantId': item.variant!.id,
          'quantity': item.quantity,
        }).toList(),
      );

      if (!context.mounted) return;
      final state = ref.read(createOrderProvider);
      if (state.hasError) {
        MessageHandler.showErrorSnackBar(context, MessageHandler.getErrorMessage(state.error));
      } else if (state.value != null) {
        context.router.replace(OrderSuccessfulRoute(order: state.value!));
      }
    }

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(title: 'Check Out'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              42.verticalSpace,
              Text('Enter Receiver\'s Address', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w500)),
              21.verticalSpace,

              _FormField(label: 'Receiver Name', controller: receiverController, hint: 'Enter receiver name'),
              20.verticalSpace,

              Row(
                children: [
                  Expanded(child: _FormField(label: 'Country', controller: countryController, hint: 'Country')),
                  20.horizontalSpace,
                  Expanded(child: _FormField(label: 'State', controller: stateController, hint: 'State')),
                ],
              ),
              20.verticalSpace,

              _FormField(label: 'Address', controller: addressController, hint: 'Enter delivery address'),
              20.verticalSpace,

              _FormField(label: 'Phone No', controller: phoneController, hint: '+234', keyboardType: TextInputType.phone),
              20.verticalSpace,

              _FormField(label: 'Add Note', controller: noteController, hint: 'Optional', maxLines: 4),
              40.verticalSpace,

              Text('Order List', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w600)),
              32.verticalSpace,

              cartState.isLoading
                  ? SkeletonLoader(width: double.infinity, height: 100.h)
                  : items.isEmpty
                      ? Center(child: Text('Your cart is empty', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 14.sp)))
                      : Column(
                          children: items.map((item) {
                            final price = item.product.discountPrice ?? item.product.price;
                            final imageUrl = item.product.images?.isNotEmpty == true ? item.product.images!.first.url : null;
                            return Padding(
                              padding: EdgeInsets.only(bottom: 20.h),
                              child: Row(
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
                                            child: Image.network(imageUrl, fit: BoxFit.cover,
                                              errorBuilder: (_, __, ___) => Center(child: Icon(Icons.shopping_bag_outlined, color: PPaymobileColors.svgIconColor, size: 32.w))),
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
                                              child: Text(item.product.name, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500)),
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
                                        4.verticalSpace,
                                        if (item.variant != null)
                                          Text(
                                            item.variant!.attributes.entries.map((e) => '${e.key}: ${e.value}').join(', '),
                                            style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 11.sp),
                                          ),
                                        4.verticalSpace,
                                        Text('Qty: ${item.quantity}', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 12.sp)),
                                        4.verticalSpace,
                                        Text('₦${AmountFormatter.formatBalance((price * item.quantity).toStringAsFixed(2))}', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),

              if (items.isNotEmpty) ...[ 
                // Promo code input
                20.verticalSpace,
                Text('Promo Code', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500)),
                8.verticalSpace,
                if (appliedPromo.value != null)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: PPaymobileColors.doneColor,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: PPaymobileColors.buttonColor, width: 1.w),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icon/done.svg', width: 16.w, height: 16.w, colorFilter: ColorFilter.mode(PPaymobileColors.buttonColor, BlendMode.srcIn)),
                        8.horizontalSpace,
                        Expanded(
                          child: Text(
                            '${appliedPromo.value} applied — saving ₦${AmountFormatter.formatBalance(discount.toStringAsFixed(2))}',
                            style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.buttonColor, fontSize: 13.sp, fontWeight: FontWeight.w500),
                          ),
                        ),
                        TouchOpacity(
                          onTap: onRemovePromo,
                          child: Icon(Icons.close, size: 18.w, color: PPaymobileColors.buttonColor),
                        ),
                      ],
                    ),
                  )
                else
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 50.h,
                          child: TextFormField(
                            controller: promoController,
                            textCapitalization: TextCapitalization.characters,
                            decoration: InputDecoration(
                              hintText: 'Enter promo code',
                              hintStyle: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.textfieldGrey, fontSize: 14.sp),
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: PPaymobileColors.textfieldGrey, width: 1.w), borderRadius: BorderRadius.circular(6).r),
                              border: OutlineInputBorder(borderSide: BorderSide(color: PPaymobileColors.textfieldGrey, width: 1.w), borderRadius: BorderRadius.circular(6).r),
                              contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
                            ),
                          ),
                        ),
                      ),
                      10.horizontalSpace,
                      TouchOpacity(
                        onTap: promoLoading.value ? null : onApplyPromo,
                        child: Container(
                          height: 50.h,
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          decoration: BoxDecoration(
                            color: PPaymobileColors.buttonColorandText,
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Center(
                            child: promoLoading.value
                                ? SizedBox(width: 16.w, height: 16.w, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                                : Text('Apply', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w600)),
                          ),
                        ),
                      ),
                    ],
                  ),
                24.verticalSpace,
                Divider(height: 1.h, color: PPaymobileColors.deepBackgroundColor),
                16.verticalSpace,
                _SummaryRow(label: 'Subtotal', value: '₦${AmountFormatter.formatBalance(subtotal.toStringAsFixed(2))}'),
                8.verticalSpace,
                summaryState.isLoading
                    ? Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.h),
                        child: SkeletonLoader(width: double.infinity, height: 16.h, borderRadius: BorderRadius.circular(4.r)),
                      )
                    : _SummaryRow(label: 'Delivery Fee', value: '₦${AmountFormatter.formatBalance(deliveryFee.toStringAsFixed(2))}'),
                8.verticalSpace,
                if (discount > 0) ...[ 
                  _SummaryRow(label: 'Discount', value: '-₦${AmountFormatter.formatBalance(discount.toStringAsFixed(2))}', isDiscount: true),
                  8.verticalSpace,
                ],
                _SummaryRow(label: 'Total', value: '₦${AmountFormatter.formatBalance(total.toStringAsFixed(2))}', isBold: true),
                24.verticalSpace,
              ],

              PPButton(
                text: createOrderState.isLoading ? 'Processing...' : 'Confirm Payment',
                onPressed: createOrderState.isLoading ? null : onConfirm,
              ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}

class _FormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hint;
  final int maxLines;
  final TextInputType? keyboardType;

  const _FormField({
    required this.label,
    required this.controller,
    required this.hint,
    this.maxLines = 1,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500)),
        4.verticalSpace,
        SizedBox(
          height: maxLines > 1 ? null : 54.h,
          child: TextFormField(
            controller: controller,
            maxLines: maxLines,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.textfieldGrey, fontSize: 16.sp, fontWeight: FontWeight.w500),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: PPaymobileColors.textfieldGrey, width: 1.w), borderRadius: BorderRadius.circular(6).r),
              border: OutlineInputBorder(borderSide: BorderSide(color: PPaymobileColors.textfieldGrey, width: 1.w), borderRadius: BorderRadius.circular(6).r),
              contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
            ),
          ),
        ),
      ],
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;
  final bool isDiscount;

  const _SummaryRow({required this.label, required this.value, this.isBold = false, this.isDiscount = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontFamily: 'InstrumentSans', color: isBold ? Colors.black : PPaymobileColors.svgIconColor, fontSize: isBold ? 16.sp : 14.sp, fontWeight: isBold ? FontWeight.w600 : FontWeight.w400)),
        Text(value, style: TextStyle(fontFamily: 'InstrumentSans', color: isDiscount ? PPaymobileColors.buttonColor : Colors.black, fontSize: isBold ? 16.sp : 14.sp, fontWeight: isBold ? FontWeight.w600 : FontWeight.w500)),
      ],
    );
  }
}
