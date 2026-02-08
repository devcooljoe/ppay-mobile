import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/virtual_card_sucess_screen.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/crypto_pin_bottomsheet.dart';

class PurchaseDollarcardBottomsheet extends StatefulWidget {
  const PurchaseDollarcardBottomsheet({super.key});

  @override
  State<PurchaseDollarcardBottomsheet> createState() =>
      _PurchaseDollarcardBottomsheetState();
}

class _PurchaseDollarcardBottomsheetState
    extends State<PurchaseDollarcardBottomsheet> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.454,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Transform.translate(
            offset: const Offset(0, 0),
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 60.h,
                width: 60.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30).r,
                  color: PPaymobileColors.mainScreenBackground,
                ),
                child: SizedBox(
                  height: 18.h,
                  width: 18.h,
                  child: SvgPicture.asset(
                    'assets/icon/cancel.svg',
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
          ),
          10.verticalSpace,
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 20.w, top: 29.h, right: 20.w),
              width: double.infinity,
              decoration: BoxDecoration(
                color: PPaymobileColors.mainScreenBackground,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Purchase Dollar Card',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  2.verticalSpace,
                  Text(
                    'Click below to pay with available wallet balance',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  37.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Card Charge: ',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        ' \$4.00',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      7.horizontalSpace,
                      SizedBox(
                        height: 16.h,
                        width: 16.w,
                        child: SvgPicture.asset(
                          'assets/icon/equiv.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                      7.horizontalSpace,
                      Text(
                        '₦6,000.00',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  4.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text.rich(
                        textAlign: TextAlign.center,
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Insufficient funds in wallet. ',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: 'InstrumentSans',
                                fontWeight: FontWeight.w600,
                                color: PPaymobileColors.cryptoNumbersColor,
                              ),
                            ),
                            TextSpan(
                              text: 'Fund wallet',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: 'InstrumentSans',
                                fontWeight: FontWeight.w600,
                                color: PPaymobileColors.buyTradeContainerColor,
                                decoration: TextDecoration.underline,
                                decorationColor:
                                    PPaymobileColors.buyTradeContainerColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      4.horizontalSpace,
                      SizedBox(
                        height: 19.h,
                        width: 20.w,
                        child: SvgPicture.asset(
                          'assets/icon/arrow_forward_blue.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                  37.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 59.h,
                            width: 59.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/images/nigeria.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          16.horizontalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Wallet balance',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                '₦0.00',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => VirtualCardSucessScreen(),
                            ),
                          );
                        },
                        child: Container(
                          height: 44.h,
                          width: 86.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: PPaymobileColors
                                .deepBackgroundColor, //changes to .backgroundColor when the wallet has more thn 0.00 in it
                            borderRadius: BorderRadius.circular(6).r,
                          ),
                          child: Center(
                            child: Text(
                              'Pay',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                color: PPaymobileColors.mainScreenBackground,
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
        ],
      ),
    );
  }
}
