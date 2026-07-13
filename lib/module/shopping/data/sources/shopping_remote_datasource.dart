import 'package:ppay_mobile/module/shopping/data/models/requests/shopping_request.dart';
import 'package:ppay_mobile/module/shopping/data/models/shopping_model.dart';

abstract class ShoppingRemoteDataSource {
  Future<HomepageModel> getHomepage();
  Future<ProductsResponseModel> getProducts({
    String? categoryId,
    String? search,
    double? minPrice,
    double? maxPrice,
    String? variantFilters,
    int? page,
    int? limit,
  });
  Future<ProductModel> getProductDetails(String productId);
  Future<List<CategoryModel>> getCategories();
  Future<CheckoutSummaryModel> getCheckoutSummary(double subtotal, {String? promoCode});
  Future<CartModel?> getCart();
  Future<CartModel> addToCart(AddToCartRequest request);
  Future<void> updateCartItem(String cartItemId, UpdateCartItemRequest request);
  Future<void> removeFromCart(String cartItemId);
  Future<OrderModel> createOrder(CreateOrderRequest request);
  Future<List<OrderModel>> getOrders();
  Future<OrderModel> getOrderDetails(String orderId);
  Future<ReviewModel> createReview(CreateReviewRequest request);
  Future<List<ReviewModel>> getProductReviews(String productId);
  Future<List<WatchlistItemModel>> getWatchlist();
  Future<void> addToWatchlist(AddToWatchlistRequest request);
  Future<void> removeFromWatchlist(String productId);
}
