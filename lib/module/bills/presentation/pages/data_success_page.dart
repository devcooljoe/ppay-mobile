import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';

@RoutePage()
class DataSuccessPage extends HookConsumerWidget {
  const DataSuccessPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: AppBar(
        backgroundColor: PPaymobileColors.mainScreenBackground,
        toolbarHeight: 56,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            122.verticalSpace,
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 120.w,
                width: 120.w,
                child: Image.asset(
                  'assets/images/big_check.png', // this is replaced with 'assets/images/big_pending.png' for pending and 'assets/images/big_fail.png' for failed
                  fit: BoxFit.contain,
                ),
              ),
            ),
            25.verticalSpace,
            Text(
              'Transaction Successful', // this is replaced with transaction pending for pending and transaction failed for failed
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            4.verticalSpace,
            Text(
              'Data purchase of 7GB for ₦1,500 was successful', // this is replaced with 'Your purchase of data is been processed.' for pending and 'Data purchase failed. Please try again' for failed
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),

            220.verticalSpace,
            Text(
              '₦1,500.00 has been deducted to your main wallet', // tjis is not there for both pending and failed
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: PPaymobileColors.anotherColor,
              ),
            ),
            14.verticalSpace,
            PPButton(
              text: 'Add as Beneficiary',
              onPressed: () {},
            ),
            10.verticalSpace,
            PPButton(
              text: 'Go To App',
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icon/arrow_forwardw.svg',
                height: 24.h,
                width: 24.h,
                fit: BoxFit.contain,
              ),
            ),
            10.verticalSpace,
            PPButton(
              text: 'Try Again',
              onPressed: () {},
            ),
            20.verticalSpace,
            PPButton(
              text: 'Make another Payment',
              onPressed: () {},
              backgroundColor: PPaymobileColors.mainScreenBackground,
              icon: SvgPicture.asset(
                'assets/icon/arrow_forward_1.svg',
                height: 24.h,
                width: 24.h,
                fit: BoxFit.contain,
              ),
            ),
            10.verticalSpace,
            PPButton(
              text: 'Go to App',
              onPressed: () {},
              backgroundColor: PPaymobileColors.mainScreenBackground,
              icon: SvgPicture.asset(
                'assets/icon/arrow_forward_1.svg',
                height: 24.h,
                width: 24.h,
                fit: BoxFit.contain,
              ),
            ),
            14.verticalSpace,
            PPButton(
              text: 'View Receipt',
              onPressed: () => context.router.push(DataReceiptRoute()),
            ),
          ],
        ),
      ),
    );
  }
}
