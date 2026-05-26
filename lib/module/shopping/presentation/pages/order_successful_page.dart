import 'package:flutter/material.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';

@RoutePage()
class OrderSuccessfulPage extends HookConsumerWidget {
  const OrderSuccessfulPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: AppBar(
        backgroundColor: PPaymobileColors.mainScreenBackground,
        toolbarHeight: 56,
        leadingWidth: 56.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: TouchOpacity(
            onTap: () => Navigator.pop(context),
            child: SizedBox(
              height: 24.w,
              width: 24.w,
              child: SvgPicture.asset(
                'assets/icon/arrow_back.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
      ),
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
                  'assets/images/success1.png', // for fail use 'assets/images/cancel_1.png' for pending use 'assets/images/failed_1.png'
                  fit: BoxFit.contain,
                ),
              ),
              25.verticalSpace,
              Text(
                'Order Placed', // for pending use Order Pending and for failed use Order Failed
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
                'Your order has been successfully placed', // for pending use 'Your order is being processed. Please wait has we process your order' and for failed use 'Transaction failed. There was an issue in your order. Please try again',
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
                onPressed: () => context.router.push(YourOrderRoute()),
              ),
              18.verticalSpace,
              PPButton(
                text: 'Place Another Order',
                onPressed: () => context.router.push(ShoppingRoute()),
              ),
              10.verticalSpace,
              // adding it but it is not in the UI and i dont know how to access the receipt screen unless i do this
              TouchOpacity(
                onTap: () {
                  context.router.push(OrderReceiptRoute());
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
