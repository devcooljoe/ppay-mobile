import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/module/crypto/sell_crypto_page.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';

@RoutePage()
class CryptoSellSucessfulPage extends StatefulWidget {
  const CryptoSellSucessfulPage({super.key});

  @override
  State<CryptoSellSucessfulPage> createState() =>
      _CryptoSellSucessfulPageState();
}

class _CryptoSellSucessfulPageState extends State<CryptoSellSucessfulPage> {
  @override
  Widget build(BuildContext context) {
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
                  122.verticalSpace,
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
                    'You successfully sold 0.000013 worth of BTC',
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
                    'Your sale of 0.000023BTC was not successful. Please try again',
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
                    'Your Purchase of 0.000023BTC is being processed.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.svgIconColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  200.verticalSpace,
                  Text(
                    '₦150,000.00 has been deducted to your main wallet',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.svgIconColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  14.verticalSpace,
                  SizedBox(
                    width: double.infinity,
                    height: 50.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: PPaymobileColors.backgroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(42),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SellCryptoPage(),
                          ),
                          // (route) => false(),
                        );
                      },
                      child: Text(
                        'Make another Trade',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: PPaymobileColors.mainScreenBackground,
                        ),
                      ),
                    ),
                  ),
                  8.verticalSpace,
                  SizedBox(
                    width: double.infinity,
                    height: 50.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: PPaymobileColors.mainScreenBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(42),
                          side: BorderSide.none,
                        ),
                      ),
                      onPressed: () {
                        context.router.pushAndPopUntil(
                          HomeRoute(),
                          predicate: (route) => false,
                        );
                      },
                      child: Text(
                        'View Asset',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  8.verticalSpace,
                  SizedBox(
                    width: double.infinity,
                    height: 50.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: PPaymobileColors.mainScreenBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(42),
                          side: BorderSide.none,
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Try Again',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  12.verticalSpace,
                  //this is not part of the ui, i added it to navigate to the receipt page...
                  SizedBox(
                    width: double.infinity,
                    height: 50.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: PPaymobileColors.mainScreenBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(42),
                          side: BorderSide.none,
                        ),
                      ),
                      onPressed: () {
                        context.router.push(CryptoSellReceiptRoute());
                      },
                      child: Text(
                        'View Receipt',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: Colors.black,
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
