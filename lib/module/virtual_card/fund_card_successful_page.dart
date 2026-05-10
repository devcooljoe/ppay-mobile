import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/module/virtual_card/fund_card_receipt_page.dart';
import 'package:ppay_mobile/module/virtual_card/virtual_card_page.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';

@RoutePage()
class FundCardSuccessfulPage extends HookConsumerWidget {
  const FundCardSuccessfulPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: AppBar(
        backgroundColor: PPaymobileColors.mainScreenBackground,
        toolbarHeight: 56,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              122.verticalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 120.w,
                    width: 120.w,
                    child: Image.asset(
                      'assets/images/success1.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  25.verticalSpace,
                  Text(
                    'Transaction Successful',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  4.verticalSpace,
                  Text(
                    'Your USD card has been funded with \$100.00',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.svgIconColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  190.verticalSpace,
                  Text(
                    '₦149,800.00.00 has been deducted to your main wallet',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.anotherColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  14.verticalSpace,
                  PPButton(
                    text: 'View Card',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VirtualCardPage(),
                        ),
                      );
                    },
                    icon: SvgPicture.asset(
                      'assets/icon/arrow_forwardw.svg',
                      height: 24.w,
                      width: 24.w,
                      fit: BoxFit.contain,
                    ),
                  ),
                  18.verticalSpace,
                  PPButton(
                    text: 'View Receipt',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FundCardReceiptPage(),
                        ),
                      );
                    },
                    backgroundColor: PPaymobileColors.mainScreenBackground,
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
