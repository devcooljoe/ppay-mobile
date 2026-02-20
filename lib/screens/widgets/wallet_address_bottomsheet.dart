import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';

class WalletAddressBottomsheet extends StatefulWidget {
  const WalletAddressBottomsheet({super.key});

  @override
  State<WalletAddressBottomsheet> createState() =>
      _WalletAddressBottomsheetState();
}

class _WalletAddressBottomsheetState extends State<WalletAddressBottomsheet> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.850,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Transform.translate(
            offset: const Offset(0, 0),
            child: TouchOpacity(
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                                    image: AssetImage(
                                      'assets/images/bitcoin.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              16.horizontalSpace,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Bitcoin',
                                    style: TextStyle(
                                      fontFamily: 'InstrumentSans',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    'BTC',
                                    style: TextStyle(
                                      fontFamily: 'InstrumentSans',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Network',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'BTC',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      39.verticalSpace,
                    ],
                  ),
                  Container(
                    height: 201.h,
                    width: 197.w,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 18.h,
                    ),
                    color: PPaymobileColors.deepBackgroundColor,
                    child: SizedBox(
                      height: 165.h,
                      width: 165.w,
                      child: Image.asset(
                        'assets/images/qrcode.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  22.verticalSpace,
                  Text(
                    textAlign: TextAlign.center,
                    'You can scan the code to fund your wallet or copy and share the address',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: Colors.black,
                    ),
                  ),
                  47.verticalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Wallet Address',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: Colors.black,
                        ),
                      ),
                      6.verticalSpace,
                      Container(
                        height: 64.h,
                        width: 385.w,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 8.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10).r,
                          color: PPaymobileColors.deepBackgroundColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                softWrap: true,
                                '0xabcdef1234567890abcdef1234567890abcdef12',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                  color: PPaymobileColors.svgIconColor,
                                ),
                              ),
                            ),
                            37.verticalSpace,
                            SizedBox(
                              height: 24.h,
                              width: 24.w,
                              child: SvgPicture.asset(
                                'assets/icon/paste_black1.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  41.verticalSpace,
                  SizedBox(
                    width: double.infinity,
                    height: 54.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: PPaymobileColors.backgroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(42),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () async {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Copy Address',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              color: PPaymobileColors.mainScreenBackground,
                            ),
                          ),
                          12.horizontalSpace,
                          SizedBox(
                            height: 24.h,
                            width: 24.w,
                            child: SvgPicture.asset(
                              'assets/icon/paste_white.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  16.verticalSpace,
                  SizedBox(
                    width: double.infinity,
                    height: 54.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: PPaymobileColors.mainScreenBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(42),
                          side: BorderSide(
                            color: PPaymobileColors.textfiedBorder,
                            width: 1.w,
                          ),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () async {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Share',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              color: Colors.black,
                            ),
                          ),
                          12.horizontalSpace,
                          SizedBox(
                            height: 24.h,
                            width: 24.w,
                            child: SvgPicture.asset(
                              'assets/icon/share_black.svg',
                              fit: BoxFit.contain,
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
        ],
      ),
    );
  }
}
