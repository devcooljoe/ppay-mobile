import 'package:freezed_annotation/freezed_annotation.dart';

part 'shopping_entity.freezed.dart';

@freezed
class ProductImageEntity with _$ProductImageEntity {
  const factory ProductImageEntity({
    required String id,
    required String url,
  }) = _ProductImageEntity;
}

@freezed
class ProductEntity with _$ProductEntity {
  const factory ProductEntity({
    required String id,
    required String name,
    required String description,
    required double price,
    double? discountPrice,
    required bool inStock,
    required int stockQuantity,
    required List<ProductVariantEntity> variants,
    List<ProductImageEntity>? images,
  }) = _ProductEntity;
}

@freezed
class ProductVariantEntity with _$ProductVariantEntity {
  const factory ProductVariantEntity({
    required String id,
    required Map<String, dynamic> attributes,
    required int stockQuantity,
  }) = _ProductVariantEntity;
}

@freezed
class CategoryEntity with _$CategoryEntity {
  const factory CategoryEntity({
    required String id,
    required String name,
    required String iconUrl,
  }) = _CategoryEntity;
}

@freezed
class HomepageEntity with _$HomepageEntity {
  const factory HomepageEntity({
    required List<ProductEntity> featuredProducts,
    required List<CategoryEntity> categories,
  }) = _HomepageEntity;
}

@freezed
class ProductsResponseEntity with _$ProductsResponseEntity {
  const factory ProductsResponseEntity({
    required List<ProductEntity> products,
    required int total,
    required int page,
    required int limit,
    required int totalPages,
  }) = _ProductsResponseEntity;
}

@freezed
class CartEntity with _$CartEntity {
  const factory CartEntity({
    required String id,
    required String updatedAt,
    required List<CartItemEntity> items,
  }) = _CartEntity;
}

@freezed
class CartItemEntity with _$CartItemEntity {
  const factory CartItemEntity({
    required String id,
    required int quantity,
    required CartItemProductEntity product,
    CartItemVariantEntity? variant,
  }) = _CartItemEntity;
}

@freezed
class CartItemProductEntity with _$CartItemProductEntity {
  const factory CartItemProductEntity({
    required String id,
    required String name,
    required double price,
    double? discountPrice,
    required bool inStock,
    List<ProductImageEntity>? images,
  }) = _CartItemProductEntity;
}

@freezed
class CartItemVariantEntity with _$CartItemVariantEntity {
  const factory CartItemVariantEntity({
    required String id,
    required Map<String, dynamic> attributes,
  }) = _CartItemVariantEntity;
}

@freezed
class OrderEntity with _$OrderEntity {
  const factory OrderEntity({
    required String id,
    required String orderNumber,
    required String status,
    required double subtotal,
    required double deliveryFee,
    required double discount,
    required double total,
    required String createdAt,
    List<OrderItemEntity>? items,
    OrderShippingAddressEntity? shippingAddress,
    List<OrderTrackingEntity>? tracking,
  }) = _OrderEntity;
}

@freezed
class OrderTrackingEntity with _$OrderTrackingEntity {
  const factory OrderTrackingEntity({
    required String id,
    required String status,
    String? trackingId,
    required String createdAt,
  }) = _OrderTrackingEntity;
}

@freezed
class OrderItemEntity with _$OrderItemEntity {
  const factory OrderItemEntity({
    required String id,
    required String productName,
    Map<String, dynamic>? variantAttributes,
    required int quantity,
    required double unitPrice,
  }) = _OrderItemEntity;
}

@freezed
class OrderShippingAddressEntity with _$OrderShippingAddressEntity {
  const factory OrderShippingAddressEntity({
    required String receiverName,
    required String phoneNumber,
    required String country,
    required String state,
    required String address,
  }) = _OrderShippingAddressEntity;
}

@freezed
class ReviewEntity with _$ReviewEntity {
  const factory ReviewEntity({
    required String id,
    required int rating,
    required String comment,
    required String createdAt,
    ReviewUserEntity? user,
  }) = _ReviewEntity;
}

@freezed
class ReviewUserEntity with _$ReviewUserEntity {
  const factory ReviewUserEntity({
    required String name,
  }) = _ReviewUserEntity;
}

@freezed
class WatchlistItemEntity with _$WatchlistItemEntity {
  const factory WatchlistItemEntity({
    required String id,
    required String createdAt,
    WatchlistProductEntity? product,
  }) = _WatchlistItemEntity;
}

@freezed
class WatchlistProductEntity with _$WatchlistProductEntity {
  const factory WatchlistProductEntity({
    required String id,
    required String name,
    required double price,
    double? discountPrice,
    required bool inStock,
    List<ProductImageEntity>? images,
  }) = _WatchlistProductEntity;

  const WatchlistProductEntity._();

  String get imageUrl => images?.isNotEmpty == true ? images!.first.url : '';
}
