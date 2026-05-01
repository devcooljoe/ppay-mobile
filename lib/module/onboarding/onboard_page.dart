import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/shared/models/onboard_item_model.dart';
import 'package:ppay_mobile/module/auth/login_page.dart';
import 'package:ppay_mobile/module/auth/signup_page.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

@RoutePage()
class OnboardPage extends HookConsumerWidget {
  const OnboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: PPaymobileColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            /// PageView
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: pages.length,
                onPageChanged: (index) {
                  currentIndex.value = index;
  }
},
                itemBuilder: (context, index) {
                  final item = pages[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      35.verticalSpace,

                      /// Title
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            item.title,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w600,
                              color: PPaymobileColors.highlightTextColor,
                            ),
                          ),
                          5.horizontalSpace,
                          Text(
                            item.highlight,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      16.verticalSpace,

                      /// Image
                      Stack(
                        children: [
                          SizedBox(
                            height: 361.h,
                            child: Image.asset(item.image, fit: BoxFit.contain),
                          ),
                          Positioned(
                            left: item.space1.w,
                            top: item.space2.h,
                            child: SizedBox(
                              height: item.imageHeight.h,
                              child: Image.asset(
                                item.imagePath,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],

                },
              ),
            ),

            /// Smooth Indicator
            SmoothPageIndicator(
              controller: _pageController,
              count: pages.length,
              effect: ExpandingDotsEffect(
                activeDotColor: PPaymobileColors.highlightTextColor,
                dotColor: Color(0xffE6E6E6),
                dotHeight: 8.h,
                dotWidth: 18.w,
                expansionFactor: 3,
                spacing: 9.0.w,
              ),
            ),

            29.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                pages[currentIndex].description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: PPaymobileColors.mainScreenBackground,
                ),
              ),
            ),
            37.verticalSpace,

            /// Get Started Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: PPaymobileColors.buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(42),
                    ),
                  ),
                  onPressed: () {
                    context.router.push(SignupRoute());
                  },
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            23.verticalSpace,

            /// Sign in
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color: Colors.white,
                  ),
                ),
                5.horizontalSpace,
                TouchOpacity(
                  onTap: () {
                    context.router.push(LoginRoute());
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: PPaymobileColors.highlightTextColor,
                    ),
                  ),
                ),
              ],
            ),

            85.verticalSpace,
          ],
        ),
              ),
      ),
    );  }
