import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/buy_gift_card_features_screen.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/sell_gift_card_features_screen.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';

class GiftcardScreen extends StatefulWidget {
  const GiftcardScreen({super.key});

  @override
  State<GiftcardScreen> createState() => _GiftcardScreenState();
}

class _GiftcardScreenState extends State<GiftcardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: AppBar(
        backgroundColor: PPaymobileColors.mainScreenBackground,
        toolbarHeight: 56,
        leadingWidth: 56.w,
        centerTitle: true,
        title: Text(
          'GiftCard',
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: TouchOpacity(
            onTap: () => Navigator.pop(context),
            child: SizedBox(
              height: 24.h,
              width: 24.w,
              child: SvgPicture.asset(
                'assets/icon/arrow_back.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              39.verticalSpace,
              Text(
                'Start Your Gift Card Transaction. Buy or Sell Instantly',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              33.verticalSpace,
              TouchOpacity(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BuyGiftCardFeaturesScreen(),
                    ),
                  );
                },
                child: SizedBox(
                  height: 251.h,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 251.h,
                        width: double.infinity,
                        child: Image.asset(
                          'assets/images/buy_gift_card.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      Positioned(
                        left: 117.w,
                        bottom: 7.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Click to buy',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                4.verticalSpace,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 18.h,
                                      width: 18.w,
                                      child: SvgPicture.asset(
                                        'assets/icon/check.svg',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    8.horizontalSpace,
                                    Text(
                                      'Fast & Secure',
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        color: PPaymobileColors.svgIconColor,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            47.horizontalSpace,
                            SizedBox(
                              height: 44.h,
                              width: 122.w,
                              child: Image.asset(
                                'assets/images/explore.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              36.verticalSpace,
              TouchOpacity(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SellGiftCardFeaturesScreen(),
                    ),
                  );
                },
                child: SizedBox(
                  height: 251.h,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 251.h,
                        width: double.infinity,
                        child: Image.asset(
                          'assets/images/sell_gift_card.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      Positioned(
                        left: 117.w,
                        bottom: 7.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Click to sell',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                4.verticalSpace,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 18.h,
                                      width: 18.w,
                                      child: SvgPicture.asset(
                                        'assets/icon/check.svg',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    8.horizontalSpace,
                                    Text(
                                      'Fast & Secure',
                                      style: TextStyle(
                                        fontFamily: 'InstrumentSans',
                                        color: PPaymobileColors.svgIconColor,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            47.horizontalSpace,
                            SizedBox(
                              height: 44.h,
                              width: 122.w,
                              child: Image.asset(
                                'assets/images/explore.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
