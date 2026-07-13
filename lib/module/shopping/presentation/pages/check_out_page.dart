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
    final cartState = ref.watch(getCartProvider);
    final createOrderState = ref.watch(createOrderProvider);

    useEffect(() {
      Future.microtask(() => ref.read(getCartProvider.notifier).call());
      return null;
    }, []);

    final cart = cartState.value;
    final items = cart?.items ?? [];
    final subtotal = items.fold<double>(0, (sum, item) => sum + (item.price * item.quantity));
    final deliveryFee = 2500.0;
    final total = subtotal + deliveryFee;

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
        items: items.map((item) => {
          'productId': item.productId,
          if (item.variantId != null) 'variantId': item.variantId,
          'quantity': item.quantity,
        }).toList(),
      );

      if (!context.mounted) return;
      final state = ref.read(createOrderProvider);
      if (state.hasError) {
        MessageHandler.showErrorSnackBar(context, state.error.toString());
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
                          children: items.map((item) => Padding(
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
                                  child: Center(child: Icon(Icons.shopping_bag_outlined, color: PPaymobileColors.svgIconColor, size: 32.w)),
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
                                            onTap: () => ref.read(removeFromCartProvider.notifier).call(item.id),
                                            child: SizedBox(height: 20.w, width: 20.w, child: SvgPicture.asset('assets/icon/cancel.svg', fit: BoxFit.contain)),
                                          ),
                                        ],
                                      ),
                                      4.verticalSpace,
                                      Text('Qty: ${item.quantity}', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 12.sp)),
                                      4.verticalSpace,
                                      Text('₦${AmountFormatter.formatBalance((item.price * item.quantity).toStringAsFixed(2))}', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )).toList(),
                        ),

              if (items.isNotEmpty) ...[
                Divider(height: 1.h, color: PPaymobileColors.deepBackgroundColor),
                16.verticalSpace,
                _SummaryRow(label: 'Subtotal', value: '₦${AmountFormatter.formatBalance(subtotal.toStringAsFixed(2))}'),
                8.verticalSpace,
                _SummaryRow(label: 'Delivery Fee', value: '₦${AmountFormatter.formatBalance(deliveryFee.toStringAsFixed(2))}'),
                8.verticalSpace,
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
