import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/airtime_receipt_screen.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';

class AirtimeSuccessScreen extends StatefulWidget {
  const AirtimeSuccessScreen({super.key});

  @override
  State<AirtimeSuccessScreen> createState() => _AirtimeSuccessScreenState();
}

class _AirtimeSuccessScreenState extends State<AirtimeSuccessScreen> {
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
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 120.h,
                  width: 120.w,
                  child: Image.asset(
                    'assets/images/big_check.png', // this is replaced with 'assets/images/big_pending.png' for pending and 'assets/images/big_fail.png' for failed
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              25.verticalSpace,
              Text(
                'Transaction Successful', // this is replaced with transaction pending for pending and transaction failed for failed
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              4.verticalSpace,
              Text(
                'Airtime purchase of ₦1,500 was successful', // this is replaced with 'Your purchase of airtime is been processed.' for pending and 'Airtime purchase failed. Please try again' for failed
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              //this below is added for both failed and pending
              //31.verticalSpace,
              //Align(
              //   alignment: Alignment.center,
              //   child: Container(
              //     height: 30.h,
              //     width: 241.w,
              //     padding: EdgeInsets.symmetric(
              //       horizontal: 15.w,
              //       vertical: 3.h,
              //     ),
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(24).r,
              //       color: PPaymobileColors.doneColor, // this is .warningColor and .dangerColor for pending and fail respectively
              //     ),
              //     child: Center(
              //       child: RichText(
              //         text: TextSpan(
              //           text: 'Amount Purchased: ',
              //           style: TextStyle(
              //             fontFamily: 'InstrumentSans',
              //             color: Colors.black,
              //             fontSize: 14.sp,
              //             fontWeight: FontWeight.w500,
              //           ),
              //           children: [
              //             TextSpan(
              //               text: '₦40,000.00',
              //               style: TextStyle(
              //                 fontFamily: 'Gilroy',
              //                 color: Colors.black,
              //                 fontSize: 14.sp,
              //                 fontWeight: FontWeight.w500,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              220.verticalSpace,
              Text(
                '₦1,500.00 has been deducted to your main wallet', // tjis is not there for both pending and failed
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: PPaymobileColors.anotherColor,
                ),
              ),
              14.verticalSpace,
              TouchOpacity(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AirtimeReceiptScreen(),
                    ),
                  );
                },
                child: SizedBox(
                  height: 50.h,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/view_receipt.png', // this is replaced by 'assets/images/go_to.png' for pending and 'assets/images/try_again.png' for failed
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              20.verticalSpace,
              SizedBox(
                height: 50.h,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/make_another.png', // this is not there in pending but replaced by 'assets/images/go_to_app.png' for failed
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
