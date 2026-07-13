import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ppay_mobile/app/router/app_router.gr.dart';
import 'package:ppay_mobile/core/utils/message_handler.dart';
import 'package:ppay_mobile/module/shopping/domain/entities/shopping_entity.dart';
import 'package:ppay_mobile/module/shopping/presentation/providers/shopping_providers.dart';
import 'package:ppay_mobile/shared/utils/amount_formatter.dart';
import 'package:ppay_mobile/shared/widgets/colors.dart';
import 'package:ppay_mobile/shared/widgets/empty_state.dart';
import 'package:ppay_mobile/shared/widgets/pp_app_bar.dart';
import 'package:ppay_mobile/shared/widgets/skeleton_loader.dart';
import 'package:ppay_mobile/shared/widgets/touch_opacity.dart';

@RoutePage()
class WatchlistPage extends HookConsumerWidget {
  const WatchlistPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchQuery = useState('');
    final searchController = useTextEditingController();
    final watchlistState = ref.watch(getWatchlistProvider);

    useEffect(() {
      Future.microtask(() => ref.read(getWatchlistProvider.notifier).call());
      return null;
    }, []);

    useEffect(() {
      void listener() => searchQuery.value = searchController.text.toLowerCase();
      searchController.addListener(listener);
      return () => searchController.removeListener(listener);
    }, []);

    final items = watchlistState.value ?? [];
    final filtered = searchQuery.value.isEmpty
        ? items
        : items.where((i) => i.product?.name.toLowerCase().contains(searchQuery.value) == true).toList();

    return Scaffold(
      backgroundColor: PPaymobileColors.mainScreenBackground,
      appBar: const PPAppBar(title: 'Watchlist'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              39.verticalSpace,
              Container(
                height: 50.h,
                width: double.infinity,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10).r),
                child: TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                    prefixIcon: SizedBox(height: 19.w, width: 19.w, child: SvgPicture.asset('assets/icon/bank_search.svg', fit: BoxFit.scaleDown)),
                    hintText: 'Search',
                    hintStyle: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.textfiedBorder, fontSize: 16.sp, fontWeight: FontWeight.w500),
                    filled: true,
                    fillColor: PPaymobileColors.deepBackgroundColor,
                    contentPadding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 14.h),
                    border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(6).r),
                  ),
                ),
              ),
              24.verticalSpace,
              Expanded(
                child: watchlistState.isLoading
                    ? ListView.separated(
                        itemCount: 4,
                        separatorBuilder: (_, __) => 24.verticalSpace,
                        itemBuilder: (_, __) => Row(
                          children: [
                            SkeletonLoader(width: 100.w, height: 100.h, borderRadius: BorderRadius.circular(4.r)),
                            16.horizontalSpace,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SkeletonLoader(width: 160.w, height: 16.h, borderRadius: BorderRadius.circular(4.r)),
                                  8.verticalSpace,
                                  SkeletonLoader(width: 100.w, height: 14.h, borderRadius: BorderRadius.circular(4.r)),
                                  8.verticalSpace,
                                  SkeletonLoader(width: 120.w, height: 20.h, borderRadius: BorderRadius.circular(4.r)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : watchlistState.hasError
                        ? Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Failed to load watchlist', style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.svgIconColor, fontSize: 14.sp)),
                                16.verticalSpace,
                                TextButton(onPressed: () => ref.read(getWatchlistProvider.notifier).call(), child: const Text('Retry')),
                              ],
                            ),
                          )
                        : filtered.isEmpty
                            ? EmptyState(imagePath: 'assets/images/transactionimage.png', message: items.isEmpty ? 'Your watchlist is empty' : 'No results found')
                            : RefreshIndicator(
                                onRefresh: () async => ref.read(getWatchlistProvider.notifier).call(),
                                color: PPaymobileColors.buttonColor,
                                child: ListView.separated(
                                  itemCount: filtered.length,
                                  separatorBuilder: (_, __) => 24.verticalSpace,
                                  itemBuilder: (context, index) {
                                    final item = filtered[index];
                                    if (item.product == null) return const SizedBox.shrink();
                                    return _WatchlistItem(item: item);
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

class _WatchlistItem extends HookConsumerWidget {
  final WatchlistItemEntity item;
  const _WatchlistItem({required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = item.product!;
    final hasDiscount = product.discountPrice != null && product.discountPrice! < product.price;
    final displayPrice = hasDiscount ? product.discountPrice! : product.price;

    Future<void> onRemove() async {
      await ref.read(removeFromWatchlistProvider.notifier).call(product.id);
      if (!context.mounted) return;
      final state = ref.read(removeFromWatchlistProvider);
      if (state.hasError) {
        MessageHandler.showErrorSnackBar(context, state.error.toString());
      } else {
        ref.read(getWatchlistProvider.notifier).call();
      }
    }

    Future<void> onAddToCart() async {
      await ref.read(addToCartProvider.notifier).call(productId: product.id, quantity: 1);
      if (!context.mounted) return;
      final state = ref.read(addToCartProvider);
      if (state.hasError) {
        MessageHandler.showErrorSnackBar(context, state.error.toString());
      } else {
        ref.read(getCartProvider.notifier).call();
        MessageHandler.showSuccessSnackBar(context, 'Added to cart');
      }
    }

    final imageUrl = product.imageUrl;

    return GestureDetector(
      onTap: () => context.router.push(ClothsDetailsRoute(productId: product.id)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 138.h,
            width: 130.w,
            decoration: BoxDecoration(color: PPaymobileColors.deepBackgroundColor, borderRadius: BorderRadius.circular(4.r)),
            child: imageUrl.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(4.r),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                      errorWidget: (_, __, ___) => Center(child: Icon(Icons.shopping_bag_outlined, color: PPaymobileColors.svgIconColor, size: 40.w)),
                    ),
                  )
                : Center(child: Icon(Icons.shopping_bag_outlined, color: PPaymobileColors.svgIconColor, size: 40.w)),
          ),
          16.horizontalSpace,
          Expanded(
            child: SizedBox(
              height: 138.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.name, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: 'InstrumentSans', fontWeight: FontWeight.w500, fontSize: 15.sp, color: Colors.black)),
                      4.verticalSpace,
                      if (hasDiscount)
                        Text(
                          '₦${AmountFormatter.formatBalance(product.price.toStringAsFixed(2))}',
                          style: TextStyle(fontFamily: 'InstrumentSans', color: PPaymobileColors.textfiedBorder, fontSize: 12.sp, decoration: TextDecoration.lineThrough),
                        ),
                      Text(
                        '₦${AmountFormatter.formatBalance(displayPrice.toStringAsFixed(2))}',
                        style: TextStyle(fontFamily: 'InstrumentSans', fontWeight: FontWeight.w500, fontSize: 16.sp, color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TouchOpacity(
                          onTap: onRemove,
                          child: Container(
                            height: 35.h,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4).r, color: PPaymobileColors.deepBackgroundColor),
                            child: Center(child: Text('Remove', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w600))),
                          ),
                        ),
                      ),
                      10.horizontalSpace,
                      Expanded(
                        child: TouchOpacity(
                          onTap: onAddToCart,
                          child: Container(
                            height: 35.h,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4).r, color: PPaymobileColors.buttonColorandText),
                            child: Center(child: Text('Add to Cart', style: TextStyle(fontFamily: 'InstrumentSans', color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.w600))),
                          ),
                        ),
                      ),
                    ],
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
