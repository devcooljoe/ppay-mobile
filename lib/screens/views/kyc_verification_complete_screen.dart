import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/screens/views/home_screen.dart';
import 'package:ppay_mobile/screens/views/route_screen.dart';
import 'package:ppay_mobile/screens/views/verify_code.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/create_pin_bottomsheet.dart';

class KycVerificationCompleteScreen extends StatefulWidget {
  const KycVerificationCompleteScreen({super.key});

  @override
  State<KycVerificationCompleteScreen> createState() =>
      _KycVerificationCompleteScreenState();
}

class _KycVerificationCompleteScreenState
    extends State<KycVerificationCompleteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      body: ListView(
        children: [
          91.verticalSpace,
          SizedBox(
            height: 158.h,
            width: 158.w,
            child: Image.asset(
              'assets/images/complete.png',
              fit: BoxFit.contain,
            ),
          ),
          15.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0).w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Verification Complete',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: Colors.black,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                4.verticalSpace,
                Text(
                  'You have successfully completed your account verification, a confirmation email will be sent to you once your documents are verified',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    color: PPaymobileColors.svgIconColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                48.verticalSpace,
                SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: PPaymobileColors.backgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(42),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const HomeScreen()),
                        (route) => false,
                      );

                      // 🔥 wait for navigation, then show bottom sheet
                      Future.delayed(const Duration(milliseconds: 300), () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (_) => const CreatePinBottomsheet(),
                        );
                      });
                    },

                    child: Text(
                      'Set Up Biometric',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                20.verticalSpace,
                SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: PPaymobileColors.mainScreenBackground,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(42),
                        side: BorderSide(
                          width: 1.w,
                          color: PPaymobileColors.textfiedBorder,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => RouteScreen()),
                        (route) => false,
                      );
                    },
                    child: Text(
                      'Go To Dashboard',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
