import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/main.dart';
import 'package:ppay_mobile/model/transaction_history_model.dart';
import 'package:ppay_mobile/screens/views/fund_wallet_screen.dart';
import 'package:ppay_mobile/screens/views/review_document_screen.dart';
import 'package:ppay_mobile/screens/views/transfer_funds_screen.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/kyc_bottomsheet.dart';
import 'package:ppay_mobile/screens/widgets/withdrawal_bottomsheet.dart';

import '../../main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List transactionHistroy = [
  TransactionHistoryModel(
    leadingImage: 'assets/images/apple.png',
    titleText: 'Apple',
    subtitleText: 'Paid with Dollar Card',
    trailingText: '-₦60,000.00',
    trailingColor: PPaymobileColors.redTextfield,
  ),
  TransactionHistoryModel(
    leadingImage: 'assets/images/spotify.png',
    titleText: 'Spotify',
    subtitleText: 'Paid with Dollar Card',
    trailingText: '-₦60,000.00',
    trailingColor: PPaymobileColors.redTextfield,
  ),
];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PPaymobileColors.deepBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              17.verticalSpace,
              Container(
                height: 53.h,
                padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 53.h,
                          width: 53.w,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/profilepic.png'),
                            ),
                            borderRadius: BorderRadius.circular(27.r),
                          ),
                        ),
                        12.horizontalSpace,
                        Column(
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
                                  height: 17.h,
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
                      ],
                    ),
                    Container(
                      height: 47.h,
                      width: 47.w,
                      decoration: BoxDecoration(
                        color: PPaymobileColors.textfiedBorder,
                        borderRadius: BorderRadius.circular(23.r),
                      ),
                      child: Stack(
                        children: [
                          Center(
                            child: SizedBox(
                              height: 24.h,
                              width: 24.w,
                              child: SvgPicture.asset(
                                'assets/icon/notif.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 12,
                            left: 25,
                            child: SizedBox(
                              height: 9.h,
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
                  ],
                ),
              ),
              19.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
                child: Container(
                  height: 223.h,
                  padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: PPaymobileColors.backgroundColor,
                    borderRadius: BorderRadius.circular(19.r),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Image.asset(
                            'assets/images/earthbackground1.png',
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          height: 29.h,
                          width: 77.w,
                          padding: EdgeInsets.only(
                            top: 3.h,
                            left: 8.w,
                            right: 8.w,
                            bottom: 3.h,
                          ),
                          decoration: BoxDecoration(
                            color: PPaymobileColors.buttonColorandText,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 15.h,
                                width: 15.w,
                                child: Image.asset(
                                  'assets/images/flag.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Text(
                                'NGN',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: PPaymobileColors.mainScreenBackground,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 29.h,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: SizedBox(
                          child: Column(
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
                                      color:
                                          PPaymobileColors.mainScreenBackground,
                                    ),
                                  ),
                                  8.horizontalSpace,
                                  SizedBox(
                                    height: 25.h,
                                    width: 25.w,
                                    child: SvgPicture.asset(
                                      'assets/icon/eye-slash.svg',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ],
                              ),
                              6.verticalSpace,
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => FundWalletScreen(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 46.h,
                                      width: 173.w,
                                      decoration: BoxDecoration(
                                        color:
                                            PPaymobileColors.buttonColorandText,
                                        borderRadius: BorderRadius.circular(
                                          26.r,
                                        ),
                                      ),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 24.w,
                                              height: 24.h,
                                              child: SvgPicture.asset(
                                                'assets/icon/fund.svg',
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            4.horizontalSpace,
                                            Text(
                                              'Fund Wallet',
                                              style: TextStyle(
                                                fontFamily: 'InstrumentSans',
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500,
                                                color: PPaymobileColors
                                                    .mainScreenBackground,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled:
                                            true, // ✅ allows custom height
                                        backgroundColor: Colors
                                            .transparent, // for rounded corners
                                        builder: (context) {
                                          return WithdrawalBottomsheet();
                                        },
                                      );
                                    },
                                    child: Container(
                                      height: 46.h,
                                      width: 173.w,
                                      decoration: BoxDecoration(
                                        color:
                                            PPaymobileColors.buttonColorandText,
                                        borderRadius: BorderRadius.circular(
                                          26.r,
                                        ),
                                      ),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 24.w,
                                              height: 24.h,
                                              child: SvgPicture.asset(
                                                'assets/icon/transfer.svg',
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            4.horizontalSpace,
                                            Text(
                                              'Transfer',
                                              style: TextStyle(
                                                fontFamily: 'InstrumentSans',
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500,
                                                color: PPaymobileColors
                                                    .mainScreenBackground,
                                              ),
                                            ),
                                          ],
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
                    ],
                  ),
                ),
              ),

              18.verticalSpace,
              SizedBox(
                height: 88.h,
                width: double.infinity,
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
                      GestureDetector(
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
                    ],
                  ),
                ),
              ),
              18.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReviewDocumentScreen(),
                      ),
                    );
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
                          height: 24.h,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
                child: Container(
                  height: 56.h,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 11.w,
                    vertical: 9.h,
                  ),
                  decoration: BoxDecoration(
                    color: PPaymobileColors.doneColor,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 24.h,
                        width: 24.w,
                        child: SvgPicture.asset(
                          'assets/icon/done.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                      8.horizontalSpace,
                      Expanded(
                        child: Text(
                          'All documents are verified. You can activate your wallet by making your first deposit. Click here',
                          softWrap: true,
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: PPaymobileColors.doneTextColor,
                          ),
                        ),
                      ),
                      8.horizontalSpace,
                      SizedBox(
                        height: 28.h,
                        width: 28.w,
                        child: SvgPicture.asset(
                          'assets/icon/cancel.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              8.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
                child: Container(
                  height: 56.h,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 11.w,
                    vertical: 9.h,
                  ),
                  decoration: BoxDecoration(
                    color: PPaymobileColors.dangerColor,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 24.h,
                        width: 24.w,
                        child: SvgPicture.asset(
                          'assets/icon/danger.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                      8.horizontalSpace,
                      Expanded(
                        child: Text(
                          'Documents not fully verified please click to see more details. Click here',
                          softWrap: true,
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: PPaymobileColors.dangerTextColor,
                          ),
                        ),
                      ),
                      8.horizontalSpace,
                      SizedBox(
                        height: 28.h,
                        width: 28.w,
                        child: SvgPicture.asset(
                          'assets/icon/cancel.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              16.verticalSpace,
              Container(
                height: 180.h,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 20.0,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Column(
                          children: [
                            Container(
                              height: 66.h,
                              width: 78.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.r),
                                color: PPaymobileColors.deepBackgroundColor,
                              ),
                              child: Center(
                                child: SvgPicture.asset('assets/icon/bill.svg'),
                              ),
                            ),
                            12.verticalSpace,
                            Text(
                              'Bills',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 66.h,
                              width: 78.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.r),
                                color: PPaymobileColors.deepBackgroundColor,
                              ),
                              child: Center(
                                child: SvgPicture.asset('assets/icon/gift.svg'),
                              ),
                            ),
                            12.verticalSpace,
                            Text(
                              'Gift Cards',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 66.h,
                              width: 78.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.r),
                                color: PPaymobileColors.deepBackgroundColor,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  'assets/icon/crypto.svg',
                                ),
                              ),
                            ),
                            12.verticalSpace,
                            Text(
                              'Crypto',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 66.h,
                              width: 78.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.r),
                                color: PPaymobileColors.deepBackgroundColor,
                              ),
                              child: Center(
                                child: SvgPicture.asset('assets/icon/more.svg'),
                              ),
                            ),
                            12.verticalSpace,
                            Text(
                              'More',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ],
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Transaction History',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'See all',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: PPaymobileColors.highlightTextColor,
                          ),
                        ),
                      ],
                    ),
                    26.verticalSpace,

                    ListView.separated(
                      shrinkWrap: true, // ✅ critical
                      physics:
                          const NeverScrollableScrollPhysics(), // ✅ critical
                      itemCount: transactionHistroy.length,
                      separatorBuilder: (context, index) => 28.verticalSpace,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                          ).w,
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,

                            /// Leading (circle container)
                            leading: Container(
                              height: 49.h,
                              width: 49.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25).r,
                                color: PPaymobileColors.deepBackgroundColor,
                              ),
                              child: Center(
                                child: SizedBox(
                                  height: 35.h,
                                  width: 35.w,
                                  child: Image.asset(
                                    transactionHistroy[index].leadingImage,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),

                            /// Title
                            title: Text(
                              transactionHistroy[index].titleText,
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),

                            /// Subtitle
                            subtitle: Text(
                              transactionHistroy[index].subtitleText,
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                fontSize: 13.sp,
                                color: PPaymobileColors.textfiedBorder,
                              ),
                            ),

                            /// Trailing
                            trailing: Text(
                              transactionHistroy[index].trailingText,
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                                color: transactionHistroy[index].trailingColor,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    28.verticalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 138.h,
                          width: 225.w,
                          child: Image.asset(
                            'assets/images/transactionimage.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        Text(
                          'No Transaction Available',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: PPaymobileColors.textfiedBorder,
                          ),
                        ),
                      ],
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
