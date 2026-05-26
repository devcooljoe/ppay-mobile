import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/shopping/domain/entities/shopping_entity.dart';
import 'package:ppay_mobile/module/shopping/domain/repositories/shopping_repository.dart';

@lazySingleton
class GetHomepageUseCase {
  final ShoppingRepository _repository;
  GetHomepageUseCase(this._repository);
  Future<Either<Failure, HomepageEntity>> call() => _repository.getHomepage();
}

@lazySingleton
class GetProductsUseCase {
  final ShoppingRepository _repository;
  GetProductsUseCase(this._repository);
  Future<Either<Failure, ProductsResponseEntity>> call({
    String? categoryId,
    String? search,
    double? minPrice,
    double? maxPrice,
    String? variantFilters,
    int? page,
    int? limit,
  }) => _repository.getProducts(
    categoryId: categoryId,
    search: search,
    minPrice: minPrice,
    maxPrice: maxPrice,
    variantFilters: variantFilters,
    page: page,
    limit: limit,
  );
}

@lazySingleton
class GetProductDetailsUseCase {
  final ShoppingRepository _repository;
  GetProductDetailsUseCase(this._repository);
  Future<Either<Failure, ProductEntity>> call(String productId) =>
      _repository.getProductDetails(productId);
}

@lazySingleton
class GetCategoriesUseCase {
  final ShoppingRepository _repository;
  GetCategoriesUseCase(this._repository);
  Future<Either<Failure, List<CategoryEntity>>> call() => _repository.getCategories();
}

@lazySingleton
class GetCartUseCase {
  final ShoppingRepository _repository;
  GetCartUseCase(this._repository);
  Future<Either<Failure, CartEntity>> call() => _repository.getCart();
}

@lazySingleton
class AddToCartUseCase {
  final ShoppingRepository _repository;
  AddToCartUseCase(this._repository);
  Future<Either<Failure, CartEntity>> call({
    required String productId,
    String? variantId,
    required int quantity,
  }) => _repository.addToCart(productId: productId, variantId: variantId, quantity: quantity);
}

@lazySingleton
class UpdateCartItemUseCase {
  final ShoppingRepository _repository;
  UpdateCartItemUseCase(this._repository);
  Future<Either<Failure, void>> call({
    required String cartItemId,
    required int quantity,
  }) => _repository.updateCartItem(cartItemId: cartItemId, quantity: quantity);
}

@lazySingleton
class RemoveFromCartUseCase {
  final ShoppingRepository _repository;
  RemoveFromCartUseCase(this._repository);
  Future<Either<Failure, void>> call(String cartItemId) => _repository.removeFromCart(cartItemId);
}

@lazySingleton
class CreateOrderUseCase {
  final ShoppingRepository _repository;
  CreateOrderUseCase(this._repository);
  Future<Either<Failure, OrderEntity>> call({
    required String receiverName,
    required String phoneNumber,
    required String country,
    required String state,
    required String address,
    String? note,
    required List<Map<String, dynamic>> items,
  }) => _repository.createOrder(
    receiverName: receiverName,
    phoneNumber: phoneNumber,
    country: country,
    state: state,
    address: address,
    note: note,
    items: items,
  );
}

@lazySingleton
class GetOrdersUseCase {
  final ShoppingRepository _repository;
  GetOrdersUseCase(this._repository);
  Future<Either<Failure, List<OrderEntity>>> call() => _repository.getOrders();
}

@lazySingleton
class GetOrderDetailsUseCase {
  final ShoppingRepository _repository;
  GetOrderDetailsUseCase(this._repository);
  Future<Either<Failure, OrderEntity>> call(String orderId) =>
      _repository.getOrderDetails(orderId);
}

@lazySingleton
class CreateReviewUseCase {
  final ShoppingRepository _repository;
  CreateReviewUseCase(this._repository);
  Future<Either<Failure, ReviewEntity>> call({
    required String productId,
    required int rating,
    required String comment,
  }) => _repository.createReview(productId: productId, rating: rating, comment: comment);
}

@lazySingleton
class GetProductReviewsUseCase {
  final ShoppingRepository _repository;
  GetProductReviewsUseCase(this._repository);
  Future<Either<Failure, List<ReviewEntity>>> call(String productId) =>
      _repository.getProductReviews(productId);
}

@lazySingleton
class GetWatchlistUseCase {
  final ShoppingRepository _repository;
  GetWatchlistUseCase(this._repository);
  Future<Either<Failure, List<WatchlistItemEntity>>> call() => _repository.getWatchlist();
}

@lazySingleton
class AddToWatchlistUseCase {
  final ShoppingRepository _repository;
  AddToWatchlistUseCase(this._repository);
  Future<Either<Failure, void>> call(String productId) => _repository.addToWatchlist(productId);
}

@lazySingleton
class RemoveFromWatchlistUseCase {
  final ShoppingRepository _repository;
  RemoveFromWatchlistUseCase(this._repository);
  Future<Either<Failure, void>> call(String productId) => _repository.removeFromWatchlist(productId);
}
