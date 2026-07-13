// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImageModelImpl _$$ProductImageModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductImageModelImpl(
      id: json['id'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$ProductImageModelImplToJson(
        _$ProductImageModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
    };

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      discountPrice: (json['discountPrice'] as num?)?.toDouble(),
      inStock: json['inStock'] as bool,
      stockQuantity: (json['stockQuantity'] as num).toInt(),
      variants: (json['variants'] as List<dynamic>)
          .map((e) => ProductVariantModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ProductImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'discountPrice': instance.discountPrice,
      'inStock': instance.inStock,
      'stockQuantity': instance.stockQuantity,
      'variants': instance.variants,
      'images': instance.images,
    };

_$ProductVariantModelImpl _$$ProductVariantModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductVariantModelImpl(
      id: json['id'] as String,
      attributes: json['attributes'] as Map<String, dynamic>,
      stockQuantity: (json['stockQuantity'] as num).toInt(),
    );

Map<String, dynamic> _$$ProductVariantModelImplToJson(
        _$ProductVariantModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attributes': instance.attributes,
      'stockQuantity': instance.stockQuantity,
    };

_$CategoryModelImpl _$$CategoryModelImplFromJson(Map<String, dynamic> json) =>
    _$CategoryModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      iconUrl: json['iconUrl'] as String,
    );

Map<String, dynamic> _$$CategoryModelImplToJson(_$CategoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'iconUrl': instance.iconUrl,
    };

_$HomepageModelImpl _$$HomepageModelImplFromJson(Map<String, dynamic> json) =>
    _$HomepageModelImpl(
      featuredProducts: (json['featuredProducts'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$HomepageModelImplToJson(_$HomepageModelImpl instance) =>
    <String, dynamic>{
      'featuredProducts': instance.featuredProducts,
      'categories': instance.categories,
    };

_$ProductsResponseModelImpl _$$ProductsResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductsResponseModelImpl(
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
    );

Map<String, dynamic> _$$ProductsResponseModelImplToJson(
        _$ProductsResponseModelImpl instance) =>
    <String, dynamic>{
      'products': instance.products,
      'total': instance.total,
      'page': instance.page,
      'limit': instance.limit,
      'totalPages': instance.totalPages,
    };

_$CartModelImpl _$$CartModelImplFromJson(Map<String, dynamic> json) =>
    _$CartModelImpl(
      id: json['id'] as String,
      updatedAt: json['updatedAt'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CartModelImplToJson(_$CartModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'updatedAt': instance.updatedAt,
      'items': instance.items,
    };

_$CartItemModelImpl _$$CartItemModelImplFromJson(Map<String, dynamic> json) =>
    _$CartItemModelImpl(
      id: json['id'] as String,
      productId: json['productId'] as String,
      variantId: json['variantId'] as String?,
      quantity: (json['quantity'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      product:
          CartProductModel.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CartItemModelImplToJson(_$CartItemModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'variantId': instance.variantId,
      'quantity': instance.quantity,
      'price': instance.price,
      'product': instance.product,
    };

_$CartProductModelImpl _$$CartProductModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CartProductModelImpl(
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$$CartProductModelImplToJson(
        _$CartProductModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'imageUrl': instance.imageUrl,
    };

_$OrderModelImpl _$$OrderModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderModelImpl(
      id: json['id'] as String,
      orderNumber: json['orderNumber'] as String,
      status: json['status'] as String,
      subtotal: (json['subtotal'] as num).toDouble(),
      deliveryFee: (json['deliveryFee'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      createdAt: json['createdAt'] as String,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => OrderItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      shippingAddress: json['shippingAddress'] == null
          ? null
          : OrderShippingAddressModel.fromJson(
              json['shippingAddress'] as Map<String, dynamic>),
      tracking: (json['tracking'] as List<dynamic>?)
          ?.map((e) => OrderTrackingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OrderModelImplToJson(_$OrderModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderNumber': instance.orderNumber,
      'status': instance.status,
      'subtotal': instance.subtotal,
      'deliveryFee': instance.deliveryFee,
      'discount': instance.discount,
      'total': instance.total,
      'createdAt': instance.createdAt,
      'items': instance.items,
      'shippingAddress': instance.shippingAddress,
      'tracking': instance.tracking,
    };

_$OrderTrackingModelImpl _$$OrderTrackingModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderTrackingModelImpl(
      id: json['id'] as String,
      status: json['status'] as String,
      trackingId: json['trackingId'] as String?,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$OrderTrackingModelImplToJson(
        _$OrderTrackingModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'trackingId': instance.trackingId,
      'createdAt': instance.createdAt,
    };

_$OrderItemModelImpl _$$OrderItemModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderItemModelImpl(
      id: json['id'] as String,
      productId: json['productId'] as String,
      variantId: json['variantId'] as String?,
      quantity: (json['quantity'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      product:
          CartProductModel.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OrderItemModelImplToJson(
        _$OrderItemModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'variantId': instance.variantId,
      'quantity': instance.quantity,
      'price': instance.price,
      'product': instance.product,
    };

_$OrderShippingAddressModelImpl _$$OrderShippingAddressModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderShippingAddressModelImpl(
      receiverName: json['receiverName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      country: json['country'] as String,
      state: json['state'] as String,
      address: json['address'] as String,
    );

Map<String, dynamic> _$$OrderShippingAddressModelImplToJson(
        _$OrderShippingAddressModelImpl instance) =>
    <String, dynamic>{
      'receiverName': instance.receiverName,
      'phoneNumber': instance.phoneNumber,
      'country': instance.country,
      'state': instance.state,
      'address': instance.address,
    };

_$ReviewModelImpl _$$ReviewModelImplFromJson(Map<String, dynamic> json) =>
    _$ReviewModelImpl(
      id: json['id'] as String,
      rating: (json['rating'] as num).toInt(),
      comment: json['comment'] as String,
      createdAt: json['createdAt'] as String,
      user: json['user'] == null
          ? null
          : ReviewUserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ReviewModelImplToJson(_$ReviewModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rating': instance.rating,
      'comment': instance.comment,
      'createdAt': instance.createdAt,
      'user': instance.user,
    };

_$ReviewUserModelImpl _$$ReviewUserModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ReviewUserModelImpl(
      name: json['name'] as String,
    );

Map<String, dynamic> _$$ReviewUserModelImplToJson(
        _$ReviewUserModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

_$WatchlistItemModelImpl _$$WatchlistItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WatchlistItemModelImpl(
      id: json['id'] as String,
      createdAt: json['createdAt'] as String,
      product: WatchlistProductModel.fromJson(
          json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WatchlistItemModelImplToJson(
        _$WatchlistItemModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'product': instance.product,
    };

_$WatchlistProductModelImpl _$$WatchlistProductModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WatchlistProductModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      discountPrice: (json['discountPrice'] as num?)?.toDouble(),
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$$WatchlistProductModelImplToJson(
        _$WatchlistProductModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'discountPrice': instance.discountPrice,
      'imageUrl': instance.imageUrl,
    };
