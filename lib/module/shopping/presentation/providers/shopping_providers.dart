import 'package:ppay_mobile/core/di/injection.dart';
import 'package:ppay_mobile/module/shopping/domain/entities/shopping_entity.dart';
import 'package:ppay_mobile/module/shopping/domain/usecases/shopping_usecases.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shopping_providers.g.dart';

@riverpod
class GetHomepage extends _$GetHomepage {
  @override
  AsyncValue<HomepageEntity?> build() => const AsyncValue.data(null);

  Future<void> call() async {
    state = const AsyncValue.loading();
    final result = await getIt<GetHomepageUseCase>()();
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (homepage) => AsyncValue.data(homepage),
    );
  }
}

@riverpod
class GetProducts extends _$GetProducts {
  @override
  AsyncValue<ProductsResponseEntity?> build() => const AsyncValue.data(null);

  Future<void> call({
    String? categoryId,
    String? search,
    double? minPrice,
    double? maxPrice,
    String? variantFilters,
    int? page,
    int? limit,
  }) async {
    state = const AsyncValue.loading();
    final result = await getIt<GetProductsUseCase>()(
      categoryId: categoryId,
      search: search,
      minPrice: minPrice,
      maxPrice: maxPrice,
      variantFilters: variantFilters,
      page: page,
      limit: limit,
    );
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (products) => AsyncValue.data(products),
    );
  }
}

@riverpod
class GetProductDetails extends _$GetProductDetails {
  @override
  AsyncValue<ProductEntity?> build() => const AsyncValue.data(null);

  Future<void> call(String productId) async {
    state = const AsyncValue.loading();
    final result = await getIt<GetProductDetailsUseCase>()(productId);
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (product) => AsyncValue.data(product),
    );
  }
}

@riverpod
class GetCategories extends _$GetCategories {
  @override
  AsyncValue<List<CategoryEntity>?> build() => const AsyncValue.data(null);

  Future<void> call() async {
    state = const AsyncValue.loading();
    final result = await getIt<GetCategoriesUseCase>()();
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (categories) => AsyncValue.data(categories),
    );
  }
}

@riverpod
class GetCart extends _$GetCart {
  @override
  AsyncValue<CartEntity?> build() => const AsyncValue.data(null);

  Future<void> call() async {
    state = const AsyncValue.loading();
    final result = await getIt<GetCartUseCase>()();
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (cart) => AsyncValue.data(cart),
    );
  }
}

@riverpod
class AddToCart extends _$AddToCart {
  @override
  AsyncValue<CartEntity?> build() => const AsyncValue.data(null);

  Future<void> call({
    required String productId,
    String? variantId,
    required int quantity,
  }) async {
    state = const AsyncValue.loading();
    final result = await getIt<AddToCartUseCase>()(
      productId: productId,
      variantId: variantId,
      quantity: quantity,
    );
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (cart) => AsyncValue.data(cart),
    );
  }
}

@riverpod
class UpdateCartItem extends _$UpdateCartItem {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> call({
    required String cartItemId,
    required int quantity,
  }) async {
    state = const AsyncValue.loading();
    final result = await getIt<UpdateCartItemUseCase>()(
      cartItemId: cartItemId,
      quantity: quantity,
    );
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (_) => const AsyncValue.data(null),
    );
  }
}

@riverpod
class RemoveFromCart extends _$RemoveFromCart {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> call(String cartItemId) async {
    state = const AsyncValue.loading();
    final result = await getIt<RemoveFromCartUseCase>()(cartItemId);
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (_) => const AsyncValue.data(null),
    );
  }
}

@riverpod
class CreateOrder extends _$CreateOrder {
  @override
  AsyncValue<OrderEntity?> build() => const AsyncValue.data(null);

  Future<void> call({
    required String receiverName,
    required String phoneNumber,
    required String country,
    required String orderState,
    required String address,
    String? note,
    required List<Map<String, dynamic>> items,
  }) async {
    state = const AsyncValue.loading();
    final result = await getIt<CreateOrderUseCase>()(
      receiverName: receiverName,
      phoneNumber: phoneNumber,
      country: country,
      state: orderState,
      address: address,
      note: note,
      items: items,
    );
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (order) => AsyncValue.data(order),
    );
  }
}

@riverpod
class GetOrders extends _$GetOrders {
  @override
  AsyncValue<List<OrderEntity>?> build() => const AsyncValue.data(null);

  Future<void> call() async {
    state = const AsyncValue.loading();
    final result = await getIt<GetOrdersUseCase>()();
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (orders) => AsyncValue.data(orders),
    );
  }
}

@riverpod
class GetOrderDetails extends _$GetOrderDetails {
  @override
  AsyncValue<OrderEntity?> build() => const AsyncValue.data(null);

  Future<void> call(String orderId) async {
    state = const AsyncValue.loading();
    final result = await getIt<GetOrderDetailsUseCase>()(orderId);
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (order) => AsyncValue.data(order),
    );
  }
}

@riverpod
class CreateReview extends _$CreateReview {
  @override
  AsyncValue<ReviewEntity?> build() => const AsyncValue.data(null);

  Future<void> call({
    required String productId,
    required int rating,
    required String comment,
  }) async {
    state = const AsyncValue.loading();
    final result = await getIt<CreateReviewUseCase>()(
      productId: productId,
      rating: rating,
      comment: comment,
    );
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (review) => AsyncValue.data(review),
    );
  }
}

@riverpod
class GetProductReviews extends _$GetProductReviews {
  @override
  AsyncValue<List<ReviewEntity>?> build() => const AsyncValue.data(null);

  Future<void> call(String productId) async {
    state = const AsyncValue.loading();
    final result = await getIt<GetProductReviewsUseCase>()(productId);
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (reviews) => AsyncValue.data(reviews),
    );
  }
}

@riverpod
class GetWatchlist extends _$GetWatchlist {
  @override
  AsyncValue<List<WatchlistItemEntity>?> build() => const AsyncValue.data(null);

  Future<void> call() async {
    state = const AsyncValue.loading();
    final result = await getIt<GetWatchlistUseCase>()();
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (watchlist) => AsyncValue.data(watchlist),
    );
  }
}

@riverpod
class AddToWatchlist extends _$AddToWatchlist {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> call(String productId) async {
    state = const AsyncValue.loading();
    final result = await getIt<AddToWatchlistUseCase>()(productId);
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (_) => const AsyncValue.data(null),
    );
  }
}

@riverpod
class RemoveFromWatchlist extends _$RemoveFromWatchlist {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> call(String productId) async {
    state = const AsyncValue.loading();
    final result = await getIt<RemoveFromWatchlistUseCase>()(productId);
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (_) => const AsyncValue.data(null),
    );
  }
}
