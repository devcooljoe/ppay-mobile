import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/shopping/data/models/requests/shopping_request.dart';
import 'package:ppay_mobile/module/shopping/data/sources/shopping_remote_datasource.dart';
import 'package:ppay_mobile/module/shopping/domain/entities/shopping_entity.dart';
import 'package:ppay_mobile/module/shopping/domain/repositories/shopping_repository.dart';

@LazySingleton(as: ShoppingRepository)
class ShoppingRepositoryImpl implements ShoppingRepository {
  final ShoppingRemoteDataSource _remoteDataSource;

  ShoppingRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, HomepageEntity>> getHomepage() async {
    try {
      final result = await _remoteDataSource.getHomepage();
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, ProductsResponseEntity>> getProducts({
    String? categoryId,
    String? search,
    double? minPrice,
    double? maxPrice,
    String? variantFilters,
    int? page,
    int? limit,
  }) async {
    try {
      final result = await _remoteDataSource.getProducts(
        categoryId: categoryId,
        search: search,
        minPrice: minPrice,
        maxPrice: maxPrice,
        variantFilters: variantFilters,
        page: page,
        limit: limit,
      );
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> getProductDetails(String productId) async {
    try {
      final result = await _remoteDataSource.getProductDetails(productId);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      final result = await _remoteDataSource.getCategories();
      return Right(result.map((e) => e.toEntity()).toList());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, CheckoutSummaryEntity>> getCheckoutSummary(double subtotal, {String? promoCode}) async {
    try {
      final result = await _remoteDataSource.getCheckoutSummary(subtotal, promoCode: promoCode);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, CartEntity?>> getCart() async {
    try {
      final result = await _remoteDataSource.getCart();
      return Right(result?.toEntity());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, CartEntity>> addToCart({
    required String productId,
    String? variantId,
    required int quantity,
  }) async {
    try {
      final result = await _remoteDataSource.addToCart(
        AddToCartRequest(productId: productId, variantId: variantId, quantity: quantity),
      );
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, void>> updateCartItem({
    required String cartItemId,
    required int quantity,
  }) async {
    try {
      await _remoteDataSource.updateCartItem(
        cartItemId,
        UpdateCartItemRequest(quantity: quantity),
      );
      return const Right(null);
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, void>> removeFromCart(String cartItemId) async {
    try {
      await _remoteDataSource.removeFromCart(cartItemId);
      return const Right(null);
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, OrderEntity>> createOrder({
    required String receiverName,
    required String phoneNumber,
    required String country,
    required String state,
    required String address,
    String? note,
    String? promoCode,
    required List<Map<String, dynamic>> items,
  }) async {
    try {
      final result = await _remoteDataSource.createOrder(
        CreateOrderRequest(
          receiverName: receiverName,
          phoneNumber: phoneNumber,
          country: country,
          state: state,
          address: address,
          note: note,
          promoCode: promoCode,
          items: items.map((e) => OrderItemRequest.fromJson(e)).toList(),
        ),
      );
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, List<OrderEntity>>> getOrders() async {
    try {
      final result = await _remoteDataSource.getOrders();
      return Right(result.map((e) => e.toEntity()).toList());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, OrderEntity>> getOrderDetails(String orderId) async {
    try {
      final result = await _remoteDataSource.getOrderDetails(orderId);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, ReviewEntity>> createReview({
    required String productId,
    required int rating,
    required String comment,
  }) async {
    try {
      final result = await _remoteDataSource.createReview(
        CreateReviewRequest(productId: productId, rating: rating, comment: comment),
      );
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, List<ReviewEntity>>> getProductReviews(String productId) async {
    try {
      final result = await _remoteDataSource.getProductReviews(productId);
      return Right(result.map((e) => e.toEntity()).toList());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, List<WatchlistItemEntity>>> getWatchlist() async {
    try {
      final result = await _remoteDataSource.getWatchlist();
      return Right(result.map((e) => e.toEntity()).toList());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, void>> addToWatchlist(String productId) async {
    try {
      await _remoteDataSource.addToWatchlist(AddToWatchlistRequest(productId: productId));
      return const Right(null);
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, void>> removeFromWatchlist(String productId) async {
    try {
      await _remoteDataSource.removeFromWatchlist(productId);
      return const Right(null);
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }
}
