import 'package:auto_route/auto_route.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/kyc_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/withdrawal_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/pp_alert.dart';
import 'package:ppay_mobile/shared/widgets/feature_icon_button.dart';
import 'package:ppay_mobile/shared/widgets/transaction_list_item.dart';
import 'package:ppay_mobile/shared/widgets/empty_state.dart';
import 'package:ppay_mobile/shared/widgets/section_header.dart';

@RoutePage()
class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: PPaymobileColors.deepBackgroundColor,
      appBar: AppBar(
        backgroundColor: PPaymobileColors.mainScreenBackground,
        toolbarHeight: 80.h,
        leadingWidth: 64.w,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Hello',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                3.horizontalSpace,
                SizedBox(
                  height: 17.w,
                  width: 17.w,
                  child: Image.asset(
                    'assets/images/thumbs.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
            Text(
              'Mary Evans',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Container(
            height: 53.w,
            width: 53.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/profilepic.png'),
              ),
              borderRadius: BorderRadius.circular(27.r),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: TouchOpacity(
              onTap: () {
                context.router.push(NotificationRoute());
              },
              child: Container(
                height: 47.w,
                width: 47.w,
                decoration: BoxDecoration(
                  color: Color(0xffEFF5F2).withValues(alpha: 0.62),
                  borderRadius: BorderRadius.circular(23.r),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: SizedBox(
                        height: 24.w,
                        width: 24.w,
                        child: SvgPicture.asset(
                          'assets/icon/notif.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 9.h,
                      left: 26.w,
                      child: SizedBox(
                        height: 9.w,
                        width: 9.w,
                        child: SvgPicture.asset(
                          'assets/icon/newnotif.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              19.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: Container(
                  height: 223.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/dash.png'),
                      fit: BoxFit.contain,
                    ),
                    borderRadius: BorderRadius.circular(19.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      13.verticalSpace,
                      Padding(
                        padding: EdgeInsets.only(left: 16.0.w),
                        child: SizedBox(
                          height: 29.h,
                          width: 77.w,
                          child: Image.asset(
                            'assets/images/currency_dash.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      2.5.verticalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Wallet Balance',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: PPaymobileColors.mainScreenBackground,
                                ),
                              ),
                              8.horizontalSpace,
                              SizedBox(
                                height: 25.w,
                                width: 25.w,
                                child: SvgPicture.asset(
                                  'assets/icon/eye-slash.svg',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                          4.verticalSpace,
                          Text(
                            '₦5,000,000.00',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              fontSize: 32.sp,
                              fontWeight: FontWeight.w600,
                              color: PPaymobileColors.mainScreenBackground,
                            ),
                          ),
                          27.verticalSpace,
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TouchOpacity(
                                  onTap: () {
                                    context.router.push(FundWalletRoute());
                                  },
                                  child: SizedBox(
                                    width: 172.5.w,
                                    height: 46.h,
                                    child: Image.asset(
                                      'assets/images/fund_dash.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                TouchOpacity(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      builder: (context) {
                                        return WithdrawalBottomsheet();
                                      },
                                    );
                                  },
                                  child: SizedBox(
                                    width: 172.5.w,
                                    height: 46.h,
                                    child: Image.asset(
                                      'assets/images/transfer_dash.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              18.verticalSpace,
              SizedBox(
                height: 88.h,
                width: 400.w,
                child: Image.asset(
                  'assets/images/ads.png',
                  fit: BoxFit.contain,
                ),
              ),
              18.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
                child: Container(
                  height: 61.h,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 13.w,
                    vertical: 7.h,
                  ),
                  decoration: BoxDecoration(
                    color: PPaymobileColors.kyccontainerColor,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Complete Verification',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Please Click to Complete Verification',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      TouchOpacity(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true, // ✅ allows custom height
                            backgroundColor:
                                Colors.transparent, // for rounded corners
                            builder: (context) {
                              return KycBottomsheet();
                            },
                          );
                        },
                        child: Container(
                          height: 36.h,
                          width: 75.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 17.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            color: PPaymobileColors.mainScreenBackground,
                            borderRadius: BorderRadius.circular(9.r),
                          ),
                          child: Center(
                            child: Text(
                              'Verify',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              18.verticalSpace,
              Container(
                height: 76.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
                color: PPaymobileColors.mainScreenBackground,
                child: TouchOpacity(
                  onTap: () {
                    context.router.push(ReviewDocumentRoute());
                  },
                  child: Container(
                    height: 56.h,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 11.w,
                      vertical: 9.h,
                    ),
                    decoration: BoxDecoration(
                      color: PPaymobileColors.warningColor,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 24.w,
                          width: 24.w,
                          child: SvgPicture.asset(
                            'assets/icon/warning.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                        8.horizontalSpace,
                        Expanded(
                          child: Text(
                            'Documents currently being reviewed. Please this won’t take long. Click to view status',
                            softWrap: true,
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color: PPaymobileColors.warningTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              8.verticalSpace,
              const PPAlert(
                type: PPAlertType.success,
                message: 'All documents are verified. You can activate your wallet by making your first deposit. Click here',
                showCloseButton: true,
              ),
              8.verticalSpace,
              const PPAlert(
                type: PPAlertType.error,
                message: 'Documents not fully verified please click to see more details. Click here',
                showCloseButton: true,
              ),
              16.verticalSpace,
              Container(
                height: 180.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0.w,
                  vertical: 20.0.h,
                ).r,
                decoration: BoxDecoration(
                  color: PPaymobileColors.mainScreenBackground,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Features',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    10.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FeatureIconButton(
                          iconPath: 'assets/icon/bill.svg',
                          label: 'Bills',
                          onTap: () => context.router.push(BillsRoute()),
                        ),
                        FeatureIconButton(
                          iconPath: 'assets/icon/gift.svg',
                          label: 'Gift Cards',
                          onTap: () => context.router.push(GiftcardRoute()),
                        ),
                        FeatureIconButton(
                          iconPath: 'assets/icon/crypto.svg',
                          label: 'Crypto',
                          onTap: () => context.router.push(CryptoRoute()),
                        ),
                        FeatureIconButton(
                          iconPath: 'assets/icon/more.svg',
                          label: 'More',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              16.verticalSpace,
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                decoration: BoxDecoration(
                  color: PPaymobileColors.mainScreenBackground,
                ),
                child: Column(
                  children: [
                    SectionHeader(
                      title: 'Transaction History',
                      actionText: 'See all',
                    ),
                    26.verticalSpace,
                    TransactionListItem(
                      imagePath: 'assets/images/dash_apple.png',
                      title: 'Apple',
                      subtitle: 'Pay with Dollar Card',
                      amount: '-₦60,000.00',
                    ),
                    28.verticalSpace,
                    EmptyState(
                      imagePath: 'assets/images/transactionimage.png',
                      message: 'No Transaction Available',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
