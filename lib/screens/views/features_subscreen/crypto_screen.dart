import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/model/crypto_transactions_model.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/assets_screen.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/buy_crypto.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/crypto_transactions_history.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/receive_crypto_screen.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/sell_crypto.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';

class CryptoScreen extends StatefulWidget {
  const CryptoScreen({super.key});

  @override
  State<CryptoScreen> createState() => _CryptoScreenState();
}

class _CryptoScreenState extends State<CryptoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: AppBar(
        backgroundColor: PPaymobileColors.backgroundColor,
        toolbarHeight: 56,
        leadingWidth: 56.w,
        centerTitle: true,
        title: Text(
          'Crypto',
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: PPaymobileColors.mainScreenBackground,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: TouchOpacity(
            onTap: () => Navigator.pop(context),
            child: SizedBox(
              height: 24.w,
              width: 24.w,
              child: SvgPicture.asset(
                'assets/icon/arrow_back_white.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 43.w,
                right: 43.w,
                bottom: 38.h,
                top: 28.h,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                color: PPaymobileColors.backgroundColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Total Asset Balance',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.mainScreenBackground,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  2.verticalSpace,
                  Text(
                    '₦680,000.90',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.mainScreenBackground,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  2.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 13.w,
                        width: 13.w,
                        child: SvgPicture.asset(
                          'assets/icon/colored_arrow_up.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                      3.horizontalSpace,
                      Text(
                        '0.09%',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: PPaymobileColors.cryptoNumbersColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  24.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TouchOpacity(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => BuyCrypto()),
                              );
                            },
                            child: Container(
                              height: 68.w,
                              width: 68.w,
                              padding: EdgeInsets.all(15.54).r,
                              decoration: BoxDecoration(
                                color: PPaymobileColors.cryptoContainerColor,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: SizedBox(
                                  height: 18.w,
                                  width: 18.w,
                                  child: SvgPicture.asset(
                                    'assets/icon/add_white.svg',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          8.verticalSpace,
                          Text(
                            'Buy',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: PPaymobileColors.mainScreenBackground,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      56.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TouchOpacity(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => SellCrypto()),
                              );
                            },
                            child: Container(
                              height: 68.w,
                              width: 68.w,
                              padding: EdgeInsets.all(15.54).r,
                              decoration: BoxDecoration(
                                color: PPaymobileColors.cryptoContainerColor,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: SizedBox(
                                  height: 18.w,
                                  width: 18.w,
                                  child: SvgPicture.asset(
                                    'assets/icon/minus_white.svg',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          8.verticalSpace,
                          Text(
                            'Sell',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: PPaymobileColors.mainScreenBackground,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      56.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TouchOpacity(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ReceiveCryptoScreen(),
                                ),
                              );
                            },
                            child: Container(
                              height: 68.w,
                              width: 68.w,
                              padding: EdgeInsets.all(15.54).r,
                              decoration: BoxDecoration(
                                color: PPaymobileColors.cryptoContainerColor,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: SizedBox(
                                  height: 18.w,
                                  width: 18.w,
                                  child: SvgPicture.asset(
                                    'assets/icon/fund.svg',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          8.verticalSpace,
                          Text(
                            'Receive',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: PPaymobileColors.mainScreenBackground,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            24.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Assets',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TouchOpacity(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) {
                                return AssetsScreen();
                              },
                            ),
                          );
                        },
                        child: Text(
                          'See all',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.doneTextColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  21.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 145.h,
                        width: 122.6.w,
                        padding: EdgeInsets.all(11).r,
                        decoration: BoxDecoration(
                          color: PPaymobileColors.deepBackgroundColor,
                          borderRadius: BorderRadius.circular(7).r,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 34.w,
                                  width: 34.w,
                                  child: Image.asset(
                                    'assets/images/bitcoin.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                5.horizontalSpace,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'BTC',
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        color: Colors.black,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      'Bitcoin',
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        color: Colors.black,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            24.verticalSpace,
                            Text(
                              '₦3,100,000',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            1.verticalSpace,
                            Text(
                              '0.000005 BTC',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            4.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 13.w,
                                  width: 13.w,
                                  child: SvgPicture.asset(
                                    'assets/icon/colored_arrow_green_up.svg',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                3.horizontalSpace,
                                Text(
                                  '0.09%',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: PPaymobileColors.doneTextColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      16.horizontalSpace,
                      Container(
                        height: 145.h,
                        width: 122.6.w,
                        padding: EdgeInsets.all(11).r,
                        decoration: BoxDecoration(
                          color: PPaymobileColors.deepBackgroundColor,
                          borderRadius: BorderRadius.circular(7).r,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 34.w,
                                  width: 34.w,
                                  child: Image.asset(
                                    'assets/images/ethereum.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                5.horizontalSpace,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'ETH',
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        color: Colors.black,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      'Ethereum',
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        color: Colors.black,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            24.verticalSpace,
                            Text(
                              '₦54,000.90',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            1.verticalSpace,
                            Text(
                              '0.000005 ETH',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            4.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 13.w,
                                  width: 13.w,
                                  child: SvgPicture.asset(
                                    'assets/icon/colored_arrow_down.svg',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                3.horizontalSpace,
                                Text(
                                  '0.09%',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: PPaymobileColors.cryptoNumbersColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      16.horizontalSpace,
                      Container(
                        height: 145.h,
                        width: 122.6.w,
                        padding: EdgeInsets.all(11).r,
                        decoration: BoxDecoration(
                          color: PPaymobileColors.deepBackgroundColor,
                          borderRadius: BorderRadius.circular(7).r,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 34.w,
                                  width: 34.w,
                                  child: Image.asset(
                                    'assets/images/solana.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                5.horizontalSpace,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'SOL',
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        color: Colors.black,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      'Solana',
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        color: Colors.black,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            24.verticalSpace,
                            Text(
                              '₦65,000.20',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            1.verticalSpace,
                            Text(
                              '0.000005 SOL',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            4.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 13.w,
                                  width: 13.w,
                                  child: SvgPicture.asset(
                                    'assets/icon/colored_arrow_down.svg',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                3.horizontalSpace,
                                Text(
                                  '0.09%',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: PPaymobileColors.cryptoNumbersColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  37.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Transactions',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TouchOpacity(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => CryptoTransactionsHistory(),
                            ),
                          );
                        },
                        child: Text(
                          'See all',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.doneTextColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  37.verticalSpace,
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (_, _) => 24.verticalSpace,
                    itemCount: cryptoTransaction.length,
                    itemBuilder: (context, cryptoIndex) {
                      final crypto = cryptoTransaction[cryptoIndex];

                      return SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 45.w,
                                  width: 45.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    crypto.containerImage,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                5.horizontalSpace,
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      crypto.cryptoTitle,
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      crypto.cryptosubTitle,
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  crypto.cryptoPrice,
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  crypto.cryptoStatus,
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: crypto.cryptoStatusColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
