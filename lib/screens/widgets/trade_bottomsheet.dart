import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class TradeBottomsheet extends StatefulWidget {
  const TradeBottomsheet({super.key});

  @override
  State<TradeBottomsheet> createState() => _TradeBottomsheetState();
}

class _TradeBottomsheetState extends State<TradeBottomsheet> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.500,
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
                    'Trade Crypto',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      color: Colors.black,
                    ),
                  ),
                  29.verticalSpace,
                  SizedBox(
                    height: 69.h,
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 49.h,
                          width: 49.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: PPaymobileColors.buyTradeContainerColor,
                          ),
                          child: Center(
                            child: SizedBox(
                              height: 18.h,
                              width: 18.w,
                              child: SvgPicture.asset(
                                'assets/icon/add_white.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        13.horizontalSpace,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Buy',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.sp,
                                  color: Colors.black,
                                ),
                              ),
                              4.verticalSpace,
                              Text(
                                'Buy crypto with wallet balance',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                  color: PPaymobileColors.kyccontainerColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                          width: 12.w,
                          child: SvgPicture.asset(
                            'assets/icon/arrow_forward.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                  27.verticalSpace,
                  SizedBox(
                    height: 69.h,
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 49.h,
                          width: 49.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: PPaymobileColors.cryptoNumbersColor,
                          ),
                          child: Center(
                            child: SizedBox(
                              height: 18.h,
                              width: 18.w,
                              child: SvgPicture.asset(
                                'assets/icon/minus_white.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        13.horizontalSpace,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sell',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.sp,
                                  color: Colors.black,
                                ),
                              ),
                              4.verticalSpace,
                              Text(
                                'Sell crypto to your wallet',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                  color: PPaymobileColors.kyccontainerColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                          width: 12.w,
                          child: SvgPicture.asset(
                            'assets/icon/arrow_forward.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                  27.verticalSpace,
                  SizedBox(
                    height: 69.h,
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 49.h,
                          width: 49.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: PPaymobileColors.buttonColor,
                          ),
                          child: Center(
                            child: SizedBox(
                              height: 18.h,
                              width: 18.w,
                              child: SvgPicture.asset(
                                'assets/icon/fund.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        13.horizontalSpace,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Receive',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.sp,
                                  color: Colors.black,
                                ),
                              ),
                              4.verticalSpace,
                              Text(
                                'Receive crypto externally',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                  color: PPaymobileColors.kyccontainerColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                          width: 12.w,
                          child: SvgPicture.asset(
                            'assets/icon/arrow_forward.svg',
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
    );
  }
}
