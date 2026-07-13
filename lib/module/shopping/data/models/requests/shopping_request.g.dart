// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddToCartRequestImpl _$$AddToCartRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$AddToCartRequestImpl(
      productId: json['productId'] as String,
      variantId: json['variantId'] as String?,
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$$AddToCartRequestImplToJson(
        _$AddToCartRequestImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'variantId': instance.variantId,
      'quantity': instance.quantity,
    };

_$UpdateCartItemRequestImpl _$$UpdateCartItemRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateCartItemRequestImpl(
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$$UpdateCartItemRequestImplToJson(
        _$UpdateCartItemRequestImpl instance) =>
    <String, dynamic>{
      'quantity': instance.quantity,
    };

_$CreateOrderRequestImpl _$$CreateOrderRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateOrderRequestImpl(
      receiverName: json['receiverName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      country: json['country'] as String,
      state: json['state'] as String,
      address: json['address'] as String,
      note: json['note'] as String?,
      promoCode: json['promoCode'] as String?,
      items: (json['items'] as List<dynamic>)
          .map((e) => OrderItemRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CreateOrderRequestImplToJson(
        _$CreateOrderRequestImpl instance) =>
    <String, dynamic>{
      'receiverName': instance.receiverName,
      'phoneNumber': instance.phoneNumber,
      'country': instance.country,
      'state': instance.state,
      'address': instance.address,
      'note': instance.note,
      'promoCode': instance.promoCode,
      'items': instance.items,
    };

_$OrderItemRequestImpl _$$OrderItemRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderItemRequestImpl(
      productId: json['productId'] as String,
      variantId: json['variantId'] as String?,
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$$OrderItemRequestImplToJson(
        _$OrderItemRequestImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'variantId': instance.variantId,
      'quantity': instance.quantity,
    };

_$CreateReviewRequestImpl _$$CreateReviewRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateReviewRequestImpl(
      productId: json['productId'] as String,
      rating: (json['rating'] as num).toInt(),
      comment: json['comment'] as String,
    );

Map<String, dynamic> _$$CreateReviewRequestImplToJson(
        _$CreateReviewRequestImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'rating': instance.rating,
      'comment': instance.comment,
    };

_$AddToWatchlistRequestImpl _$$AddToWatchlistRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$AddToWatchlistRequestImpl(
      productId: json['productId'] as String,
    );

Map<String, dynamic> _$$AddToWatchlistRequestImplToJson(
        _$AddToWatchlistRequestImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
    };
