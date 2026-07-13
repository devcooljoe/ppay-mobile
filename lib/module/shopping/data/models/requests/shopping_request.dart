import 'package:freezed_annotation/freezed_annotation.dart';

part 'shopping_request.freezed.dart';
part 'shopping_request.g.dart';

@freezed
class AddToCartRequest with _$AddToCartRequest {
  const factory AddToCartRequest({
    required String productId,
    String? variantId,
    required int quantity,
  }) = _AddToCartRequest;

  factory AddToCartRequest.fromJson(Map<String, dynamic> json) => _$AddToCartRequestFromJson(json);
}

@freezed
class UpdateCartItemRequest with _$UpdateCartItemRequest {
  const factory UpdateCartItemRequest({
    required int quantity,
  }) = _UpdateCartItemRequest;

  factory UpdateCartItemRequest.fromJson(Map<String, dynamic> json) => _$UpdateCartItemRequestFromJson(json);
}

@freezed
class CreateOrderRequest with _$CreateOrderRequest {
  const factory CreateOrderRequest({
    required String receiverName,
    required String phoneNumber,
    required String country,
    required String state,
    required String address,
    String? note,
    String? promoCode,
    required List<OrderItemRequest> items,
  }) = _CreateOrderRequest;

  factory CreateOrderRequest.fromJson(Map<String, dynamic> json) => _$CreateOrderRequestFromJson(json);
}

@freezed
class OrderItemRequest with _$OrderItemRequest {
  const factory OrderItemRequest({
    required String productId,
    String? variantId,
    required int quantity,
  }) = _OrderItemRequest;

  factory OrderItemRequest.fromJson(Map<String, dynamic> json) => _$OrderItemRequestFromJson(json);
}

@freezed
class CreateReviewRequest with _$CreateReviewRequest {
  const factory CreateReviewRequest({
    required String productId,
    required int rating,
    required String comment,
  }) = _CreateReviewRequest;

  factory CreateReviewRequest.fromJson(Map<String, dynamic> json) => _$CreateReviewRequestFromJson(json);
}

@freezed
class AddToWatchlistRequest with _$AddToWatchlistRequest {
  const factory AddToWatchlistRequest({
    required String productId,
  }) = _AddToWatchlistRequest;

  factory AddToWatchlistRequest.fromJson(Map<String, dynamic> json) => _$AddToWatchlistRequestFromJson(json);
}
