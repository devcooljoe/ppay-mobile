import 'package:flutter/material.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/shopping/presentation/providers/shopping_providers.dart';
import 'package:ppay_mobile/shared/utils/amount_formatter.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/product_detail_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/review_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/skeleton_loader.dart';
import 'package:ppay_mobile/shared/widgets/your_cart_bottomsheet.dart';

@RoutePage()
class ClothsDetailsPage extends HookConsumerWidget {
  final String productId;

  const ClothsDetailsPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = useState(0);
    final pageController = usePageController();
    final selectedVariantId = useState<String?>(null);
    final quantity = useState(1);
    final productState = ref.watch(getProductDetailsProvider);
    final addToCartState = ref.watch(addToCartProvider);

    useEffect(() {
      Future.microtask(() => ref.read(getProductDetailsProvider.notifier).call(productId));
      return null;
    }, [productId]);

    final product = productState.value;

    Future<void> onAddToCart() async {
      if (product == null) return;
      if (product.variants.isNotEmpty && selectedVariantId.value == null) {
        MessageHandler.showErrorSnackBar(context, 'Please select a variant');
        return;
      }
      await ref.read(addToCartProvider.notifier).call(
        productId: product.id,
        variantId: selectedVariantId.value,
        quantity: quantity.value,
      );
      if (!context.mounted) return;
      final state = ref.read(addToCartProvider);
      if (state.hasError) {
        MessageHandler.showErrorSnackBar(context, state.error.toString());
      } else {
        ref.read(getCartProvider.notifier).call();
        await showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (_) => const YourCartBottomsheet(),
        );
      }
    }

    Future<void> onAddToWatchlist() async {
      if (product == null) return;
      await ref.read(addToWatchlistProvider.notifier).call(product.id);
      if (!context.mounted) return;
      final state = ref.read(addToWatchlistProvider);
      if (state.hasError) {
        MessageHandler.showErrorSnackBar(context, state.error.toString());
      } else {
        MessageHandler.showSuccessSnackBar(context, 'Added to wishlist');
      }
    }

    final hasDiscount = product != null &&
        product.discountPrice != null &&
        product.discountPrice! < product.price;
    final displayPrice = hasDiscount ? product!.discountPrice! : (product?.price ?? 0.0);
    final originalPrice = product?.price ?? 0.0;

    final sizes = product?.variants
        .map((v) => v.attributes['size']?.toString())
        .where((s) => s != null)
        .toSet()
        .toList() ?? [];
    final colors = product?.variants
        .map((v) => v.attributes['color']?.toString())
        .where((c) => c != null)
        .toSet()
        .toList() ?? [];

    final selectedSize = useState<String?>(sizes.isNotEmpty ? sizes.first : null);
    final selectedColor = useState<String?>(colors.isNotEmpty ? colors.first : null);

    // Find matching variant
    useEffect(() {
      if (product == null) return null;
      final match = product.variants.where((v) {
        final sizeMatch = selectedSize.value == null || v.attributes['size'] == selectedSize.value;
        final colorMatch = selectedColor.value == null || v.attributes['color'] == selectedColor.value;
        return sizeMatch && colorMatch;
      }).firstOrNull;
      selectedVariantId.value = match?.id;
      return null;
    }, [selectedSize.value, selectedColor.value, product]);

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(
        title: product?.name ?? 'Product',
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Row(
              children: [
                TouchOpacity(
                  onTap: onAddToWatchlist,
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
                  child: SizedBox(
                    height: 40.w,
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
      body: productState.isLoading
          ? _LoadingSkeleton()
          : productState.hasError
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Failed to load product',
                        style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 16.sp),
                      ),
                      16.verticalSpace,
                      TextButton(
                        onPressed: () => ref.read(getProductDetailsProvider.notifier).call(productId),
                        child: Text('Retry', style: TextStyle(color: PPaymobileColors.buttonColor)),
                      ),
                    ],
                  ),
                )
              : product == null
                  ? const SizedBox.shrink()
                  : SafeArea(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: ListView(
                          children: [
                            41.verticalSpace,
                            // Product Images
                            SizedBox(
                              height: 286.h,
                              width: double.infinity,
                              child: Stack(
                                children: [
                                  SizedBox(
                                    height: 286.h,
                                    width: double.infinity,
                                    child: PageView.builder(
                                      controller: pageController,
                                      onPageChanged: (index) => currentIndex.value = index,
                                      itemCount: (product.images?.isNotEmpty == true)
                                          ? product.images!.length
                                          : 1,
                                      itemBuilder: (context, index) {
                                        final images = product.images;
                                        if (images != null && images.isNotEmpty) {
                                          return CachedNetworkImage(
                                            imageUrl: images[index].url,
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                            placeholder: (_, __) => Container(
                                              color: PPaymobileColors.deepBackgroundColor,
                                            ),
                                            errorWidget: (_, __, ___) => Container(
                                              color: PPaymobileColors.deepBackgroundColor,
                                              child: Center(
                                                child: Icon(
                                                  Icons.shopping_bag_outlined,
                                                  color: PPaymobileColors.svgIconColor,
                                                  size: 80.w,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        return Container(
                                          color: PPaymobileColors.deepBackgroundColor,
                                          child: Center(
                                            child: Icon(
                                              Icons.shopping_bag_outlined,
                                              color: PPaymobileColors.svgIconColor,
                                              size: 80.w,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  if ((product.images?.length ?? 0) > 1)
                                    Positioned(
                                      top: 251.h,
                                      left: 0,
                                      right: 0,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: List.generate(
                                          product.images!.length.clamp(0, 5),
                                          (index) => AnimatedContainer(
                                            duration: const Duration(milliseconds: 200),
                                            margin: EdgeInsets.symmetric(horizontal: 8.9.w),
                                            height: 13.w,
                                            width: 13.w,
                                            decoration: BoxDecoration(
                                              color: currentIndex.value == index
                                                  ? PPaymobileColors.buttonColor
                                                  : PPaymobileColors.lightGrey,
                                              borderRadius: BorderRadius.circular(6.5.r),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            21.verticalSpace,
                            Text(
                              product.name,
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            10.verticalSpace,
                            Text(
                              product.description,
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            // Colors
                            if (colors.isNotEmpty) ...[
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
                              Wrap(
                                spacing: 8.w,
                                children: colors.map((color) {
                                  final isSelected = selectedColor.value == color;
                                  return GestureDetector(
                                    onTap: () => selectedColor.value = color,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20).r,
                                        border: Border.all(
                                          color: isSelected ? PPaymobileColors.buttonColor : PPaymobileColors.textfiedBorder,
                                          width: isSelected ? 2.w : 1.w,
                                        ),
                                        color: isSelected ? PPaymobileColors.doneColor : PPaymobileColors.mainScreenBackground,
                                      ),
                                      child: Text(
                                        color!,
                                        style: TextStyle(
                                          fontFamily: 'InstrumentSans',
                                          color: Colors.black,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                            // Sizes
                            if (sizes.isNotEmpty) ...[
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
                              Wrap(
                                spacing: 16.w,
                                children: sizes.map((size) {
                                  final isSelected = selectedSize.value == size;
                                  return GestureDetector(
                                    onTap: () => selectedSize.value = size,
                                    child: Container(
                                      width: 48.w,
                                      height: 48.w,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: isSelected ? PPaymobileColors.buttonColor : PPaymobileColors.textfiedBorder,
                                          width: isSelected ? 2.w : 1.w,
                                        ),
                                        color: isSelected ? PPaymobileColors.buttonColor : PPaymobileColors.mainScreenBackground,
                                      ),
                                      child: Center(
                                        child: Text(
                                          size!,
                                          style: TextStyle(
                                            fontFamily: 'InstrumentSans',
                                            color: isSelected ? Colors.white : Colors.black,
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                            40.verticalSpace,
                            // Quantity
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
                              children: [
                                TouchOpacity(
                                  onTap: () { if (quantity.value > 1) quantity.value--; },
                                  child: SizedBox(height: 38.w, width: 38.w, child: Image.asset('assets/images/remove_green.png', fit: BoxFit.contain)),
                                ),
                                16.horizontalSpace,
                                Text(
                                  '${quantity.value}',
                                  style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w500),
                                ),
                                16.horizontalSpace,
                                TouchOpacity(
                                  onTap: () => quantity.value++,
                                  child: SizedBox(height: 38.w, width: 38.w, child: Image.asset('assets/images/add_green.png', fit: BoxFit.contain)),
                                ),
                              ],
                            ),
                            22.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 24.w,
                                  width: 24.w,
                                  child: SvgPicture.asset(
                                    'assets/icon/stock.svg',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                12.horizontalSpace,
                                Text(
                                  product.inStock
                                      ? '${product.stockQuantity} Available in stock'
                                      : 'Out of stock',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: product.inStock ? Colors.black : PPaymobileColors.redTextfield,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            19.verticalSpace,
                            Divider(color: PPaymobileColors.textfiedBorder, thickness: 1.h),
                            29.verticalSpace,
                            // Product Detail
                            TouchOpacity(
                              onTap: () async {
                                await showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  builder: (_) => ProductDetailBottomsheet(product: product),
                                );
                              },
                              child: Container(
                                height: 52.h,
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: PPaymobileColors.textfiedBorder, width: 1.h),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(height: 24.w, width: 24.w, child: SvgPicture.asset('assets/icon/detail.svg', fit: BoxFit.contain)),
                                        16.horizontalSpace,
                                        Text('Product Detail', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w400)),
                                      ],
                                    ),
                                    SizedBox(height: 24.w, width: 24.w, child: SvgPicture.asset('assets/icon/arrow_forward.svg', fit: BoxFit.contain)),
                                  ],
                                ),
                              ),
                            ),
                            19.verticalSpace,
                            // Reviews
                            TouchOpacity(
                              onTap: () async {
                                await showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  builder: (_) => ReviewBottomsheet(productId: product.id),
                                );
                              },
                              child: Container(
                                height: 52.h,
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: PPaymobileColors.textfiedBorder, width: 1.h),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(height: 24.w, width: 24.w, child: SvgPicture.asset('assets/icon/review.svg', fit: BoxFit.contain)),
                                        16.horizontalSpace,
                                        Text('Reviews', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w400)),
                                      ],
                                    ),
                                    SizedBox(height: 24.w, width: 24.w, child: SvgPicture.asset('assets/icon/arrow_forward.svg', fit: BoxFit.contain)),
                                  ],
                                ),
                              ),
                            ),
                            17.verticalSpace,
                            // Price + Add to Cart
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
                                      if (hasDiscount)
                                        Text(
                                          '₦${AmountFormatter.formatBalance(originalPrice.toStringAsFixed(2))}',
                                          style: TextStyle(
                                            fontFamily: 'InstrumentSans',
                                            color: PPaymobileColors.textfiedBorder,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400,
                                            decoration: TextDecoration.lineThrough,
                                          ),
                                        ),
                                      Text(
                                        '₦${AmountFormatter.formatBalance(displayPrice.toStringAsFixed(2))}',
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
                                    onTap: addToCartState.isLoading ? null : onAddToCart,
                                    child: Container(
                                      height: 50.h,
                                      width: 180.w,
                                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(56).r,
                                        color: product.inStock
                                            ? PPaymobileColors.buttonColorandText
                                            : PPaymobileColors.textfiedBorder,
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            addToCartState.isLoading ? 'Adding...' : 'Add to Cart',
                                            style: TextStyle(
                                              fontFamily: 'InstrumentSans',
                                              color: Colors.white,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          6.horizontalSpace,
                                          SizedBox(
                                            height: 24.h,
                                            width: 24.h,
                                            child: SvgPicture.asset('assets/icon/cart_!.svg', fit: BoxFit.contain),
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

class _LoadingSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          41.verticalSpace,
          SkeletonLoader(width: double.infinity, height: 286.h, borderRadius: BorderRadius.circular(8.r)),
          21.verticalSpace,
          SkeletonLoader(width: 200.w, height: 28.h, borderRadius: BorderRadius.circular(4.r)),
          12.verticalSpace,
          SkeletonLoader(width: double.infinity, height: 60.h, borderRadius: BorderRadius.circular(4.r)),
          40.verticalSpace,
          SkeletonLoader(width: 120.w, height: 20.h, borderRadius: BorderRadius.circular(4.r)),
          16.verticalSpace,
          Row(
            children: List.generate(4, (_) => Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: SkeletonLoader(width: 48.w, height: 48.w, borderRadius: BorderRadius.circular(24.r)),
            )),
          ),
        ],
      ),
    );
  }
}
