import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/booked_flights_screen.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/flight_payment_receipt_screen.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';

class FlightPaymwntSuccessScreen extends StatefulWidget {
  const FlightPaymwntSuccessScreen({super.key});

  @override
  State<FlightPaymwntSuccessScreen> createState() =>
      _FlightPaymwntSuccessScreenState();
}

class _FlightPaymwntSuccessScreenState
    extends State<FlightPaymwntSuccessScreen> {
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
              73.verticalSpace,
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 74.h,
                  width: 74.w,
                  child: Image.asset(
                    'assets/images/big_check.png', // this is replaced with 'assets/images/big_pending.png' for pending and 'assets/images/big_fail.png' for failed
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              25.verticalSpace,
              Text(
                'Flight Successfully Booked', // this is replaced with 'Pending Flight Booking' for pending and 'Flight Booking Failed' for failed
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: PPaymobileColors.greenTextColor,
                ),
              ),
              4.verticalSpace,
              Text(
                'You’ll receive a notification once check-in opens so you can access your boarding pass.  ', // this is replaced with 'Your flight booking is being processed. Please hold as we complete your transaction  ' for pending and 'Your transaction was not successful. Please try again or click the button to go back' for failed
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: PPaymobileColors.svgIconColor,
                ),
              ),
              241.verticalSpace,
              TouchOpacity(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FlightPaymentReceiptScreen(),
                    ),
                  );
                },
                child: Container(
                  height: 46.h,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(56).r,
                    color: PPaymobileColors.mainScreenBackground,
                    border: Border.all(
                      color: PPaymobileColors.textfieldGrey,
                      width: 1.w,
                    ),
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
              20.verticalSpace,
              TouchOpacity(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookedFlightsScreen(),
                    ),
                  );
                },
                child: Container(
                  height: 46.h,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(56).r,
                    color: PPaymobileColors.buttonColorandText,
                  ),
                  child: Center(
                    child: Text(
                      'Book Another Flight',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: PPaymobileColors.mainScreenBackground,
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
      ),
    );
  }
}
