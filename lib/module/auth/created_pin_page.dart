import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';

@RoutePage()
class CreatedPinPage extends HookConsumerWidget {
  const CreatedPinPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              54.verticalSpace,
              SizedBox(
                height: 140.w,
                width: 140.w,
                child: Image.asset(
                  'assets/images/big_check.png',
                  fit: BoxFit.contain,
                ),
              ),
              60.verticalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Transaction Pin Created',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  4.verticalSpace,
                  Text(
                    textAlign: TextAlign.center,
                    'Your transaction pin has been successfully created. Please keep your pin safe',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.svgIconColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  76.verticalSpace,
                  PPButton(
                    text: 'Go To Dashboard',
                    onPressed: () =>
                        context.router.push(SetUpFingerprintRoute()),
                    icon: SvgPicture.asset(
                      'assets/icon/arrow_forwardw.svg',
                      height: 24.w,
                      width: 24.w,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
