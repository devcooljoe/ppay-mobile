import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';

@RoutePage()
class FingerprintCompletePage extends HookConsumerWidget {
  const FingerprintCompletePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            142.verticalSpace,
            SizedBox(
              height: 223.h,
              width: 314.w,
              child: Image.asset(
                'assets/images/fingerprint_complete.png',
                fit: BoxFit.contain,
              ),
            ),
            26.verticalSpace,
            Text(
              'Biometric Complete',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: Colors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            4.verticalSpace,
            Text(
              'Biometric has been created. You can use biometric to sign in or complete a transaction',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: PPaymobileColors.svgIconColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            91.verticalSpace,
            PPButton(
              text: 'Go To App',
              onPressed: () => context.router.pushAndPopUntil(
                ExploreRoute(),
                predicate: (route) => false,
              ),
              icon: SvgPicture.asset(
                'assets/icon/arrow_forwardw.svg',
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
