import 'package:flutter/material.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/module/shopping/domain/entities/shopping_entity.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';

@RoutePage()
class OrderSuccessfulPage extends HookConsumerWidget {
  final OrderEntity order;

  const OrderSuccessfulPage({super.key, required this.order});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = order.status.toLowerCase();
    final String imagePath;
    final String title;
    final String subtitle;

    if (status == 'failed') {
      imagePath = 'assets/images/cancel_1.png';
      title = 'Order Failed';
      subtitle = 'Transaction failed. There was an issue in your order. Please try again';
    } else if (status == 'pending' || status == 'processing') {
      imagePath = 'assets/images/failed_1.png';
      title = 'Order Pending';
      subtitle = 'Your order is being processed. Please wait as we process your order';
    } else {
      imagePath = 'assets/images/success1.png';
      title = 'Order Placed';
      subtitle = 'Your order has been successfully placed';
    }
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: const PPAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              122.verticalSpace,
              SizedBox(
                height: 120.w,
                width: 120.w,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                ),
              ),
              25.verticalSpace,
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              4.verticalSpace,
              Text(
                subtitle,
                textAlign: TextAlign.center,

                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.svgIconColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              220.verticalSpace,
              PPButton(
                text: 'Track Order',
                onPressed: () => context.router.push(TrackOrderRoute(orderId: order.id)),
              ),
              18.verticalSpace,
              PPButton(
                text: 'Place Another Order',
                onPressed: () => context.router.push(ShoppingRoute()),
              ),
              10.verticalSpace,
              TouchOpacity(
                onTap: () {
                  context.router.push(OrderReceiptRoute(order: order));
                },
                child: Text(
                  'Access Receipt',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.svgIconColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
