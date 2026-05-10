import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/pp_button.dart';

@RoutePage()
class FundWalletPage extends HookConsumerWidget {
  const FundWalletPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(
        title: 'Fund Wallet',
        onBackPressed: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  36.verticalSpace,
                  Text(
                    'Bank Transfer',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  6.verticalSpace,
                  Text(
                    'To fund your wallet make a deposit into the account details below transfer',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              40.verticalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Use details to fund your wallet',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.svgIconColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  12.verticalSpace,
                  Container(
                    height: 135.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6).r,
                      border: Border.all(
                        width: 1.0.w,
                        color: PPaymobileColors.textfiedBorder,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        12.verticalSpace,
                        SizedBox(
                          height: 16.w,
                          width: 16.w,
                          child: SvgPicture.asset(
                            'assets/icon/bank_black.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                        2.verticalSpace,
                        Text(
                          'Account Number',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.lightGrey,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        5.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '0976547890',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 32.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            30.horizontalSpace,
                            SizedBox(
                              height: 23.w,
                              width: 23.w,
                              child: SvgPicture.asset(
                                'assets/icon/paste.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  11.verticalSpace,
                  Container(
                    height: 68.h,
                    width: double.infinity,
                    padding: EdgeInsets.all(10).w,
                    decoration: BoxDecoration(
                      color: PPaymobileColors.mainScreenBackground,
                      border: Border.all(
                        width: 1.w,
                        color: PPaymobileColors.textfiedBorder,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 7.r,
                          spreadRadius: 0,
                          offset: Offset(0, 0),
                          color: PPaymobileColors.textfiedBorder,
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40.h,
                          width: 44.h,
                          child: SvgPicture.asset(
                            'assets/icon/account_holder.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                        10.horizontalSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Account Holder',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: PPaymobileColors.lightGrey,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'Adebami Samuel',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  7.verticalSpace,
                  Container(
                    height: 68.h,
                    width: double.infinity,
                    padding: EdgeInsets.all(10).w,
                    decoration: BoxDecoration(
                      color: PPaymobileColors.mainScreenBackground,
                      border: Border.all(
                        width: 1.w,
                        color: PPaymobileColors.textfiedBorder,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 7.r,
                          spreadRadius: 0,
                          offset: Offset(0, 0),
                          color: PPaymobileColors.textfiedBorder,
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40.h,
                          width: 44.h,
                          child: SvgPicture.asset(
                            'assets/icon/bank_green.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                        10.horizontalSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Bank',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: PPaymobileColors.lightGrey,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '9 Service Bank',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  92.verticalSpace,
                  PPButton(
                    text: 'Click to Copy',
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/icon/paste_white.svg',
                      height: 20.w,
                      width: 20.w,
                      fit: BoxFit.contain,
                    ),
                  ),
                  16.verticalSpace,
                  PPButton(
                    text: 'Share',
                    onPressed: () {},
                    backgroundColor: PPaymobileColors.anotherbuttonbgColor,
                    icon: SvgPicture.asset(
                      'assets/icon/share.svg',
                      height: 20.w,
                      width: 20.w,
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
