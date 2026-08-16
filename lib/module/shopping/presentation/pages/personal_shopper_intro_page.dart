import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class PersonalShopperIntroPage extends StatelessWidget {
  const PersonalShopperIntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PPaymobileColors.backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 16.h),
              child: TouchOpacity(
                onTap: () => Navigator.pop(context),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.white,
                      size: 16.w,
                    ),
                    8.horizontalSpace,
                    Text(
                      'Back',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Shopping bag image
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: Image.asset(
                      'assets/images/shooping-bag.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  48.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: Column(
                      children: [
                        Text(
                          'Shop Smarter with Your\nPersonal Shopper',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.white,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                            height: 1.3,
                          ),
                        ),
                        20.verticalSpace,
                        Text(
                          'Let our personal shoppers find the best products that match your style, needs, and budget  from fashion and gadgets to everyday essentials.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.white.withValues(alpha: 0.75),
                            fontSize: 14.sp,
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 40.w,
                right: 40.w,
                bottom: 40.h,
              ),
              child: TouchOpacity(
                onTap: () => context.router.replace(const PersonalShopperRoute()),
                child: Container(
                  width: double.infinity,
                  height: 56.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Explore Now',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      8.horizontalSpace,
                      Icon(
                        Icons.chevron_right_rounded,
                        color: Colors.black,
                        size: 22.w,
                      ),
                    ],
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
