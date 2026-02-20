import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/gift_card_buy_receipt_screen.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';

class GiftCardSucessScreen extends StatefulWidget {
  const GiftCardSucessScreen({super.key});

  @override
  State<GiftCardSucessScreen> createState() => _GiftCardSucessScreenState();
}

class _GiftCardSucessScreenState extends State<GiftCardSucessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              142.verticalSpace,
              SizedBox(
                height: 120.h,
                width: 120.w,
                child: Image.asset(
                  'assets/images/big_check.png',
                  fit: BoxFit.contain,
                ),
              ),
              25.verticalSpace,
              Text(
                'Transaction Successful',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.verticalSpace,
              Text(
                'You have successfully purchased a gift card. An email will be sent to you recording the card details.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.svgIconColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              31.verticalSpace,
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 30.h,
                  width: 241.w,
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 3.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24).r,
                    color: PPaymobileColors.doneColor,
                  ),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Amount Purchased: ',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: '₦40,000.00',
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              98.verticalSpace,
              Container(
                height: 50.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(56).r,
                  color: PPaymobileColors.buttonColorandText,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Go To App',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    6.horizontalSpace,
                    SizedBox(
                      height: 24.h,
                      width: 24.h,
                      child: SvgPicture.asset(
                        'assets/icon/arrow_forwardw.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
              14.verticalSpace,
              // path to receipt screen cause it was not added
              TouchOpacity(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GiftCardBuyReceiptScreen(),
                    ),
                  );
                },
                child: Container(
                  height: 50.h,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: PPaymobileColors.textfiedBorder,
                      width: 1.w,
                    ),
                    borderRadius: BorderRadius.circular(56).r,
                    color: PPaymobileColors.mainScreenBackground,
                  ),
                  child: Center(
                    child: Text(
                      'View Receipt',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              // for other cases of transaction below
              15.verticalSpace,
              SizedBox(
                height: 120.h,
                width: 120.w,
                child: Image.asset(
                  'assets/images/big_pending.png',
                  fit: BoxFit.contain,
                ),
              ),
              25.verticalSpace,
              Text(
                'Transaction Pending', // it is Transaction Failed for failed transaction
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.verticalSpace,
              Text(
                'Your purchase of amazon gift card is processing. Please be patient as we process transaction.', // for transaction failed, it is is 'Your purchase of amazon gift card failed. Please try again.'
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: PPaymobileColors.svgIconColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              31.verticalSpace,
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 30.h,
                  width: 241.w,
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 3.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24).r,
                    color: PPaymobileColors
                        .warningColor, // for transaction failed it is PPaymobileColors.dangerColor,
                  ),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Amount Purchased: ',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors
                              .black, // the text color is .dangerTextColor
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: '₦40,000.00',
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              color: Colors
                                  .black, // the text color is .dangerTextColor
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              98.verticalSpace,
              Container(
                height: 50.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(56).r,
                  color: PPaymobileColors.buttonColorandText,
                ),
                child: Center(
                  child: Text(
                    'Try Again', //same for failed
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              24.verticalSpace,
              Container(
                height: 50.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(56).r,
                  color: PPaymobileColors.mainScreenBackground,
                  border: Border.all(
                    color: PPaymobileColors.textfiedBorder,
                    width: 1.w,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Go to App', //same for fail
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    6.horizontalSpace,
                    SizedBox(
                      height: 24.h,
                      width: 24.h,
                      child: SvgPicture.asset(
                        'assets/icon/arrow_forward_1.svg',
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
    );
  }
}
