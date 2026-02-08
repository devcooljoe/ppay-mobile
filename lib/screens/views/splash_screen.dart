// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:ppay_mobile/screens/widgets/colors.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: PPaymobileColors.backgroundColor,
//       body: SafeArea(
//         child: Center(
//           child: SizedBox(
//             height: 136,
//             width: 224,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   height: 60,
//                   width: 94,
//                   child: Image.asset(
//                     'assets/images/logo.png',
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//                 7.verticalSpace,
//                 Text(
//                   'PINNACLEPAY',
//                   style: TextStyle(
//                     fontFamily: 'Montserrat',
//                     fontSize: 20.sp,
//                     color: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//             // child: Image.asset('assets/images/logo.png'),
//           ),
//         ),
//       ),
//     );
//   }
// }
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
      body: SafeArea(
        child: Stack(
          children: [
            /// 🌍 Top-left Earth Background
            Positioned(
              bottom: 54.h,
              left: -262.w,
              child: SizedBox(
                height: 614.h,
                width: 325.w,
                child: Image.asset(
                  'assets/images/earthbackground1.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),

            /// 🌍 Bottom-right Earth Background
            Positioned(
              top: 685.h,
              left: 271.w,
              child: Image.asset(
                'assets/images/earthbackground2.png',
                fit: BoxFit.contain,
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
                        color: Colors.white,
                        letterSpacing: 1.2,
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
