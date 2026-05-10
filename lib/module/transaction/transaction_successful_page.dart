import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/module/transaction/transfer_funds_page.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';

@RoutePage()
class TransactionSuccessfulPage extends HookConsumerWidget {
  const TransactionSuccessfulPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  100.verticalSpace,
                  SizedBox(
                    height: 53.w,
                    width: 53.w,
                    child: CircularProgressIndicator(
                      color: PPaymobileColors.buttonColor,
                      backgroundColor: PPaymobileColors.flightContainerbgColor,
                      strokeWidth: 8.0.w,
                    ),
                  ),
                  13.verticalSpace,
                  Text(
                    'Processing payment...',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  4.verticalSpace,
                  Text(
                    'Please hold as we process your payment',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.svgIconColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  10.verticalSpace,
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
                    'Transaction Sucessful',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  4.verticalSpace,
                  Text(
                    '₦45,000 has been deducted from your wallet. See details of transaction below ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.svgIconColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  10.verticalSpace,
                  SizedBox(
                    height: 120.w,
                    width: 120.w,
                    child: Image.asset(
                      'assets/images/big_fail.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  25.verticalSpace,
                  Text(
                    'Transfer Failed',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  4.verticalSpace,
                  Text(
                    'Your transaction was not successful. Please click the button below to try again',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.svgIconColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  10.verticalSpace,
                  SizedBox(
                    height: 120.w,
                    width: 120.w,
                    child: Image.asset(
                      'assets/images/big_pending.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  25.verticalSpace,
                  Text(
                    'Transfer Pending',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  4.verticalSpace,
                  Text(
                    'Your transaction is currently being processed. Please be patient as we process it ',
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
                    text: 'View Receipt',
                    onPressed: () => context.router.push(ReceiptRoute()),
                  ),
                  22.verticalSpace,
                  PPButton(
                    text: 'Go Home',
                    onPressed: () => context.router.pushAndPopUntil(ExploreRoute(), predicate: (route) => false),
                    backgroundColor: PPaymobileColors.mainScreenBackground,
                    icon: SvgPicture.asset(
                      'assets/icon/arrow_forward.svg',
                      height: 24.w,
                      width: 24.w,
                      fit: BoxFit.contain,
                    ),
                  ),
                  10.verticalSpace,
                  PPButton(
                    text: 'Try Again',
                    onPressed: () {},
                  ),
                  22.verticalSpace,
                  PPButton(
                    text: 'Go Home',
                    onPressed: () => context.router.pushAndPopUntil(HomeRoute(), predicate: (route) => false),
                    backgroundColor: PPaymobileColors.mainScreenBackground,
                    icon: SvgPicture.asset(
                      'assets/icon/arrow_forward.svg',
                      height: 24.w,
                      width: 24.w,
                      fit: BoxFit.contain,
                    ),
                  ),
                  10.verticalSpace,
                  PPButton(
                    text: 'Make Another Transaction',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TransferFundsPage(),
                        ),
                      );
                    },
                  ),
                  22.verticalSpace,
                  PPButton(
                    text: 'Go Home',
                    onPressed: () => context.router.pushAndPopUntil(HomeRoute(), predicate: (route) => false),
                    backgroundColor: PPaymobileColors.mainScreenBackground,
                    icon: SvgPicture.asset(
                      'assets/icon/arrow_forward.svg',
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
