import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppay_mobile/model/onboarditem_model.dart';
import 'package:ppay_mobile/screens/views/login_screen.dart';
import 'package:ppay_mobile/screens/views/signup_screen.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  final List<OnboardItem> pages = [
    OnboardItem(
      title: 'FUND',
      highlight: '& PAY EASILY',
      image: 'assets/images/first.png',
      description:
          'Top up your NGN wallet instantly and pay for bills, airtime, data, and more all in one place.',
      imagePath: 'assets/images/WRAPPER1.png',
      imageHeight: 228,
      space1: 278,
      space2: 115,
    ),
    OnboardItem(
      title: 'TRADE',
      highlight: 'CRYPTO & GIFTCARDS',
      image: 'assets/images/second.png',
      description:
          'Buy, sell, and receive crypto, plus trade giftcards at the best rates with fast approvals.',
      imagePath: 'assets/images/WRAPPER2.png',
      imageHeight: 82,
      space1: 235,
      space2: 268,
    ),
    OnboardItem(
      title: 'SHOP',
      highlight: '& SEND GIFTS',
      image: 'assets/images/third.png',
      description:
          'Purchase items from our Shopper store and send gifts to friends or family anywhere',
      imagePath: 'assets/images/WRAPPER3.png',
      imageHeight: 108,
      space1: 28,
      space2: 73,
    ),
    OnboardItem(
      title: 'BOOK',
      highlight: 'FLIGHT & USE CARD',
      image: 'assets/images/fourth.png',
      description:
          'Book local or international flights and enjoy a secure virtual dollar card for your Payment',
      imagePath: 'assets/images/WRAPPER4.png',
      imageHeight: 129,
      space1: 262,
      space2: 133,
    ),
  ];

  @override
  Widget build(BuildContext context) {
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
                  setState(() => currentIndex = index);
                },
                itemBuilder: (context, index) {
                  final item = pages[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      97.verticalSpace,

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
                  );
                },
              ),
            ),

            /// Smooth Indicator
            SmoothPageIndicator(
              controller: _pageController,
              count: pages.length,
              effect: ExpandingDotsEffect(
                activeDotColor: PPaymobileColors.highlightTextColor,
                dotColor: Colors.white30,
                dotHeight: 6.h,
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
                  color: Colors.white70,
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupScreen()),
                    );
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
                    color: Colors.white70,
                  ),
                ),
                5.horizontalSpace,
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
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
    );
  }
}
