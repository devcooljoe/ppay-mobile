import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/views/home_screen.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class FingerprintComplete extends StatefulWidget {
  const FingerprintComplete({super.key});

  @override
  State<FingerprintComplete> createState() => _FingerprintCompleteState();
}

class _FingerprintCompleteState extends State<FingerprintComplete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            142.verticalSpace,
            SizedBox(
              height: 223.h,
              width: 314.w,
              child: Image.asset(
                'assets/iamges/fingerprint_complete.png',
                fit: BoxFit.contain,
              ),
            ),
            26.verticalSpace,
            Text(
              'Biometric Complete',
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: Colors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            4.verticalSpace,
            Text(
              'Biometric has been created. You can use biometric to sign in or complete a transaction',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'InstrumentSans',
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            91.verticalSpace,
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
                    MaterialPageRoute(
                      builder: (context) {
                        return HomeScreen();
                      },
                    ),
                    (route) => false,
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Go To App',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: Colors.white,
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
          ],
        ),
      ),
    );
  }
}
