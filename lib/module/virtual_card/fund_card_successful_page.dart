import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/module/virtual_card/fund_card_receipt_page.dart';
import 'package:ppay_mobile/module/virtual_card/virtual_card_page.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class FundCardSuccessfulPage extends HookConsumerWidget {
  const FundCardSuccessfulPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: AppBar(automaticallyImplyLeading: false),
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
                  SizedBox(
                    width: double.infinity,
                    height: 54.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: PPaymobileColors.buttonColorandText,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24).r,
                        ),
                        elevation: 0,
                      ),
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const VirtualCardPage();
                            },
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'View Card',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              color: PPaymobileColors.mainScreenBackground,
                            ),
                          ),
                          7.horizontalSpace,
                          SizedBox(
                            height: 24.w,
                            width: 24.w,
                            child: SvgPicture.asset(
                              'assets/icon/arrow_forwardw.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  18.verticalSpace,
                  TouchOpacity(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const FundCardReceiptPage();
                          },
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: 21.w,
                        vertical: 12.h,
                      ),
                      decoration: BoxDecoration(
                        color: PPaymobileColors.mainScreenBackground,
                        borderRadius: BorderRadius.circular(42.r),
                      ),
                      child: Center(
                        child: Text(
                          'View Receipt',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
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
            ],
          ),
        ),
      ),
    );
  }
}
