import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/screens/views/onboard_screen.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 3), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OnboardScreen()),
        );
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PPaymobileColors.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 54.h,
            right: 115.w,
            child: SizedBox(
              height: 614.h,
              width: 325.w,
              child: Image.asset(
                'assets/images/earthbackground1.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            top: 685.h,
            left: 271.w,
            child: SizedBox(
              height: 235.h,
              width: 169.w,
              child: Image.asset(
                'assets/images/earthbackground2.png',
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// 🔷 Center Logo + Text
          Center(
            child: SizedBox(
              height: 136.h,
              width: 224.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60.h,
                    width: 94.w,
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  7.verticalSpace,
                  Text(
                    'PINNACLEPAY',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 20.sp,
                      color: PPaymobileColors.mainScreenBackground,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w600,
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
