import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';

@RoutePage()
class TransactionSuccessfulPage extends StatelessWidget {
  final String description;

  const TransactionSuccessfulPage({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
          child: ListView(
            children: [
              100.verticalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 120.w,
                    width: 120.w,
                    child: Image.asset(
                      'assets/images/big_check.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  25.verticalSpace,
                  Text(
                    'Transaction Successful',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  4.verticalSpace,
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.svgIconColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  161.verticalSpace,
                  PPButton(
                    text: 'Go to Home',
                    onPressed: () => context.router.replaceAll([const ExploreRoute()]),
                    icon: SvgPicture.asset(
                      'assets/icon/arrow_forward.svg',
                      height: 24.w,
                      width: 24.w,
                      fit: BoxFit.contain,
                    ),
                  ),
                  10.verticalSpace,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
