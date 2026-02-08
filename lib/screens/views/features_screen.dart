import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/crypto.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/virtual_card.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class FeaturesScreen extends StatefulWidget {
  const FeaturesScreen({super.key});

  @override
  State<FeaturesScreen> createState() => _FeaturesScreenState();
}

class _FeaturesScreenState extends State<FeaturesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: AppBar(
        backgroundColor: PPaymobileColors.mainScreenBackground,
        toolbarHeight: 56,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Features',
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              42.verticalSpace,
              Text(
                'Explore Features',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              6.verticalSpace,
              Text(
                'Pay bills, trade crypto, manage giftcards, shop, book flights, and use your virtual dollar card all for you',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.svgIconColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              40.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 98.h,
                        width: 122.w,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: PPaymobileColors.textfiedBorder,
                          ),
                          borderRadius: BorderRadius.circular(8).r,
                        ),
                        child: Center(
                          child: SizedBox(
                            height: 52.h,
                            width: 52.w,
                            child: SvgPicture.asset(
                              'assets/icon/gift_card_green.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      8.verticalSpace,
                      Text(
                        'Giftcard',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  16.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 98.h,
                        width: 122.w,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: PPaymobileColors.textfiedBorder,
                          ),
                          borderRadius: BorderRadius.circular(8).r,
                        ),
                        child: Center(
                          child: SizedBox(
                            height: 52.h,
                            width: 52.w,
                            child: SvgPicture.asset(
                              'assets/icon/bills_green.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      8.verticalSpace,
                      Text(
                        'Bills',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  16.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => VirtualCard()),
                          );
                        },
                        child: Container(
                          height: 98.h,
                          width: 122.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: PPaymobileColors.textfiedBorder,
                            ),
                            borderRadius: BorderRadius.circular(8).r,
                          ),
                          child: Center(
                            child: SizedBox(
                              height: 52.h,
                              width: 52.w,
                              child: SvgPicture.asset(
                                'assets/icon/virtual_card.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                      8.verticalSpace,
                      Text(
                        'Virtual Card',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              40.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => Crypto()),
                          );
                        },
                        child: Container(
                          height: 98.h,
                          width: 122.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: PPaymobileColors.textfiedBorder,
                            ),
                            borderRadius: BorderRadius.circular(8).r,
                          ),
                          child: Center(
                            child: SizedBox(
                              height: 52.h,
                              width: 52.w,
                              child: SvgPicture.asset(
                                'assets/icon/crypto.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                      8.verticalSpace,
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => Crypto()),
                          );
                        },
                        child: Text(
                          'Crypto',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  16.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 98.h,
                        width: 122.w,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: PPaymobileColors.textfiedBorder,
                          ),
                          borderRadius: BorderRadius.circular(8).r,
                        ),
                        child: Center(
                          child: SizedBox(
                            height: 52.h,
                            width: 52.w,
                            child: SvgPicture.asset(
                              'assets/icon/airplane_green.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      8.verticalSpace,
                      Text(
                        'Flight Booking',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  16.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 98.h,
                        width: 122.w,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: PPaymobileColors.textfiedBorder,
                          ),
                          borderRadius: BorderRadius.circular(8).r,
                        ),
                        child: Center(
                          child: SizedBox(
                            height: 52.h,
                            width: 52.w,
                            child: SvgPicture.asset(
                              'assets/icon/cart_green.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      8.verticalSpace,
                      Text(
                        'Shopping',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
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
