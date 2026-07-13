import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/module/shopping/domain/entities/shopping_entity.dart';
import 'package:ppay_mobile/module/shopping/presentation/providers/shopping_providers.dart';
import 'package:ppay_mobile/shared/utils/amount_formatter.dart';
import 'package:ppay_mobile/shared/widgets/carousel_item.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/skeleton_loader.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';
import 'package:ppay_mobile/shared/widgets/your_cart_bottomsheet.dart';

@RoutePage()
class ShoppingPage extends HookConsumerWidget {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = useState(0);
    final pageController = usePageController();
    final searchController = useTextEditingController();
    final searchQuery = useState('');
    final homepageState = ref.watch(getHomepageProvider);
    final productsState = ref.watch(getProductsProvider);
    final cartState = ref.watch(getCartProvider);

    useEffect(() {
      Future.microtask(() {
        ref.read(getHomepageProvider.notifier).call();
        ref.read(getProductsProvider.notifier).call();
        ref.read(getCartProvider.notifier).call();
      });
      return null;
    }, []);

    useEffect(() {
      void listener() => searchQuery.value = searchController.text;
      searchController.addListener(listener);
      return () => searchController.removeListener(listener);
    }, []);

    void onSearch() {
      if (searchQuery.value.isNotEmpty) {
        ref.read(getProductsProvider.notifier).call(search: searchQuery.value);
      }
    }

    final categories = homepageState.value?.categories ?? [];
    final featuredProducts = homepageState.value?.featuredProducts ?? [];
    final allProducts = productsState.value?.products ?? [];
    final cartItemCount = cartState.value?.items.length ?? 0;

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
                  onTap: () => context.router.push(WatchlistRoute()),
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
                GestureDetector(
                  onTap: () async {
                    await showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => const YourCartBottomsheet(),
                    );
                  },
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 40.w,
                        width: 40.w,
                        child: Image.asset(
                          'assets/images/cart.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      if (cartItemCount > 0)
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            width: 16.w,
                            height: 16.w,
                            decoration: BoxDecoration(
                              color: PPaymobileColors.redTextfield,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '$cartItemCount',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  color: Colors.white,
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
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
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                height: 50.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10).r,
                ),
                child: TextFormField(
                  controller: searchController,
                  onFieldSubmitted: (_) => onSearch(),
                  decoration: InputDecoration(
                    prefixIcon: SizedBox(
                      height: 24.w,
                      width: 24.w,
                      child: SvgPicture.asset(
                        'assets/icon/bank_search.svg',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    hintText: 'Search products',
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

            // Carousel
            SizedBox(
              height: 184.h,
              child: PageView(
                controller: pageController,
                onPageChanged: (index) => currentIndex.value = index,
                children: [
                  CarouselItem(
                    title: 'iPhone 16 Pro Max Now',
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
                    description: '₦8,000 Don\'t Miss Out',
                    backgroundImage: 'assets/images/shop_carousel_3.png',
                    textColor: PPaymobileColors.mainScreenBackground,
                    containerColor: const Color.fromARGB(255, 40, 40, 40),
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
                3,
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

            // Categories
            Padding(
              padding: EdgeInsets.only(left: 20.w),
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
            homepageState.isLoading
                ? Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: SizedBox(
                      height: 90.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        separatorBuilder: (_, __) => 12.horizontalSpace,
                        itemBuilder: (_, __) => SkeletonLoader(
                          width: 80.w,
                          height: 80.w,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: SizedBox(
                      height: 90.h,
                      child: categories.isEmpty
                          ? ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                _CategoryItem(
                                  name: 'Clothes',
                                  iconUrl: 'assets/images/item_2.png',
                                  isAsset: true,
                                  onTap: () =>
                                      context.router.push(ClothsRoute()),
                                ),
                                _CategoryItem(
                                  name: 'Electronics',
                                  iconUrl: 'assets/images/item_1.png',
                                  isAsset: true,
                                ),
                                _CategoryItem(
                                  name: 'Accessories',
                                  iconUrl: 'assets/images/item_3.png',
                                  isAsset: true,
                                ),
                              ],
                            )
                          : ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: categories.length,
                              separatorBuilder: (_, __) => 12.horizontalSpace,
                              itemBuilder: (context, index) {
                                final cat = categories[index];
                                return _CategoryItem(
                                  name: cat.name,
                                  iconUrl: cat.iconUrl,
                                  onTap: () => ref
                                      .read(getProductsProvider.notifier)
                                      .call(categoryId: cat.id),
                                );
                              },
                            ),
                    ),
                  ),
            41.verticalSpace,

            // Featured Products
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Text(
                'Featured Products',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            20.verticalSpace,
            homepageState.isLoading
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SkeletonLoader(
                          width: 170.w,
                          height: 200.h,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        SkeletonLoader(
                          width: 170.w,
                          height: 200.h,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ],
                    ),
                  )
                : featuredProducts.isEmpty
                ? const SizedBox.shrink()
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Wrap(
                      spacing: 12.w,
                      runSpacing: 12.h,
                      children: featuredProducts
                          .map((p) => _ProductCard(product: p))
                          .toList(),
                    ),
                  ),
            41.verticalSpace,

            // All Products
            Padding(
              padding: EdgeInsets.only(left: 20.w),
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
            productsState.isLoading
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: List.generate(
                        2,
                        (_) => Padding(
                          padding: EdgeInsets.only(bottom: 14.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SkeletonLoader(
                                width: 170.w,
                                height: 200.h,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              SkeletonLoader(
                                width: 170.w,
                                height: 200.h,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : allProducts.isEmpty
                ? Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: Text(
                        'No products found',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: PPaymobileColors.svgIconColor,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Wrap(
                      spacing: 12.w,
                      runSpacing: 14.h,
                      children: allProducts
                          .map((p) => _ProductCard(product: p))
                          .toList(),
                    ),
                  ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final String name;
  final String iconUrl;
  final bool isAsset;
  final VoidCallback? onTap;

  const _CategoryItem({
    required this.name,
    required this.iconUrl,
    this.isAsset = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 60.w,
            height: 60.w,
            decoration: BoxDecoration(
              color: PPaymobileColors.deepBackgroundColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: isAsset
                ? Image.asset(iconUrl, fit: BoxFit.contain)
                : CachedNetworkImage(
                    imageUrl: iconUrl,
                    fit: BoxFit.contain,
                    errorWidget: (_, __, ___) => Icon(
                      Icons.category,
                      color: PPaymobileColors.svgIconColor,
                    ),
                  ),
          ),
          4.verticalSpace,
          Text(
            name,
            style: TextStyle(
              fontFamily: 'InstrumentSans',
              color: Colors.black,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final ProductEntity product;

  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    final hasDiscount =
        product.discountPrice != null && product.discountPrice! < product.price;
    final discountPct = hasDiscount
        ? (((product.price - product.discountPrice!) / product.price) * 100)
              .round()
        : 0;
    return GestureDetector(
      onTap: () =>
          context.router.push(ClothsDetailsRoute(productId: product.id)),
      child: Container(
        width: 170.w,
        decoration: BoxDecoration(
          color: PPaymobileColors.mainScreenBackground,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: PPaymobileColors.deepBackgroundColor,
            width: 1.w,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8).r),
              child: Stack(
                children: [
                  product.images != null && product.images!.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: product.images!.first.url,
                          height: 130.h,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          placeholder: (_, __) => Container(
                            height: 130.h,
                            color: PPaymobileColors.deepBackgroundColor,
                            child: Center(
                              child: Icon(
                                Icons.shopping_bag_outlined,
                                color: PPaymobileColors.svgIconColor,
                                size: 40.w,
                              ),
                            ),
                          ),
                          errorWidget: (_, __, ___) => Container(
                            height: 130.h,
                            color: PPaymobileColors.deepBackgroundColor,
                            child: Center(
                              child: Icon(
                                Icons.shopping_bag_outlined,
                                color: PPaymobileColors.svgIconColor,
                                size: 40.w,
                              ),
                            ),
                          ),
                        )
                      : Container(
                          height: 130.h,
                          width: double.infinity,
                          color: PPaymobileColors.deepBackgroundColor,
                          child: Center(
                            child: Icon(
                              Icons.shopping_bag_outlined,
                              color: PPaymobileColors.svgIconColor,
                              size: 40.w,
                            ),
                          ),
                        ),
                  if (hasDiscount)
                    Positioned(
                      top: 8.h,
                      left: 8.w,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.w,
                          vertical: 3.h,
                        ),
                        decoration: BoxDecoration(
                          color: PPaymobileColors.redTextfield,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Text(
                          '-$discountPct%',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.white,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  4.verticalSpace,
                  if (hasDiscount) ...[
                    Text(
                      '₦${AmountFormatter.formatBalance(product.price.toStringAsFixed(2))}',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: PPaymobileColors.textfiedBorder,
                        fontSize: 11.sp,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    Text(
                      '₦${AmountFormatter.formatBalance(product.discountPrice!.toStringAsFixed(2))}',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ] else
                    Text(
                      '₦${AmountFormatter.formatBalance(product.price.toStringAsFixed(2))}',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        color: Colors.black,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
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
