import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/views/transfer_funds_screen.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';

class WithdrawalBottomsheet extends StatefulWidget {
  const WithdrawalBottomsheet({super.key});

  @override
  State<WithdrawalBottomsheet> createState() => _WithdrawalBottomsheetState();
}

class _WithdrawalBottomsheetState extends State<WithdrawalBottomsheet> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.520,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add Account',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  10.verticalSpace,
                  // if the user is existing, show this below
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select Account',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        height: 39.h,
                        width: 39.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20).r,
                          color: PPaymobileColors.deepBackgroundColor,
                        ),
                        child: Center(
                          child: SizedBox(
                            height: 14.h,
                            width: 14.w,
                            child: SvgPicture.asset(
                              'assets/icon/add.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  21.verticalSpace,
                  TouchOpacity(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TransferFundsScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 72.h,
                      width: 398.w,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.h,
                        vertical: 16.w,
                      ),
                      decoration: BoxDecoration(
                        color: PPaymobileColors.deepBackgroundColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 40.h,
                            width: 53.w,
                            padding: EdgeInsets.all(10).r,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2).r,
                              color: PPaymobileColors.anotherbuttonbgColor,
                            ),
                            child: Center(
                              child: SizedBox(
                                height: 27.h,
                                width: 27.w,
                                child: SvgPicture.asset(
                                  'assets/icon/bank_black.svg',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          12.horizontalSpace,
                          Text(
                            'Add New Bank Details',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // if the user is existing, show this below
                  40.verticalSpace,
                  Container(
                    height: 53.h,
                    width: double.infinity,
                    padding: EdgeInsets.only(bottom: 13.h),
                    decoration: BoxDecoration(
                      color: PPaymobileColors.mainScreenBackground,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 40.h,
                          width: 44.w,
                          padding: EdgeInsets.all(10).r,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2).r,
                            color: PPaymobileColors.anotherbuttonbgColor,
                          ),
                          child: SizedBox(
                            height: 30.h,
                            width: 28.w,
                            child: Image.asset(
                              'assets/images/access_bank.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        14.horizontalSpace,
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Adebami Samuel',
                                    style: TextStyle(
                                      fontFamily: 'InstrumentSans',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '9087976570',
                                        style: TextStyle(
                                          fontFamily: 'InstrumentSans',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12.sp,
                                          color: PPaymobileColors.svgIconColor,
                                        ),
                                      ),
                                      8.horizontalSpace,
                                      SizedBox(
                                        height: 7.h,
                                        width: 7.w,
                                        child: SvgPicture.asset(
                                          'assets/icon/spacer.svg',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      8.horizontalSpace,
                                      Text(
                                        'Access Bank',
                                        style: TextStyle(
                                          fontFamily: 'InstrumentSans',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12.sp,
                                          color: PPaymobileColors.svgIconColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              // i used this button to go to the next page but that is not the function
                              TouchOpacity(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => TransferFundsScreen(),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 36.h,
                                  width: 97.w,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 7.w,
                                    vertical: 6.h,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4).r,
                                    color: PPaymobileColors.backgroundColor,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Transfer",
                                      style: TextStyle(
                                        color: PPaymobileColors
                                            .mainScreenBackground,
                                        fontSize: 14.sp,
                                        fontFamily: 'InstrumentSans',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
