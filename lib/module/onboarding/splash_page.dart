import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 3), () {
        if (mounted) {
          context.router.push(OnboardRoute());
        }
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
