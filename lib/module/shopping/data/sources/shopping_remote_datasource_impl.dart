import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/models/base_response.dart';
import 'package:ppay_mobile/module/shopping/data/models/requests/shopping_request.dart';
import 'package:ppay_mobile/module/shopping/data/models/shopping_model.dart';
import 'package:ppay_mobile/module/shopping/data/sources/shopping_remote_datasource.dart';

@LazySingleton(as: ShoppingRemoteDataSource)
class ShoppingRemoteDataSourceImpl implements ShoppingRemoteDataSource {
  final Dio _dio;
  static const String _baseUrl = '/api/v1';

  ShoppingRemoteDataSourceImpl(this._dio);

  @override
  Future<HomepageModel> getHomepage() async {
    final response = await _dio.get('$_baseUrl/shopping/homepage');
    final baseResponse = BaseResponse<HomepageModel>.fromJson(
      response.data,
      (data) => HomepageModel.fromJson(data as Map<String, dynamic>),
    );
    return baseResponse.data!;
  }

  @override
  Future<ProductsResponseModel> getProducts({
    String? categoryId,
    String? search,
    double? minPrice,
    double? maxPrice,
    String? variantFilters,
    int? page,
    int? limit,
  }) async {
    final queryParams = <String, dynamic>{};
    if (categoryId != null) queryParams['categoryId'] = categoryId;
    if (search != null) queryParams['search'] = search;
    if (minPrice != null) queryParams['minPrice'] = minPrice;
    if (maxPrice != null) queryParams['maxPrice'] = maxPrice;
    if (variantFilters != null) queryParams['variantFilters'] = variantFilters;
    if (page != null) queryParams['page'] = page;
    if (limit != null) queryParams['limit'] = limit;

    final response = await _dio.get('$_baseUrl/shopping/products', queryParameters: queryParams);
    final baseResponse = BaseResponse<ProductsResponseModel>.fromJson(
      response.data,
      (data) => ProductsResponseModel.fromJson(data as Map<String, dynamic>),
    );
    return baseResponse.data!;
  }

  @override
  Future<ProductModel> getProductDetails(String productId) async {
    final response = await _dio.get('$_baseUrl/shopping/products/$productId');
    final baseResponse = BaseResponse<ProductModel>.fromJson(
      response.data,
      (data) => ProductModel.fromJson(data as Map<String, dynamic>),
    );
    return baseResponse.data!;
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await _dio.get('$_baseUrl/shopping/categories');
    final baseResponse = BaseResponse<List<dynamic>>.fromJson(
      response.data,
      (data) => data as List<dynamic>,
    );
    return baseResponse.data!
        .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<CheckoutSummaryModel> getCheckoutSummary(double subtotal, {String? promoCode}) async {
    final queryParams = <String, dynamic>{'subtotal': subtotal};
    if (promoCode != null) queryParams['promoCode'] = promoCode;
    final response = await _dio.get('$_baseUrl/shopping/checkout-summary', queryParameters: queryParams);
    final baseResponse = BaseResponse<CheckoutSummaryModel>.fromJson(
      response.data,
      (data) => CheckoutSummaryModel.fromJson(data as Map<String, dynamic>),
    );
    return baseResponse.data!;
  }

  @override
  Future<CartModel?> getCart() async {
    final response = await _dio.get('$_baseUrl/shopping/cart');
    final baseResponse = BaseResponse<CartModel>.fromJson(
      response.data,
      (data) => CartModel.fromJson(data as Map<String, dynamic>),
    );
    return baseResponse.data;
  }

  @override
  Future<CartModel> addToCart(AddToCartRequest request) async {
    final response = await _dio.post('$_baseUrl/shopping/cart', data: request.toJson());
    final baseResponse = BaseResponse<CartModel>.fromJson(
      response.data,
      (data) => CartModel.fromJson(data as Map<String, dynamic>),
    );
    return baseResponse.data!;
  }

  @override
  Future<void> updateCartItem(String cartItemId, UpdateCartItemRequest request) async {
    await _dio.patch('$_baseUrl/shopping/cart/$cartItemId', data: request.toJson());
  }

  @override
  Future<void> removeFromCart(String cartItemId) async {
    await _dio.delete('$_baseUrl/shopping/cart/$cartItemId');
  }

  @override
  Future<OrderModel> createOrder(CreateOrderRequest request) async {
    final response = await _dio.post('$_baseUrl/shopping/orders', data: request.toJson());
    final baseResponse = BaseResponse<OrderModel>.fromJson(
      response.data,
      (data) => OrderModel.fromJson(data as Map<String, dynamic>),
    );
    return baseResponse.data!;
  }

  @override
  Future<List<OrderModel>> getOrders() async {
    final response = await _dio.get('$_baseUrl/shopping/orders');
    final baseResponse = BaseResponse<List<dynamic>>.fromJson(
      response.data,
      (data) => data as List<dynamic>,
    );
    return baseResponse.data!
        .map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<OrderModel> getOrderDetails(String orderId) async {
    final response = await _dio.get('$_baseUrl/shopping/orders/$orderId');
    final baseResponse = BaseResponse<OrderModel>.fromJson(
      response.data,
      (data) => OrderModel.fromJson(data as Map<String, dynamic>),
    );
    return baseResponse.data!;
  }

  @override
  Future<ReviewModel> createReview(CreateReviewRequest request) async {
    final response = await _dio.post('$_baseUrl/shopping/reviews', data: request.toJson());
    final baseResponse = BaseResponse<ReviewModel>.fromJson(
      response.data,
      (data) => ReviewModel.fromJson(data as Map<String, dynamic>),
    );
    return baseResponse.data!;
  }

  @override
  Future<List<ReviewModel>> getProductReviews(String productId) async {
    final response = await _dio.get('$_baseUrl/shopping/products/$productId/reviews');
    final baseResponse = BaseResponse<List<dynamic>>.fromJson(
      response.data,
      (data) => data as List<dynamic>,
    );
    return baseResponse.data!
        .map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<WatchlistItemModel>> getWatchlist() async {
    final response = await _dio.get('$_baseUrl/shopping/watchlist');
    final baseResponse = BaseResponse<List<dynamic>>.fromJson(
      response.data,
      (data) => data as List<dynamic>,
    );
    return baseResponse.data!
        .map((e) => WatchlistItemModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<void> addToWatchlist(AddToWatchlistRequest request) async {
    await _dio.post('$_baseUrl/shopping/watchlist', data: request.toJson());
  }

  @override
  Future<void> removeFromWatchlist(String productId) async {
    await _dio.delete('$_baseUrl/shopping/watchlist/$productId');
  }
}
