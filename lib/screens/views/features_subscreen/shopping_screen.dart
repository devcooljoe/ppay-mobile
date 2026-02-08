import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/cloths_screen.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/watchlist_screen.dart';
import 'package:ppay_mobile/screens/widgets/carousel_item.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/item_carousel.dart';
import 'package:ppay_mobile/screens/widgets/shoping_packages_carousel.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  final PageController _itemController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: AppBar(
        backgroundColor: PPaymobileColors.mainScreenBackground,
        toolbarHeight: 56,
        leadingWidth: 56.w,
        title: Text(
          'Shopping',
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: SizedBox(
              height: 24.h,
              width: 24.w,
              child: SvgPicture.asset(
                'assets/icon/arrow_back.svg',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WatchlistScreen(),
                      ),
                    );
                  },
                  child: SizedBox(
                    height: 40.h,
                    width: 40.w,
                    child: Image.asset(
                      'assets/images/favorite.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                14.horizontalSpace,
                SizedBox(
                  height: 40.h,
                  width: 40.w,
                  child: Image.asset(
                    'assets/images/cart.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            25.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Container(
                height: 50.h,
                width: 400.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10).r,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: SizedBox(
                      height: 24.h,
                      width: 24.w,
                      child: SvgPicture.asset(
                        'assets/icon/bank_search.svg',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: PPaymobileColors.textfiedBorder,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    filled: true,
                    fillColor: PPaymobileColors.deepBackgroundColor,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 13.w,
                      vertical: 14.h,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10).r,
                    ),
                  ),
                ),
              ),
            ),
            25.verticalSpace,
            SizedBox(
              height: 184.h,
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _currentIndex = index);
                },
                children: [
                  CarouselItem(
                    title: 'iPhone 16 Pro Max Now ',
                    description: 'From ₦1,250,000 Exclusive Deal!',
                    backgroundImage: 'assets/images/shop_carousel_1.png',
                    textColor: PPaymobileColors.mainScreenBackground,
                    containerColor: PPaymobileColors.mainScreenBackground,
                    containerTextColor: Colors.black,
                    containerSvg: 'assets/icon/arrow_forward_1.svg',
                  ),
                  CarouselItem(
                    title: 'Smartwatches',
                    description: 'Slash Sale Starting at ₦11,999',
                    backgroundImage: 'assets/images/shop_carousel_2.png',
                    textColor: Colors.black,
                    containerColor: PPaymobileColors.buttonColor,
                    containerTextColor: PPaymobileColors.mainScreenBackground,
                    containerSvg: 'assets/icon/arrow_forwardw.svg',
                  ),
                  CarouselItem(
                    title: 'Trendy Handbags Now',
                    description: '₦8,000  Don’t Miss Out',
                    backgroundImage: 'assets/images/shop_carousel_3.png',
                    textColor: PPaymobileColors.mainScreenBackground,
                    containerColor: const Color.fromARGB(255, 40, 40, 40),
                    containerTextColor: PPaymobileColors.mainScreenBackground,
                    containerSvg: 'assets/icon/arrow_forwardw.svg',
                  ),
                  CarouselItem(
                    title: 'iGrab Wireless Earbuds ',
                    description: 'for Just ₦9,999 Limited Offer!',
                    backgroundImage: 'assets/images/shop_carousel_4.png',
                    textColor: PPaymobileColors.mainScreenBackground,
                    containerColor: PPaymobileColors.buttonColor,
                    containerTextColor: PPaymobileColors.mainScreenBackground,
                    containerSvg: 'assets/icon/arrow_forwardw.svg',
                  ),
                ],
              ),
            ),
            7.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                4,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: EdgeInsets.symmetric(horizontal: 11.w),
                  height: 13.h,
                  width: 13.w,
                  decoration: BoxDecoration(
                    color: _currentIndex == index
                        ? PPaymobileColors.buttonColor
                        : PPaymobileColors.deepBackgroundColor,
                    borderRadius: BorderRadius.circular(6.5.r),
                  ),
                ),
              ),
            ),
            22.verticalSpace,
            Padding(
              padding: EdgeInsets.only(left: 20.0.w),
              child: Text(
                'Item Categories',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            20.verticalSpace,
            Padding(
              padding: EdgeInsets.only(left: 20.0.w),
              child: SizedBox(
                height: 90.h,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ItemCarousel(backgroundImage: 'assets/images/item_1.png'),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ClothsScreen(),
                          ),
                        );
                      },
                      child: ItemCarousel(
                        backgroundImage: 'assets/images/item_2.png',
                      ),
                    ),
                    ItemCarousel(backgroundImage: 'assets/images/item_3.png'),
                    ItemCarousel(backgroundImage: 'assets/images/item_4.png'),
                    ItemCarousel(backgroundImage: 'assets/images/item_5.png'),
                  ],
                ),
              ),
            ),
            41.verticalSpace,
            Padding(
              padding: EdgeInsets.only(left: 20.0.w),
              child: Text(
                'Special Packages',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            20.verticalSpace,
            Padding(
              padding: EdgeInsets.only(left: 20.0.w),
              child: SizedBox(
                height: 165.h,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ShopingPackagesCarousel(
                      backgroundImage: 'assets/images/special_1.png',
                    ),
                    ShopingPackagesCarousel(
                      backgroundImage: 'assets/images/special_2.png',
                    ),
                    ShopingPackagesCarousel(
                      backgroundImage: 'assets/images/special_3.png',
                    ),
                  ],
                ),
              ),
            ),
            41.verticalSpace,
            Padding(
              padding: EdgeInsets.only(left: 20.0.w),
              child: Text(
                'More For You',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            14.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 170.h,
                    width: 192.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 141.h,
                          width: 192.w,
                          child: Image.asset(
                            'assets/images/more_1.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        6.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Man's Wear",
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 15.h,
                                  width: 15.w,
                                  child: Image.asset(
                                    'assets/images/star.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Text(
                                  "4.5",
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 170.h,
                    width: 192.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 141.h,
                          width: 192.w,
                          child: Image.asset(
                            'assets/images/more_2.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        6.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Necklace",
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 15.h,
                                  width: 15.w,
                                  child: Image.asset(
                                    'assets/images/star.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Text(
                                  "4.5",
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            14.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 170.h,
                    width: 192.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 141.h,
                          width: 192.w,
                          child: Image.asset(
                            'assets/images/more_3.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        6.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Man's Formal Shoe",
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 15.h,
                                  width: 15.w,
                                  child: Image.asset(
                                    'assets/images/star.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Text(
                                  "4.5",
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 170.h,
                    width: 192.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 141.h,
                          width: 192.w,
                          child: Image.asset(
                            'assets/images/more_4.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        6.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Relex Watch",
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 15.h,
                                  width: 15.w,
                                  child: Image.asset(
                                    'assets/images/star.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Text(
                                  "4.5",
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
