import 'package:dartz/dartz.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/shopping/domain/entities/shopping_entity.dart';

abstract class ShoppingRepository {
  Future<Either<Failure, HomepageEntity>> getHomepage();
  Future<Either<Failure, ProductsResponseEntity>> getProducts({
    String? categoryId,
    String? search,
    double? minPrice,
    double? maxPrice,
    String? variantFilters,
    int? page,
    int? limit,
  });
  Future<Either<Failure, ProductEntity>> getProductDetails(String productId);
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
  Future<Either<Failure, CartEntity>> getCart();
  Future<Either<Failure, CartEntity>> addToCart({
    required String productId,
    String? variantId,
    required int quantity,
  });
  Future<Either<Failure, void>> updateCartItem({
    required String cartItemId,
    required int quantity,
  });
  Future<Either<Failure, void>> removeFromCart(String cartItemId);
  Future<Either<Failure, OrderEntity>> createOrder({
    required String receiverName,
    required String phoneNumber,
    required String country,
    required String state,
    required String address,
    String? note,
    required List<Map<String, dynamic>> items,
  });
  Future<Either<Failure, List<OrderEntity>>> getOrders();
  Future<Either<Failure, OrderEntity>> getOrderDetails(String orderId);
  Future<Either<Failure, ReviewEntity>> createReview({
    required String productId,
    required int rating,
    required String comment,
  });
  Future<Either<Failure, List<ReviewEntity>>> getProductReviews(String productId);
  Future<Either<Failure, List<WatchlistItemEntity>>> getWatchlist();
  Future<Either<Failure, void>> addToWatchlist(String productId);
  Future<Either<Failure, void>> removeFromWatchlist(String productId);
}
