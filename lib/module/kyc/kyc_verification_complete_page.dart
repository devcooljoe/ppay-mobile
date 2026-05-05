import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/create_pin_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

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
                TouchOpacity(
                  child: SizedBox(
                    width: double.infinity,
                    height: 50.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: PPaymobileColors.backgroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(42.r),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () async {
                        // ignore: use_build_context_synchronously
                        await context.router.pushAndPopUntil(
                          ExploreRoute(),
                          predicate: (route) => false,
                        );

                        // 🔥 wait for navigation, then show bottom sheet
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

                      child: Text(
                        'Set Up Biometric',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                20.verticalSpace,
                TouchOpacity(
                  child: SizedBox(
                    width: double.infinity,
                    height: 50.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: PPaymobileColors.mainScreenBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(42),
                          side: BorderSide(
                            width: 1.w,
                            color: PPaymobileColors.textfiedBorder,
                          ),
                        ),
                      ),
                      onPressed: () {
                        context.router.pushAndPopUntil(ExploreRoute(), predicate: (route) => false);
                      },
                      child: Text(
                        'Go To Dashboard',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
