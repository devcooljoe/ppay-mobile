import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/create_pin_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';

@RoutePage()
class KycVerificationCompletePage extends HookConsumerWidget {
  const KycVerificationCompletePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      body: ListView(
        children: [
          91.verticalSpace,
          SizedBox(
            height: 158.w,
            width: 158.w,
            child: Image.asset(
              'assets/images/complete.png',
              fit: BoxFit.contain,
            ),
          ),
          15.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0).w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Verification Complete',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: Colors.black,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                4.verticalSpace,
                Text(
                  'You have successfully completed your account verification, a confirmation email will be sent to you once your documents are verified',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.svgIconColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                48.verticalSpace,
                PPButton(
                  text: 'Set Up Biometric',
                  onPressed: () async {
                    await context.router.pushAndPopUntil(
                      ExploreRoute(),
                      predicate: (route) => false,
                    );

                    if (context.mounted) {
                      Future.delayed(const Duration(milliseconds: 300), () {
                        if (context.mounted) {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (_) => const CreatePinBottomsheet(),
                          );
                        }
                      });
                    }
                  },
                  backgroundColor: PPaymobileColors.backgroundColor,
                ),
                20.verticalSpace,
                PPButton(
                  text: 'Go To Dashboard',
                  onPressed: () {
                    context.router.pushAndPopUntil(ExploreRoute(), predicate: (route) => false);
                  },
                  backgroundColor: PPaymobileColors.mainScreenBackground,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
