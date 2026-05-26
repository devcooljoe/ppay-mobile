import 'package:flutter/material.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppay_mobile/shared/widgets/carousel_item.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/item_carousel.dart';
import 'package:ppay_mobile/shared/widgets/shoping_packages_carousel.dart';
import 'package:ppay_mobile/shared/widgets/product_card.dart';

@RoutePage()
class ShoppingPage extends HookConsumerWidget {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = useState(0);
    final pageController = usePageController();
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
          child: TouchOpacity(
            onTap: () => Navigator.pop(context),
            child: SizedBox(
              height: 24.w,
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
                GestureDetector(
                  onTap: () {
                    context.router.push(WatchlistRoute());
                  },
                  child: SizedBox(
                    height: 40.w,
                    width: 40.w,
                    child: Image.asset(
                      'assets/images/favorite.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                14.horizontalSpace,
                SizedBox(
                  height: 40.w,
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
                      height: 24.w,
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
                controller: pageController,
                onPageChanged: (index) => currentIndex.value = index,
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
                  height: 13.w,
                  width: 13.w,
                  decoration: BoxDecoration(
                    color: currentIndex.value == index
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
                        context.router.push(ClothsRoute());
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
                  ProductCard(
                    imagePath: 'assets/images/more_1.png',
                    title: "Man's Wear",
                    rating: "4.5",
                  ),
                  ProductCard(
                    imagePath: 'assets/images/more_2.png',
                    title: "Necklace",
                    rating: "4.5",
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
                  ProductCard(
                    imagePath: 'assets/images/more_3.png',
                    title: "Man's Formal Shoe",
                    rating: "4.5",
                  ),
                  ProductCard(
                    imagePath: 'assets/images/more_4.png',
                    title: "Relex Watch",
                    rating: "4.5",
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
