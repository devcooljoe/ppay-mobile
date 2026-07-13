import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ppay_mobile/module/shopping/domain/entities/shopping_entity.dart';

part 'shopping_model.freezed.dart';
part 'shopping_model.g.dart';

@freezed
class ProductImageModel with _$ProductImageModel {
  const factory ProductImageModel({
    required String id,
    required String url,
  }) = _ProductImageModel;

  const ProductImageModel._();

  factory ProductImageModel.fromJson(Map<String, dynamic> json) => _$ProductImageModelFromJson(json);

  ProductImageEntity toEntity() => ProductImageEntity(id: id, url: url);
}

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    required String id,
    required String name,
    required String description,
    required double price,
    double? discountPrice,
    required bool inStock,
    required int stockQuantity,
    required List<ProductVariantModel> variants,
    List<ProductImageModel>? images,
  }) = _ProductModel;

  const ProductModel._();

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

  ProductEntity toEntity() => ProductEntity(
    id: id,
    name: name,
    description: description,
    price: price,
    discountPrice: discountPrice,
    inStock: inStock,
    stockQuantity: stockQuantity,
    variants: variants.map((e) => e.toEntity()).toList(),
    images: images?.map((e) => e.toEntity()).toList(),
  );
}

@freezed
class ProductVariantModel with _$ProductVariantModel {
  const factory ProductVariantModel({
    required String id,
    required Map<String, dynamic> attributes,
    required int stockQuantity,
  }) = _ProductVariantModel;

  const ProductVariantModel._();

  factory ProductVariantModel.fromJson(Map<String, dynamic> json) => _$ProductVariantModelFromJson(json);

  ProductVariantEntity toEntity() => ProductVariantEntity(
    id: id,
    attributes: attributes,
    stockQuantity: stockQuantity,
  );
}

@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required String id,
    required String name,
    required String iconUrl,
  }) = _CategoryModel;

  const CategoryModel._();

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);

  CategoryEntity toEntity() => CategoryEntity(id: id, name: name, iconUrl: iconUrl);
}

@freezed
class HomepageModel with _$HomepageModel {
  const factory HomepageModel({
    required List<ProductModel> featuredProducts,
    required List<CategoryModel> categories,
  }) = _HomepageModel;

  const HomepageModel._();

  factory HomepageModel.fromJson(Map<String, dynamic> json) => _$HomepageModelFromJson(json);

  HomepageEntity toEntity() => HomepageEntity(
    featuredProducts: featuredProducts.map((e) => e.toEntity()).toList(),
    categories: categories.map((e) => e.toEntity()).toList(),
  );
}

@freezed
class ProductsResponseModel with _$ProductsResponseModel {
  const factory ProductsResponseModel({
    required List<ProductModel> products,
    required int total,
    required int page,
    required int limit,
    required int totalPages,
  }) = _ProductsResponseModel;

  const ProductsResponseModel._();

  factory ProductsResponseModel.fromJson(Map<String, dynamic> json) => _$ProductsResponseModelFromJson(json);

  ProductsResponseEntity toEntity() => ProductsResponseEntity(
    products: products.map((e) => e.toEntity()).toList(),
    total: total,
    page: page,
    limit: limit,
    totalPages: totalPages,
  );
}

@freezed
class CartModel with _$CartModel {
  const factory CartModel({
    required String id,
    required String updatedAt,
    required List<CartItemModel> items,
  }) = _CartModel;

  const CartModel._();

  factory CartModel.fromJson(Map<String, dynamic> json) => _$CartModelFromJson(json);

  CartEntity toEntity() => CartEntity(
    id: id,
    updatedAt: updatedAt,
    items: items.map((e) => e.toEntity()).toList(),
  );
}

@freezed
class CartItemModel with _$CartItemModel {
  const factory CartItemModel({
    required String id,
    required String productId,
    String? variantId,
    required int quantity,
    required double price,
    required CartProductModel product,
  }) = _CartItemModel;

  const CartItemModel._();

  factory CartItemModel.fromJson(Map<String, dynamic> json) => _$CartItemModelFromJson(json);

  CartItemEntity toEntity() => CartItemEntity(
    id: id,
    productId: productId,
    variantId: variantId,
    quantity: quantity,
    price: price,
    product: product.toEntity(),
  );
}

@freezed
class CartProductModel with _$CartProductModel {
  const factory CartProductModel({
    required String name,
    required String imageUrl,
  }) = _CartProductModel;

  const CartProductModel._();

  factory CartProductModel.fromJson(Map<String, dynamic> json) => _$CartProductModelFromJson(json);

  CartProductEntity toEntity() => CartProductEntity(name: name, imageUrl: imageUrl);
}

@freezed
class OrderModel with _$OrderModel {
  const factory OrderModel({
    required String id,
    required String orderNumber,
    required String status,
    required double subtotal,
    required double deliveryFee,
    required double discount,
    required double total,
    required String createdAt,
    List<OrderItemModel>? items,
    OrderShippingAddressModel? shippingAddress,
    List<OrderTrackingModel>? tracking,
  }) = _OrderModel;

  const OrderModel._();

  factory OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);

  OrderEntity toEntity() => OrderEntity(
    id: id,
    orderNumber: orderNumber,
    status: status,
    subtotal: subtotal,
    deliveryFee: deliveryFee,
    discount: discount,
    total: total,
    createdAt: createdAt,
    items: items?.map((e) => e.toEntity()).toList(),
    shippingAddress: shippingAddress?.toEntity(),
    tracking: tracking?.map((e) => e.toEntity()).toList(),
  );
}

@freezed
class OrderTrackingModel with _$OrderTrackingModel {
  const factory OrderTrackingModel({
    required String id,
    required String status,
    String? trackingId,
    required String createdAt,
  }) = _OrderTrackingModel;

  const OrderTrackingModel._();

  factory OrderTrackingModel.fromJson(Map<String, dynamic> json) => _$OrderTrackingModelFromJson(json);

  OrderTrackingEntity toEntity() => OrderTrackingEntity(
    id: id,
    status: status,
    trackingId: trackingId,
    createdAt: createdAt,
  );
}

@freezed
class OrderItemModel with _$OrderItemModel {
  const factory OrderItemModel({
    required String id,
    required String productId,
    String? variantId,
    required int quantity,
    required double price,
    required CartProductModel product,
  }) = _OrderItemModel;

  const OrderItemModel._();

  factory OrderItemModel.fromJson(Map<String, dynamic> json) => _$OrderItemModelFromJson(json);

  OrderItemEntity toEntity() => OrderItemEntity(
    id: id,
    productId: productId,
    variantId: variantId,
    quantity: quantity,
    price: price,
    product: product.toEntity(),
  );
}

@freezed
class OrderShippingAddressModel with _$OrderShippingAddressModel {
  const factory OrderShippingAddressModel({
    required String receiverName,
    required String phoneNumber,
    required String country,
    required String state,
    required String address,
  }) = _OrderShippingAddressModel;

  const OrderShippingAddressModel._();

  factory OrderShippingAddressModel.fromJson(Map<String, dynamic> json) => _$OrderShippingAddressModelFromJson(json);

  OrderShippingAddressEntity toEntity() => OrderShippingAddressEntity(
    receiverName: receiverName,
    phoneNumber: phoneNumber,
    country: country,
    state: state,
    address: address,
  );
}

@freezed
class ReviewModel with _$ReviewModel {
  const factory ReviewModel({
    required String id,
    required int rating,
    required String comment,
    required String createdAt,
    ReviewUserModel? user,
  }) = _ReviewModel;

  const ReviewModel._();

  factory ReviewModel.fromJson(Map<String, dynamic> json) => _$ReviewModelFromJson(json);

  ReviewEntity toEntity() => ReviewEntity(
    id: id,
    rating: rating,
    comment: comment,
    createdAt: createdAt,
    user: user?.toEntity(),
  );
}

@freezed
class ReviewUserModel with _$ReviewUserModel {
  const factory ReviewUserModel({
    required String name,
  }) = _ReviewUserModel;

  const ReviewUserModel._();

  factory ReviewUserModel.fromJson(Map<String, dynamic> json) => _$ReviewUserModelFromJson(json);

  ReviewUserEntity toEntity() => ReviewUserEntity(name: name);
}

@freezed
class WatchlistItemModel with _$WatchlistItemModel {
  const factory WatchlistItemModel({
    required String id,
    required String createdAt,
    required WatchlistProductModel product,
  }) = _WatchlistItemModel;

  const WatchlistItemModel._();

  factory WatchlistItemModel.fromJson(Map<String, dynamic> json) => _$WatchlistItemModelFromJson(json);

  WatchlistItemEntity toEntity() => WatchlistItemEntity(
    id: id,
    createdAt: createdAt,
    product: product.toEntity(),
  );
}

@freezed
class WatchlistProductModel with _$WatchlistProductModel {
  const factory WatchlistProductModel({
    required String id,
    required String name,
    required double price,
    double? discountPrice,
    required String imageUrl,
  }) = _WatchlistProductModel;

  const WatchlistProductModel._();

  factory WatchlistProductModel.fromJson(Map<String, dynamic> json) => _$WatchlistProductModelFromJson(json);

  WatchlistProductEntity toEntity() => WatchlistProductEntity(
    id: id,
    name: name,
    price: price,
    discountPrice: discountPrice,
    imageUrl: imageUrl,
  );
}
