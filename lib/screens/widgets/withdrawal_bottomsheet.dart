import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/views/transfer_funds_screen.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

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
                    'Add Account',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  21.verticalSpace,
                  GestureDetector(
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
