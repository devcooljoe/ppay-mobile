import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/data_receipt_screen.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';

class DataSuccessScreen extends StatefulWidget {
  const DataSuccessScreen({super.key});

  @override
  State<DataSuccessScreen> createState() => _DataSuccessScreenState();
}

class _DataSuccessScreenState extends State<DataSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: AppBar(automaticallyImplyLeading: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            122.verticalSpace,
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 120.w,
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
              'Data purchase of 7GB for ₦1,500 was successful', // this is replaced with 'Your purchase of data is been processed.' for pending and 'Data purchase failed. Please try again' for failed
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),

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
                  'Add as Beneficiary',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            10.verticalSpace,
            // for pending
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
            10.verticalSpace,
            // for failed
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
                  'Try Again',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            20.verticalSpace,
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
                    'Make another Payment',
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
            // only for failed
            10.verticalSpace,
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
                    'Go to App',
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
            14.verticalSpace,
            // this below is not added to the design but leads to the receipt screen
            TouchOpacity(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DataReceiptScreen()),
                );
              },
              child: Container(
                height: 50.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(56).r,
                  color: PPaymobileColors.buttonColorandText,
                ),
                child: Center(
                  child: Text(
                    'View Receipt',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
