import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/fund_card_receipt_screen.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/virtual_card.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class FundCardSuccessfulScreen extends StatefulWidget {
  const FundCardSuccessfulScreen({super.key});

  @override
  State<FundCardSuccessfulScreen> createState() =>
      _FundCardSuccessfulScreenState();
}

class _FundCardSuccessfulScreenState extends State<FundCardSuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: AppBar(automaticallyImplyLeading: false),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              122.verticalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 120.h,
                    width: 120.w,
                    child: Image.asset(
                      'assets/images/success1.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  25.verticalSpace,
                  Text(
                    'Transaction Successful',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  4.verticalSpace,
                  Text(
                    'Your USD card has been funded with \$100.00',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.svgIconColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  190.verticalSpace,
                  Text(
                    '₦149,800.00.00 has been deducted to your main wallet',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.anotherColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  14.verticalSpace,
                  SizedBox(
                    width: double.infinity,
                    height: 54.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: PPaymobileColors
                            .backgroundColor, //after price input, the color changes to .backgroundColor
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24).r,
                        ),
                        elevation: 0,
                      ),
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const VirtualCard();
                            },
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'View Card',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              color: PPaymobileColors.mainScreenBackground,
                            ),
                          ),
                          7.horizontalSpace,
                          SizedBox(
                            height: 24.h,
                            width: 24.w,
                            child: SvgPicture.asset(
                              'assets/icon/arrow_forwardw.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  18.verticalSpace,
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const FundCardReceiptScreen();
                          },
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: 21.w,
                        vertical: 12.h,
                      ),
                      decoration: BoxDecoration(
                        color: PPaymobileColors.mainScreenBackground,
                        borderRadius: BorderRadius.circular(42.r),
                      ),
                      child: Center(
                        child: Text(
                          'View Receipt',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            color: Colors.black,
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
    );
  }
}
