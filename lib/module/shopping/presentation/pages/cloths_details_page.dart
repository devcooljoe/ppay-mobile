import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/shopping/domain/entities/shopping_entity.dart';
import 'package:ppay_mobile/module/shopping/presentation/providers/shopping_providers.dart';
import 'package:ppay_mobile/shared/utils/amount_formatter.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/product_detail_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/review_bottomsheet.dart';
import 'package:ppay_mobile/shared/widgets/skeleton_loader.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';
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
    final updateCartItemState = ref.watch(updateCartItemProvider);
    final watchlistState = ref.watch(getWatchlistProvider);
    final cartState = ref.watch(getCartProvider);

    useEffect(() {
      Future.microtask(() {
        ref.read(getProductDetailsProvider.notifier).call(productId);
        ref.read(getWatchlistProvider.notifier).call();
        ref.read(getCartProvider.notifier).call();
      });
      return null;
    }, [productId]);

    final product = productState.value;
    final isInWatchlist =
        watchlistState.value?.any((w) => w.product?.id == productId) ?? false;

    // Cart awareness
    final cartItems = cartState.value?.items ?? [];
    final existingCartItem = cartItems.where((item) {
      if (item.product.id != productId) return false;
      if (selectedVariantId.value == null) return item.variant == null;
      return item.variant?.id == selectedVariantId.value;
    }).firstOrNull;
    final cartedQuantity = existingCartItem?.quantity ?? 0;
    final stockQuantity = product?.stockQuantity ?? 0;
    final remainingStock = stockQuantity - cartedQuantity;
    final isOutOfStock =
        product != null && (!product.inStock || stockQuantity <= 0);
    final isFullyInCart =
        product != null && !isOutOfStock && cartedQuantity >= stockQuantity;

    Future<void> onAddToCart() async {
      if (product == null) return;
      if (product.variants.isNotEmpty && selectedVariantId.value == null) {
        MessageHandler.showErrorSnackBar(context, 'Please select a variant');
        return;
      }
      if (isFullyInCart) {
        MessageHandler.showInfoSnackBar(
          context,
          'You already have all available stock in your cart',
        );
        return;
      }
      if (existingCartItem != null) {
        final newQuantity = (cartedQuantity + quantity.value).clamp(
          1,
          stockQuantity,
        );
        await ref
            .read(updateCartItemProvider.notifier)
            .call(cartItemId: existingCartItem.id, quantity: newQuantity);
        if (!context.mounted) return;
        if (ref.read(updateCartItemProvider).hasError) {
          MessageHandler.showErrorSnackBar(
            context,
            MessageHandler.getErrorMessage(
              ref.read(updateCartItemProvider).error,
            ),
          );
        } else {
          ref.read(getCartProvider.notifier).call();
          await showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (_) => const YourCartBottomsheet(),
          );
        }
      } else {
        await ref
            .read(addToCartProvider.notifier)
            .call(
              productId: product.id,
              variantId: selectedVariantId.value,
              quantity: quantity.value,
            );
        if (!context.mounted) return;
        if (ref.read(addToCartProvider).hasError) {
          MessageHandler.showErrorSnackBar(
            context,
            MessageHandler.getErrorMessage(ref.read(addToCartProvider).error),
          );
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
    }

    Future<void> onToggleWatchlist() async {
      if (product == null) return;
      final currentList = watchlistState.value ?? [];
      if (isInWatchlist) {
        final itemId = currentList
            .firstWhere((w) => w.product?.id == productId)
            .id;
        ref
            .read(getWatchlistProvider.notifier)
            .setData(
              currentList.where((w) => w.product?.id != productId).toList(),
            );
        await ref.read(removeFromWatchlistProvider.notifier).call(itemId);
        if (!context.mounted) return;
        if (ref.read(removeFromWatchlistProvider).hasError) {
          ref.read(getWatchlistProvider.notifier).setData(currentList);
          MessageHandler.showErrorSnackBar(
            context,
            'Failed to remove from wishlist',
          );
        }
      } else {
        ref.read(getWatchlistProvider.notifier).setData([
          ...currentList,
          WatchlistItemEntity(
            id: '',
            createdAt: '',
            product: WatchlistProductEntity(
              id: productId,
              name: product.name,
              price: product.price,
              discountPrice: product.discountPrice,
              inStock: product.inStock,
              images: product.images
                  ?.map((i) => ProductImageEntity(id: i.id, url: i.url))
                  .toList(),
            ),
          ),
        ]);
        await ref.read(addToWatchlistProvider.notifier).call(product.id);
        if (!context.mounted) return;
        if (ref.read(addToWatchlistProvider).hasError) {
          ref.read(getWatchlistProvider.notifier).setData(currentList);
          MessageHandler.showErrorSnackBar(
            context,
            'Failed to add to wishlist',
          );
        } else {
          MessageHandler.showSuccessSnackBar(context, 'Added to wishlist');
        }
      }
    }

    final hasDiscount =
        product != null &&
        product.discountPrice != null &&
        product.discountPrice! < product.price;
    final displayPrice = hasDiscount
        ? product!.discountPrice!
        : (product?.price ?? 0.0);
    final originalPrice = product?.price ?? 0.0;

    final sizes =
        product?.variants
            .map((v) => v.attributes['size']?.toString())
            .where((s) => s != null)
            .toSet()
            .toList() ??
        [];
    final colors =
        product?.variants
            .map((v) => v.attributes['color']?.toString())
            .where((c) => c != null)
            .toSet()
            .toList() ??
        [];

    final selectedSize = useState<String?>(
      sizes.isNotEmpty ? sizes.first : null,
    );
    final selectedColor = useState<String?>(
      colors.isNotEmpty ? colors.first : null,
    );

    useEffect(() {
      if (product == null) return null;
      final match = product.variants.where((v) {
        final sizeMatch =
            selectedSize.value == null ||
            v.attributes['size'] == selectedSize.value;
        final colorMatch =
            selectedColor.value == null ||
            v.attributes['color'] == selectedColor.value;
        return sizeMatch && colorMatch;
      }).firstOrNull;
      selectedVariantId.value = match?.id;
      quantity.value = 1;
      return null;
    }, [selectedSize.value, selectedColor.value, product]);

    final isLoading = addToCartState.isLoading || updateCartItemState.isLoading;
    final buttonLabel = isLoading
        ? (existingCartItem != null ? 'Updating...' : 'Adding...')
        : isOutOfStock
        ? 'Sold Out'
        : isFullyInCart
        ? 'In Cart'
        : existingCartItem != null
        ? 'Update Cart'
        : 'Add to cart';

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: PPAppBar(
        title: product?.name ?? 'Product',
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Row(
              children: [
                // TouchOpacity(
                //   onTap: onToggleWatchlist,
                //   child: Container(
                //     height: 36.w,
                //     width: 36.w,
                //     decoration: BoxDecoration(
                //       shape: BoxShape.circle,
                //       border: Border.all(color: PPaymobileColors.filterBorderColor, width: 1.w),
                //       color: PPaymobileColors.mainScreenBackground,
                //     ),
                //     child: Center(
                //       child: Icon(
                //         isInWatchlist ? Icons.favorite : Icons.favorite_border,
                //         color: isInWatchlist ? const Color(0xFFE53935) : Colors.black,
                //         size: 18.w,
                //       ),
                //     ),
                //   ),
                // ),
                // 10.horizontalSpace,
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
                    height: 36.w,
                    width: 36.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: PPaymobileColors.filterBorderColor,
                        width: 1.w,
                      ),
                      color: PPaymobileColors.mainScreenBackground,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/icon/cart_green.svg',
                        height: 18.w,
                        width: 18.w,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: productState.isLoading || product == null
          ? null
          : Container(
              padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 28.h),
              decoration: BoxDecoration(
                color: PPaymobileColors.mainScreenBackground,
                border: Border(
                  top: BorderSide(
                    color: PPaymobileColors.filterBorderColor,
                    width: 1.h,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (hasDiscount)
                        Text(
                          '₦${AmountFormatter.formatBalance(originalPrice.toStringAsFixed(2))}',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: PPaymobileColors.lightGrey,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: PPaymobileColors.lightGrey,
                          ),
                        ),
                      Text(
                        '₦${AmountFormatter.formatBalance(displayPrice.toStringAsFixed(2))}',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  16.horizontalSpace,
                  Expanded(
                    child: TouchOpacity(
                      onTap: isLoading || isOutOfStock ? null : onAddToCart,
                      child: Container(
                        height: 52.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(56).r,
                          color: isOutOfStock
                              ? PPaymobileColors.lightGrey
                              : isFullyInCart
                              ? PPaymobileColors.buttonColor
                              : PPaymobileColors.buttonColorandText,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              buttonLabel,
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.white,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            if (!isFullyInCart && !isOutOfStock) ...[
                              8.horizontalSpace,
                              SvgPicture.asset(
                                'assets/icon/cart_!.svg',
                                height: 20.h,
                                width: 20.h,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      color: Colors.black,
                      fontSize: 16.sp,
                    ),
                  ),
                  16.verticalSpace,
                  TextButton(
                    onPressed: () => ref
                        .read(getProductDetailsProvider.notifier)
                        .call(productId),
                    child: Text(
                      'Retry',
                      style: TextStyle(color: PPaymobileColors.buttonColor),
                    ),
                  ),
                ],
              ),
            )
          : product == null
          ? const SizedBox.shrink()
          : ListView(
              padding: EdgeInsets.zero,
              children: [
                // ── Full-width image carousel ──────────────────────────────
                SizedBox(
                  height: 320.h,
                  child: Stack(
                    children: [
                      PageView.builder(
                        controller: pageController,
                        onPageChanged: (i) => currentIndex.value = i,
                        itemCount: (product.images?.isNotEmpty == true)
                            ? product.images!.length
                            : 1,
                        itemBuilder: (context, index) {
                          final images = product.images;
                          if (images != null && images.isNotEmpty) {
                            return GestureDetector(
                              onTap: () => _openFullScreen(
                                context,
                                images.map((i) => i.url).toList(),
                                index,
                              ),
                              child: Hero(
                                tag: 'product_image_$index',
                                child: CachedNetworkImage(
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
                      // Share + heart overlay (top-right)
                      Positioned(
                        top: 16.h,
                        right: 16.w,
                        child: Row(
                          children: [
                            _ImageOverlayButton(
                              child: SvgPicture.asset(
                                'assets/icon/share.svg',
                                height: 18.w,
                                width: 18.w,
                                fit: BoxFit.contain,
                              ),
                            ),
                            8.horizontalSpace,
                            _ImageOverlayButton(
                              onTap: onToggleWatchlist,
                              child: Icon(
                                isInWatchlist
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isInWatchlist
                                    ? const Color(0xFFE53935)
                                    : Colors.black54,
                                size: 18.w,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Dot indicators (bottom-center)
                      if ((product.images?.length ?? 0) > 1)
                        Positioned(
                          bottom: 14.h,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              product.images!.length.clamp(0, 5),
                              (i) => AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                margin: EdgeInsets.symmetric(horizontal: 4.w),
                                height: 8.w,
                                width: currentIndex.value == i ? 20.w : 8.w,
                                decoration: BoxDecoration(
                                  color: currentIndex.value == i
                                      ? PPaymobileColors.buttonColor
                                      : Colors.white.withValues(alpha: 0.7),
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),

                // ── Product name + rating ──────────────────────────────────
                Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      12.verticalSpace,
                      // Rating row
                      Row(
                        children: [
                          // Star rating pill
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 5.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20).r,
                              border: Border.all(
                                color: PPaymobileColors.filterBorderColor,
                                width: 1.w,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.star_rounded,
                                  color: const Color(0xFFFFC107),
                                  size: 16.w,
                                ),
                                4.horizontalSpace,
                                Text(
                                  product.averageRating > 0
                                      ? product.averageRating.toStringAsFixed(1)
                                      : '0.0',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          12.horizontalSpace,
                          // Heart rating pill
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 5.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20).r,
                              border: Border.all(
                                color: PPaymobileColors.filterBorderColor,
                                width: 1.w,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.favorite,
                                  color: PPaymobileColors.buttonColor,
                                  size: 16.w,
                                ),
                                4.horizontalSpace,
                                Text(
                                  product.averageRating > 0
                                      ? product.averageRating.toStringAsFixed(1)
                                      : '0.0',
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: Colors.black,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          12.horizontalSpace,
                          Text(
                            product.reviewCount > 0
                                ? '${_formatCount(product.reviewCount)} Reviews'
                                : 'No reviews yet',
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              color: PPaymobileColors.lightGrey,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      16.verticalSpace,
                      // Description
                      Text(
                        product.description,
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),

                // ── Available Color ────────────────────────────────────────
                if (colors.isNotEmpty) ...[
                  Padding(
                    padding: EdgeInsets.fromLTRB(20.w, 28.h, 20.w, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Available Color',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        14.verticalSpace,
                        Wrap(
                          spacing: 10.w,
                          runSpacing: 10.h,
                          children: colors.map((color) {
                            final isSelected = selectedColor.value == color;
                            final swatch = _colorFromName(color!);
                            return TouchOpacity(
                              onTap: () => selectedColor.value = color,
                              child: Container(
                                width: 44.w,
                                height: 44.w,
                                decoration: BoxDecoration(
                                  color: swatch,
                                  borderRadius: BorderRadius.circular(6).r,
                                  border: Border.all(
                                    color: isSelected
                                        ? PPaymobileColors.buttonColorandText
                                        : PPaymobileColors.filterBorderColor,
                                    width: isSelected ? 2.w : 1.w,
                                  ),
                                ),
                                child: isSelected
                                    ? Center(
                                        child: SvgPicture.asset(
                                          'assets/icon/check_white.svg',
                                          height: 18.w,
                                          width: 18.w,
                                          fit: BoxFit.contain,
                                          colorFilter: ColorFilter.mode(
                                            swatch.computeLuminance() > 0.5
                                                ? Colors.black
                                                : Colors.white,
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                      )
                                    : null,
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ],

                // ── Quantity ───────────────────────────────────────────────
                Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 28.h, 20.w, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Quantity',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: Colors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      14.verticalSpace,
                      Row(
                        children: [
                          _QtyStepperButton(
                            icon: 'assets/icon/minus.svg',
                            enabled: quantity.value > 1 && !isFullyInCart,
                            onTap: () {
                              if (quantity.value > 1) quantity.value--;
                            },
                          ),
                          Container(
                            width: 52.w,
                            height: 44.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: PPaymobileColors.filterBorderColor,
                                width: 1.w,
                              ),
                            ),
                            child: Text(
                              '${quantity.value}',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          _QtyStepperButton(
                            icon: 'assets/icon/add.svg',
                            enabled:
                                quantity.value < remainingStock &&
                                !isFullyInCart,
                            onTap: () {
                              if (quantity.value < remainingStock)
                                quantity.value++;
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // ── Size ──────────────────────────────────────────────────
                if (sizes.isNotEmpty) ...[
                  Padding(
                    padding: EdgeInsets.fromLTRB(20.w, 28.h, 20.w, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Size',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            color: Colors.black,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        14.verticalSpace,
                        Wrap(
                          spacing: 10.w,
                          runSpacing: 10.h,
                          children: sizes.map((size) {
                            final isSelected = selectedSize.value == size;
                            return TouchOpacity(
                              onTap: () => selectedSize.value = size,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 18.w,
                                  vertical: 10.h,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6).r,
                                  color: isSelected
                                      ? PPaymobileColors.buttonColor
                                      : PPaymobileColors.mainScreenBackground,
                                  border: Border.all(
                                    color: isSelected
                                        ? PPaymobileColors.buttonColor
                                        : PPaymobileColors.filterBorderColor,
                                    width: 1.w,
                                  ),
                                ),
                                child: Text(
                                  size!,
                                  style: TextStyle(
                                    fontFamily: 'InstrumentSans',
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ],

                // ── Stock info ────────────────────────────────────────────
                Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 0),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icon/stock.svg',
                        height: 20.w,
                        width: 20.w,
                        fit: BoxFit.contain,
                      ),
                      10.horizontalSpace,
                      Text(
                        isOutOfStock
                            ? 'Sold Out'
                            : '${product.stockQuantity} Available in stock',
                        style: TextStyle(
                          fontFamily: 'InstrumentSans',
                          color: isOutOfStock
                              ? PPaymobileColors.redTextfield
                              : Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                // ── Divider ───────────────────────────────────────────────
                Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
                  child: Divider(
                    color: PPaymobileColors.filterBorderColor,
                    height: 1.h,
                  ),
                ),

                // ── Product Detail row ────────────────────────────────────
                TouchOpacity(
                  onTap: () async {
                    await showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) =>
                          ProductDetailBottomsheet(product: product),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Container(
                      height: 56.h,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: PPaymobileColors.filterBorderColor,
                            width: 1.h,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icon/detail.svg',
                            height: 22.w,
                            width: 22.w,
                            fit: BoxFit.contain,
                          ),
                          14.horizontalSpace,
                          Expanded(
                            child: Text(
                              'Product Detail',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SvgPicture.asset(
                            'assets/icon/arrow_forward.svg',
                            height: 20.w,
                            width: 20.w,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // ── Reviews row ───────────────────────────────────────────
                TouchOpacity(
                  onTap: () async {
                    await showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => ReviewBottomsheet(productId: product.id),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Container(
                      height: 56.h,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: PPaymobileColors.filterBorderColor,
                            width: 1.h,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icon/review.svg',
                            height: 22.w,
                            width: 22.w,
                            fit: BoxFit.contain,
                          ),
                          14.horizontalSpace,
                          Expanded(
                            child: Text(
                              'Reviews',
                              style: TextStyle(
                                fontFamily: 'InstrumentSans',
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SvgPicture.asset(
                            'assets/icon/arrow_forward.svg',
                            height: 20.w,
                            width: 20.w,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                24.verticalSpace,
              ],
            ),
    );
  }
}

// ── Helpers ────────────────────────────────────────────────────────────────

String _formatCount(int count) {
  if (count >= 1000) return '${(count / 1000).toStringAsFixed(1)}k';
  return '$count';
}

Color _colorFromName(String name) {
  switch (name.toLowerCase()) {
    case 'black':
      return Colors.black;
    case 'white':
      return Colors.white;
    case 'red':
      return const Color(0xFFE53935);
    case 'green':
      return const Color(0xFF43A047);
    case 'blue':
      return const Color(0xFF1E88E5);
    case 'navy':
      return const Color(0xFF1A237E);
    case 'grey':
    case 'gray':
      return const Color(0xFF9E9E9E);
    case 'yellow':
      return const Color(0xFFFDD835);
    case 'orange':
      return const Color(0xFFFB8C00);
    case 'pink':
      return const Color(0xFFE91E8C);
    case 'purple':
      return const Color(0xFF8E24AA);
    case 'brown':
      return const Color(0xFF6D4C41);
    default:
      return const Color(0xFFEEEEEE);
  }
}

void _openFullScreen(
  BuildContext context,
  List<String> imageUrls,
  int initialIndex,
) {
  Navigator.of(context).push(
    PageRouteBuilder(
      opaque: false,
      barrierColor: Colors.black,
      pageBuilder: (_, __, ___) => _FullScreenImageViewer(
        imageUrls: imageUrls,
        initialIndex: initialIndex,
      ),
      transitionsBuilder: (_, animation, __, child) =>
          FadeTransition(opacity: animation, child: child),
    ),
  );
}

// ── Small widgets ──────────────────────────────────────────────────────────

class _ImageOverlayButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;

  const _ImageOverlayButton({required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return TouchOpacity(
      onTap: onTap,
      child: Container(
        height: 36.w,
        width: 36.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withValues(alpha: 0.85),
        ),
        child: Center(child: child),
      ),
    );
  }
}

class _QtyStepperButton extends StatelessWidget {
  final String icon;
  final bool enabled;
  final VoidCallback onTap;

  const _QtyStepperButton({
    required this.icon,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TouchOpacity(
      onTap: enabled ? onTap : null,
      child: Opacity(
        opacity: enabled ? 1.0 : 0.35,
        child: Container(
          width: 44.w,
          height: 44.w,
          decoration: BoxDecoration(
            border: Border.all(
              color: PPaymobileColors.filterBorderColor,
              width: 1.w,
            ),
          ),
          child: Center(
            child: SvgPicture.asset(
              icon,
              height: 16.w,
              width: 16.w,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

// ── Full-screen image viewer ───────────────────────────────────────────────

class _FullScreenImageViewer extends HookWidget {
  final List<String> imageUrls;
  final int initialIndex;

  const _FullScreenImageViewer({
    required this.imageUrls,
    required this.initialIndex,
  });

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(initialIndex);
    final pageController = usePageController(initialPage: initialIndex);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            onPageChanged: (i) => currentIndex.value = i,
            itemCount: imageUrls.length,
            itemBuilder: (context, index) => InteractiveViewer(
              minScale: 0.5,
              maxScale: 4.0,
              child: Center(
                child: Hero(
                  tag: 'product_image_$index',
                  child: CachedNetworkImage(
                    imageUrl: imageUrls[index],
                    fit: BoxFit.contain,
                    placeholder: (_, __) => const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    ),
                    errorWidget: (_, __, ___) => const Icon(
                      Icons.broken_image_outlined,
                      color: Colors.white54,
                      size: 64,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(12.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      height: 36.w,
                      width: 36.w,
                      decoration: const BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.close, color: Colors.white, size: 20.w),
                    ),
                  ),
                  if (imageUrls.length > 1)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        '${currentIndex.value + 1} / ${imageUrls.length}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.sp,
                          fontFamily: 'InstrumentSans',
                        ),
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

// ── Loading skeleton ───────────────────────────────────────────────────────

class _LoadingSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkeletonLoader(
          width: double.infinity,
          height: 320.h,
          borderRadius: BorderRadius.zero,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              21.verticalSpace,
              SkeletonLoader(
                width: 220.w,
                height: 26.h,
                borderRadius: BorderRadius.circular(4.r),
              ),
              14.verticalSpace,
              SkeletonLoader(
                width: 180.w,
                height: 18.h,
                borderRadius: BorderRadius.circular(4.r),
              ),
              16.verticalSpace,
              SkeletonLoader(
                width: double.infinity,
                height: 60.h,
                borderRadius: BorderRadius.circular(4.r),
              ),
              28.verticalSpace,
              SkeletonLoader(
                width: 120.w,
                height: 18.h,
                borderRadius: BorderRadius.circular(4.r),
              ),
              14.verticalSpace,
              Row(
                children: List.generate(
                  5,
                  (_) => Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: SkeletonLoader(
                      width: 44.w,
                      height: 44.w,
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
