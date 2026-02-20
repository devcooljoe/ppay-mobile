import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/screens/views/features_subscreen/watchlist_screen.dart';
import 'package:ppay_mobile/screens/widgets/colors.dart';
import 'package:ppay_mobile/screens/widgets/product_detail_bottomsheet.dart';
import 'package:ppay_mobile/screens/widgets/review_bottomsheet.dart';
import 'package:ppay_mobile/screens/widgets/touch_opacity.dart';
import 'package:ppay_mobile/screens/widgets/your_cart_bottomsheet.dart';

class ClothsDetailsScreen extends StatefulWidget {
  const ClothsDetailsScreen({super.key});

  @override
  State<ClothsDetailsScreen> createState() => _ClothsDetailsScreenState();
}

class _ClothsDetailsScreenState extends State<ClothsDetailsScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: AppBar(
        backgroundColor: PPaymobileColors.mainScreenBackground,
        toolbarHeight: 56,
        leadingWidth: 56.w,
        title: Text(
          'Cloths',
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: TouchOpacity(
            onTap: () => Navigator.pop(context),
            child: SizedBox(
              height: 24.h,
              width: 24.w,
              child: SvgPicture.asset(
                'assets/icon/arrow_back.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Row(
              children: [
                TouchOpacity(
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
                TouchOpacity(
                  onTap: () async {
                    await showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => const YourCartBottomsheet(),
                    );
                  },
                  child: SizedBox(
                    height: 40.h,
                    width: 40.w,
                    child: Image.asset(
                      'assets/images/cart.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              41.verticalSpace,
              SizedBox(
                height: 286.h,
                width: double.infinity,
                child: Stack(
                  children: [
                    SizedBox(
                      height: 286.h,
                      width: double.infinity,
                      child: PageView(
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() => _currentIndex = index);
                        },
                        children: [
                          Image.asset(
                            'assets/images/cloths_5.png',
                            fit: BoxFit.contain,
                          ),
                          Image.asset(
                            'assets/images/cloths_5.png',
                            fit: BoxFit.contain,
                          ),
                          Image.asset(
                            'assets/images/cloths_5.png',
                            fit: BoxFit.contain,
                          ),
                          Image.asset(
                            'assets/images/cloths_5.png',
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 251.h,
                      left: 157.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          4,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            margin: EdgeInsets.symmetric(horizontal: 8.9.w),
                            height: 13.h,
                            width: 13.w,
                            decoration: BoxDecoration(
                              color: _currentIndex == index
                                  ? PPaymobileColors.buttonColor
                                  : PPaymobileColors.lightGrey,
                              borderRadius: BorderRadius.circular(6.5.r),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 15.h,
                      right: 11.w,
                      child: Row(
                        children: [
                          SizedBox(
                            height: 40.h,
                            width: 40.w,
                            child: Image.asset(
                              'assets/images/share_1.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          14.horizontalSpace,
                          SizedBox(
                            height: 40.h,
                            width: 40.w,
                            child: Image.asset(
                              'assets/images/favorite_1.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              21.verticalSpace,
              Text(
                "Female Black Gown",
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              10.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 36.h,
                    width: 85.w,
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: PPaymobileColors.mainScreenBackground,
                      borderRadius: BorderRadius.circular(55.r),
                      border: Border.all(
                        color: PPaymobileColors.textfiedBorder,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 24.h,
                          width: 24.w,
                          child: Image.asset(
                            'assets/images/star.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        2.horizontalSpace,
                        Text(
                          "4.5",
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  24.horizontalSpace,
                  Container(
                    height: 36.h,
                    width: 85.w,
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: PPaymobileColors.mainScreenBackground,
                      borderRadius: BorderRadius.circular(55.r),
                      border: Border.all(
                        color: PPaymobileColors.textfiedBorder,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 24.h,
                          width: 24.w,
                          child: Image.asset(
                            'assets/images/heart.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        2.horizontalSpace,
                        Text(
                          "4.5",
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  19.horizontalSpace,
                  Text(
                    "1.2k Reviews",
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      color: PPaymobileColors.lightGrey,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              13.horizontalSpace,
              Text(
                'A must-have wardrobe essential, this Black Plain T-Shirt offers a perfect blend of comfort, durability, and style.',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              40.verticalSpace,
              Text(
                'Available Colors',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              16.verticalSpace,
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  height: 49.h,
                  width: 293.w,
                  child: Image.asset(
                    'assets/images/color.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              48.verticalSpace,
              Text(
                'Quantity',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              16.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 44.h,
                    width: 44.w,
                    padding: EdgeInsets.all(10).r,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: PPaymobileColors.svgIconColor,
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.circular(7).r,
                      color: PPaymobileColors.mainScreenBackground,
                    ),
                    child: Center(
                      child: SizedBox(
                        height: 20.h,
                        width: 20.w,
                        child: SvgPicture.asset(
                          'assets/icon/minus.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  20.horizontalSpace,
                  Text(
                    "2",
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  20.horizontalSpace,
                  Container(
                    height: 44.h,
                    width: 44.w,
                    padding: EdgeInsets.all(10).r,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: PPaymobileColors.svgIconColor,
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.circular(7).r,
                      color: PPaymobileColors.mainScreenBackground,
                    ),
                    child: Center(
                      child: SizedBox(
                        height: 20.h,
                        width: 20.w,
                        child: SvgPicture.asset(
                          'assets/icon/add.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              40.verticalSpace,
              Text(
                'Size',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              22.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 42.h,
                    width: 48.w,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4).r,
                      color: PPaymobileColors.buttonColor,
                    ),
                    child: Center(
                      child: Text(
                        'S',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          color: PPaymobileColors.mainScreenBackground,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  24.horizontalSpace,
                  Container(
                    height: 42.h,
                    width: 48.w,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4).r,
                      color: PPaymobileColors.deepBackgroundColor,
                    ),
                    child: Center(
                      child: Text(
                        'M',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  24.horizontalSpace,
                  Container(
                    height: 42.h,
                    width: 48.w,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4).r,
                      color: PPaymobileColors.deepBackgroundColor,
                    ),
                    child: Center(
                      child: Text(
                        'XL',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  24.horizontalSpace,
                  Container(
                    height: 42.h,
                    width: 48.w,
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4).r,
                      color: PPaymobileColors.deepBackgroundColor,
                    ),
                    child: Center(
                      child: Text(
                        'XXL',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  24.horizontalSpace,
                  Container(
                    height: 42.h,
                    width: 48.w,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4).r,
                      color: PPaymobileColors.deepBackgroundColor,
                    ),
                    child: Center(
                      child: Text(
                        '3L',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              22.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24.h,
                    width: 24.w,
                    child: SvgPicture.asset(
                      'assets/icon/stock.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                  12.horizontalSpace,
                  Text(
                    '24 Available in stock',
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              19.verticalSpace,
              Divider(color: PPaymobileColors.textfiedBorder, thickness: 1.h),
              29.verticalSpace,
              TouchOpacity(
                onTap: () async {
                  await showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (_) => const ProductDetailBottomsheet(),
                  );
                },
                child: Container(
                  height: 52.h,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: 14.h,
                    horizontal: 12.w,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: PPaymobileColors.textfiedBorder,
                        width: 1.h,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 24.h,
                                width: 24.w,
                                child: SvgPicture.asset(
                                  'assets/icon/detail.svg',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              16.horizontalSpace,
                              Text(
                                "Product Detail",
                                style: TextStyle(
                                  fontFamily: 'Gilroy',
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24.h,
                        width: 24.w,
                        child: SvgPicture.asset(
                          'assets/icon/arrow_forward.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              19.verticalSpace,
              TouchOpacity(
                onTap: () async {
                  await showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (_) => const ReviewBottomsheet(),
                  );
                },
                child: Container(
                  height: 52.h,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: 14.h,
                    horizontal: 12.w,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: PPaymobileColors.textfiedBorder,
                        width: 1.h,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 24.h,
                            width: 24.w,
                            child: SvgPicture.asset(
                              'assets/icon/review.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                          16.horizontalSpace,
                          Text(
                            "Reviews",
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24.h,
                        width: 24.w,
                        child: SvgPicture.asset(
                          'assets/icon/arrow_forward.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              17.verticalSpace,
              SizedBox(
                height: 62.h,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '₦88,000',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.textfiedBorder,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.lineThrough,
                            decorationStyle: TextDecorationStyle.solid,
                          ),
                        ),
                        Text(
                          '₦858,000',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    TouchOpacity(
                      onTap: () async {
                        await showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (_) => const YourCartBottomsheet(),
                        );
                      },
                      child: Container(
                        height: 50.h,
                        width: 244.w,
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(56).r,
                          color: PPaymobileColors.buttonColorandText,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Add to Cart',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            6.horizontalSpace,

                            SizedBox(
                              height: 24.h,
                              width: 24.h,
                              child: SvgPicture.asset(
                                'assets/icon/cart_!.svg',
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
              17.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
