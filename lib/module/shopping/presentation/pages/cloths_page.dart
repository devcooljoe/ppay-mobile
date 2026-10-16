import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/module/shopping/presentation/providers/shopping_providers.dart';
import 'package:ppay_mobile/shared/utils/amount_formatter.dart';
import 'package:ppay_mobile/shared/widgets/cloths_filter_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/skeleton_loader.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';
import 'package:ppay_mobile/shared/widgets/your_cart_bottomsheet.dart';

@RoutePage()
class ClothsPage extends HookConsumerWidget {
  final String? categoryId;
  final String? categoryName;

  const ClothsPage({super.key, this.categoryId, this.categoryName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    final searchQuery = useState('');
    final productsState = ref.watch(getProductsProvider);
    final cartState = ref.watch(getCartProvider);
    final cartItemCount = cartState.value?.items.length ?? 0;
    final currentPage = useState(1);
    final allProducts = useState(<dynamic>[]);
    final isLoadingMore = useState(false);
    final hasMore = useState(true);
    final scrollController = useScrollController();

    // Active filters
    final activeMinPrice = useState<double?>(null);
    final activeMaxPrice = useState<double?>(null);
    final activeVariantFilters = useState<String?>(null);

    Future<void> loadPage(int page, {bool replace = false}) async {
      if (page == 1) {
        await ref
            .read(getProductsProvider.notifier)
            .call(
              categoryId: categoryId,
              search: searchQuery.value.isNotEmpty ? searchQuery.value : null,
              minPrice: activeMinPrice.value,
              maxPrice: activeMaxPrice.value,
              variantFilters: activeVariantFilters.value,
              page: 1,
              limit: 20,
            );
      } else {
        isLoadingMore.value = true;
        await ref
            .read(getProductsProvider.notifier)
            .call(
              categoryId: categoryId,
              search: searchQuery.value.isNotEmpty ? searchQuery.value : null,
              minPrice: activeMinPrice.value,
              maxPrice: activeMaxPrice.value,
              variantFilters: activeVariantFilters.value,
              page: page,
              limit: 20,
            );
        isLoadingMore.value = false;
      }
    }

    useEffect(() {
      Future.microtask(() async {
        currentPage.value = 1;
        allProducts.value = [];
        hasMore.value = true;
        await loadPage(1);
      });
      return null;
    }, []);

    // Sync allProducts when productsState changes
    ref.listen(getProductsProvider, (prev, next) {
      if (next.hasValue && next.value != null) {
        final newProducts = next.value!.products;
        final totalPages = next.value!.totalPages;
        if (currentPage.value == 1) {
          allProducts.value = newProducts;
        } else {
          allProducts.value = [...allProducts.value, ...newProducts];
        }
        hasMore.value = currentPage.value < totalPages;
      }
    });

    useEffect(() {
      void listener() => searchQuery.value = searchController.text;
      searchController.addListener(listener);
      return () => searchController.removeListener(listener);
    }, []);

    // Infinite scroll
    useEffect(() {
      void onScroll() {
        if (scrollController.position.pixels >=
                scrollController.position.maxScrollExtent - 200 &&
            hasMore.value &&
            !isLoadingMore.value &&
            !productsState.isLoading) {
          final nextPage = currentPage.value + 1;
          currentPage.value = nextPage;
          loadPage(nextPage);
        }
      }

      scrollController.addListener(onScroll);
      return () => scrollController.removeListener(onScroll);
    }, [scrollController, hasMore.value, isLoadingMore.value]);

    Future<void> onRefresh() async {
      currentPage.value = 1;
      allProducts.value = [];
      hasMore.value = true;
      await loadPage(1);
    }

    final products = allProducts.value;

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(
        title: categoryName ?? 'Gift Items',
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Row(
              children: [
                TouchOpacity(
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
                TouchOpacity(
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              16.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10).r,
                      ),
                      child: TextFormField(
                        controller: searchController,
                        onFieldSubmitted: (_) async {
                          currentPage.value = 1;
                          allProducts.value = [];
                          hasMore.value = true;
                          await loadPage(1);
                        },
                        decoration: InputDecoration(
                          prefixIcon: SizedBox(
                            height: 19.w,
                            width: 19.w,
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
                  11.horizontalSpace,
                  TouchOpacity(
                    onTap: () async {
                      final result =
                          await showModalBottomSheet<Map<String, dynamic>>(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder:
                                (_) => ClothsFilterBottomsheet(
                                  initialMinPrice: activeMinPrice.value,
                                  initialMaxPrice: activeMaxPrice.value,
                                  initialVariantFilters:
                                      activeVariantFilters.value,
                                ),
                          );
                      if (result != null) {
                        activeMinPrice.value = result['minPrice'] as double?;
                        activeMaxPrice.value = result['maxPrice'] as double?;
                        activeVariantFilters.value =
                            result['variantFilters'] as String?;
                        currentPage.value = 1;
                        allProducts.value = [];
                        hasMore.value = true;
                        await loadPage(1);
                      }
                    },
                    child: Container(
                      height: 50.h,
                      width: 84.w,
                      padding: EdgeInsets.symmetric(
                        horizontal: 11.w,
                        vertical: 10.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        border: Border.all(
                          width: 1.w,
                          color:
                              (activeMinPrice.value != null ||
                                      activeMaxPrice.value != null ||
                                      activeVariantFilters.value != null)
                                  ? PPaymobileColors.buttonColor
                                  : PPaymobileColors.filterBorderColor,
                        ),
                        color: PPaymobileColors.mainScreenBackground,
                      ),
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 14.w,
                              width: 14.w,
                              child: SvgPicture.asset(
                                'assets/icon/filter.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                            6.horizontalSpace,
                            Text(
                              'Filter',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              16.verticalSpace,
              Expanded(
                child:
                    productsState.isLoading && currentPage.value == 1
                        ? GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 14.w,
                                mainAxisSpacing: 14.h,
                                childAspectRatio: 0.68,
                              ),
                          itemCount: 6,
                          itemBuilder:
                              (_, __) => SkeletonLoader(
                                width: double.infinity,
                                height: double.infinity,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                        )
                        : products.isEmpty
                        ? Center(
                          child: Text(
                            'No gift items found',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: PPaymobileColors.svgIconColor,
                              fontSize: 14.sp,
                            ),
                          ),
                        )
                        : RefreshIndicator(
                          onRefresh: onRefresh,
                          color: PPaymobileColors.buttonColor,
                          child: GridView.builder(
                            controller: scrollController,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 14.w,
                                  mainAxisSpacing: 14.h,
                                  childAspectRatio: 0.68,
                                ),
                            itemCount:
                                products.length + (isLoadingMore.value ? 2 : 0),
                            itemBuilder: (context, index) {
                              if (index >= products.length) {
                                return SkeletonLoader(
                                  width: double.infinity,
                                  height: double.infinity,
                                  borderRadius: BorderRadius.circular(8.r),
                                );
                              }
                              final product = products[index];
                              final hasDiscount =
                                  product.discountPrice != null &&
                                  product.discountPrice! < product.price;
                              final discountPct =
                                  hasDiscount
                                      ? (((product.price -
                                                      product.discountPrice!) /
                                                  product.price) *
                                              100)
                                          .round()
                                      : 0;
                              return TouchOpacity(
                                onTap:
                                    () => context.router.push(
                                      ClothsDetailsRoute(productId: product.id),
                                    ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        PPaymobileColors.mainScreenBackground,
                                    borderRadius: BorderRadius.circular(8.r),
                                    border: Border.all(
                                      color:
                                          PPaymobileColors.deepBackgroundColor,
                                      width: 1.w,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(8).r,
                                          ),
                                          child: Stack(
                                            fit: StackFit.expand,
                                            children: [
                                              _ProductImage(
                                                imageUrl:
                                                    product
                                                                .images
                                                                ?.isNotEmpty ==
                                                            true
                                                        ? product
                                                            .images!
                                                            .first
                                                            .url
                                                        : null,
                                              ),
                                              if (hasDiscount)
                                                Positioned(
                                                  top: 8.h,
                                                  left: 8.w,
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                          horizontal: 6.w,
                                                          vertical: 3.h,
                                                        ),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          PPaymobileColors
                                                              .redTextfield,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            4.r,
                                                          ),
                                                    ),
                                                    child: Text(
                                                      '-$discountPct%',
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'InstrumentSans',
                                                        color: Colors.white,
                                                        fontSize: 10.sp,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8).r,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.star_rounded,
                                                  color: const Color(
                                                    0xFFFFC107,
                                                  ),
                                                  size: 13.w,
                                                ),
                                                2.horizontalSpace,
                                                Text(
                                                  product.averageRating > 0
                                                      ? product.averageRating
                                                          .toStringAsFixed(1)
                                                      : '0.0',
                                                  style: TextStyle(
                                                    fontFamily:
                                                        'InstrumentSans',
                                                    color: Colors.black,
                                                    fontSize: 11.sp,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                4.horizontalSpace,
                                                Text(
                                                  product.reviewCount > 0
                                                      ? '(${product.reviewCount})'
                                                      : 'No reviews',
                                                  style: TextStyle(
                                                    fontFamily:
                                                        'InstrumentSans',
                                                    color:
                                                        PPaymobileColors
                                                            .svgIconColor,
                                                    fontSize: 10.sp,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            4.verticalSpace,
                                            if (hasDiscount) ...[
                                              Text(
                                                '₦${AmountFormatter.formatBalance(product.price.toStringAsFixed(2))}',
                                                style: TextStyle(
                                                  fontFamily: 'InstrumentSans',
                                                  color:
                                                      PPaymobileColors
                                                          .textfiedBorder,
                                                  fontSize: 11.sp,
                                                  decoration:
                                                      TextDecoration
                                                          .lineThrough,
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
                            },
                          ),
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProductImage extends StatelessWidget {
  final String? imageUrl;

  const _ProductImage({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl!.isEmpty) {
      return Container(
        width: double.infinity,
        color: PPaymobileColors.deepBackgroundColor,
        child: Center(
          child: Icon(
            Icons.shopping_bag_outlined,
            color: PPaymobileColors.svgIconColor,
            size: 40.w,
          ),
        ),
      );
    }
    return CachedNetworkImage(
      imageUrl: imageUrl!,
      fit: BoxFit.cover,
      width: double.infinity,
      placeholder:
          (_, __) => Container(color: PPaymobileColors.deepBackgroundColor),
      errorWidget:
          (_, __, ___) => Container(
            color: PPaymobileColors.deepBackgroundColor,
            child: Center(
              child: Icon(
                Icons.shopping_bag_outlined,
                color: PPaymobileColors.svgIconColor,
                size: 40.w,
              ),
            ),
          ),
    );
  }
}
