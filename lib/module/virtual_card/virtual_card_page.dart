import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';

@RoutePage()
class VirtualCardPage extends HookConsumerWidget {
  const VirtualCardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(title: 'Virtual Card'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              28.verticalSpace,
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 12.0.w),
                    child: Container(
                      height: 256.h,
                      width: 256.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: PPaymobileColors.deepBackgroundColor,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30.h,
                    left: 26.w,
                    child: SizedBox(
                      height: 250.71.h,
                      width: 354.w,
                      child: Image.asset(
                        'assets/images/dollar_card.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
              37.verticalSpace,
              Text(
                'Spend Globally. Pay Securely. Control Everything',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.buttonColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              23.verticalSpace,
              Text(
                'Activate a virtual USD card in seconds to make international payments, shop online, subscribe to apps, and more without bank visits.',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              109.verticalSpace,
              PPButton(
                text: 'Create Dollar Card',
                onPressed: () => context.router.push(CreateVirtualCardRoute()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
