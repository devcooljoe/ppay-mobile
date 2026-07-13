// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductImageEntity {
  String get id => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductImageEntityCopyWith<ProductImageEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductImageEntityCopyWith<$Res> {
  factory $ProductImageEntityCopyWith(
          ProductImageEntity value, $Res Function(ProductImageEntity) then) =
      _$ProductImageEntityCopyWithImpl<$Res, ProductImageEntity>;
  @useResult
  $Res call({String id, String url});
}

/// @nodoc
class _$ProductImageEntityCopyWithImpl<$Res, $Val extends ProductImageEntity>
    implements $ProductImageEntityCopyWith<$Res> {
  _$ProductImageEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductImageEntityImplCopyWith<$Res>
    implements $ProductImageEntityCopyWith<$Res> {
  factory _$$ProductImageEntityImplCopyWith(_$ProductImageEntityImpl value,
          $Res Function(_$ProductImageEntityImpl) then) =
      __$$ProductImageEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String url});
}

/// @nodoc
class __$$ProductImageEntityImplCopyWithImpl<$Res>
    extends _$ProductImageEntityCopyWithImpl<$Res, _$ProductImageEntityImpl>
    implements _$$ProductImageEntityImplCopyWith<$Res> {
  __$$ProductImageEntityImplCopyWithImpl(_$ProductImageEntityImpl _value,
      $Res Function(_$ProductImageEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
  }) {
    return _then(_$ProductImageEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProductImageEntityImpl implements _ProductImageEntity {
  const _$ProductImageEntityImpl({required this.id, required this.url});

  @override
  final String id;
  @override
  final String url;

  @override
  String toString() {
    return 'ProductImageEntity(id: $id, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImageEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImageEntityImplCopyWith<_$ProductImageEntityImpl> get copyWith =>
      __$$ProductImageEntityImplCopyWithImpl<_$ProductImageEntityImpl>(
          this, _$identity);
}

abstract class _ProductImageEntity implements ProductImageEntity {
  const factory _ProductImageEntity(
      {required final String id,
      required final String url}) = _$ProductImageEntityImpl;

  @override
  String get id;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$ProductImageEntityImplCopyWith<_$ProductImageEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double? get discountPrice => throw _privateConstructorUsedError;
  bool get inStock => throw _privateConstructorUsedError;
  int get stockQuantity => throw _privateConstructorUsedError;
  List<ProductVariantEntity> get variants => throw _privateConstructorUsedError;
  List<ProductImageEntity>? get images => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductEntityCopyWith<ProductEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductEntityCopyWith<$Res> {
  factory $ProductEntityCopyWith(
          ProductEntity value, $Res Function(ProductEntity) then) =
      _$ProductEntityCopyWithImpl<$Res, ProductEntity>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      double price,
      double? discountPrice,
      bool inStock,
      int stockQuantity,
      List<ProductVariantEntity> variants,
      List<ProductImageEntity>? images});
}

/// @nodoc
class _$ProductEntityCopyWithImpl<$Res, $Val extends ProductEntity>
    implements $ProductEntityCopyWith<$Res> {
  _$ProductEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? discountPrice = freezed,
    Object? inStock = null,
    Object? stockQuantity = null,
    Object? variants = null,
    Object? images = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      discountPrice: freezed == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      inStock: null == inStock
          ? _value.inStock
          : inStock // ignore: cast_nullable_to_non_nullable
              as bool,
      stockQuantity: null == stockQuantity
          ? _value.stockQuantity
          : stockQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      variants: null == variants
          ? _value.variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<ProductVariantEntity>,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ProductImageEntity>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductEntityImplCopyWith<$Res>
    implements $ProductEntityCopyWith<$Res> {
  factory _$$ProductEntityImplCopyWith(
          _$ProductEntityImpl value, $Res Function(_$ProductEntityImpl) then) =
      __$$ProductEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      double price,
      double? discountPrice,
      bool inStock,
      int stockQuantity,
      List<ProductVariantEntity> variants,
      List<ProductImageEntity>? images});
}

/// @nodoc
class __$$ProductEntityImplCopyWithImpl<$Res>
    extends _$ProductEntityCopyWithImpl<$Res, _$ProductEntityImpl>
    implements _$$ProductEntityImplCopyWith<$Res> {
  __$$ProductEntityImplCopyWithImpl(
      _$ProductEntityImpl _value, $Res Function(_$ProductEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? discountPrice = freezed,
    Object? inStock = null,
    Object? stockQuantity = null,
    Object? variants = null,
    Object? images = freezed,
  }) {
    return _then(_$ProductEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      discountPrice: freezed == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      inStock: null == inStock
          ? _value.inStock
          : inStock // ignore: cast_nullable_to_non_nullable
              as bool,
      stockQuantity: null == stockQuantity
          ? _value.stockQuantity
          : stockQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      variants: null == variants
          ? _value._variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<ProductVariantEntity>,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ProductImageEntity>?,
    ));
  }
}

/// @nodoc

class _$ProductEntityImpl implements _ProductEntity {
  const _$ProductEntityImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      this.discountPrice,
      required this.inStock,
      required this.stockQuantity,
      required final List<ProductVariantEntity> variants,
      final List<ProductImageEntity>? images})
      : _variants = variants,
        _images = images;

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final double price;
  @override
  final double? discountPrice;
  @override
  final bool inStock;
  @override
  final int stockQuantity;
  final List<ProductVariantEntity> _variants;
  @override
  List<ProductVariantEntity> get variants {
    if (_variants is EqualUnmodifiableListView) return _variants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_variants);
  }

  final List<ProductImageEntity>? _images;
  @override
  List<ProductImageEntity>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ProductEntity(id: $id, name: $name, description: $description, price: $price, discountPrice: $discountPrice, inStock: $inStock, stockQuantity: $stockQuantity, variants: $variants, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discountPrice, discountPrice) ||
                other.discountPrice == discountPrice) &&
            (identical(other.inStock, inStock) || other.inStock == inStock) &&
            (identical(other.stockQuantity, stockQuantity) ||
                other.stockQuantity == stockQuantity) &&
            const DeepCollectionEquality().equals(other._variants, _variants) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      price,
      discountPrice,
      inStock,
      stockQuantity,
      const DeepCollectionEquality().hash(_variants),
      const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductEntityImplCopyWith<_$ProductEntityImpl> get copyWith =>
      __$$ProductEntityImplCopyWithImpl<_$ProductEntityImpl>(this, _$identity);
}

abstract class _ProductEntity implements ProductEntity {
  const factory _ProductEntity(
      {required final String id,
      required final String name,
      required final String description,
      required final double price,
      final double? discountPrice,
      required final bool inStock,
      required final int stockQuantity,
      required final List<ProductVariantEntity> variants,
      final List<ProductImageEntity>? images}) = _$ProductEntityImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  double get price;
  @override
  double? get discountPrice;
  @override
  bool get inStock;
  @override
  int get stockQuantity;
  @override
  List<ProductVariantEntity> get variants;
  @override
  List<ProductImageEntity>? get images;
  @override
  @JsonKey(ignore: true)
  _$$ProductEntityImplCopyWith<_$ProductEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductVariantEntity {
  String get id => throw _privateConstructorUsedError;
  Map<String, dynamic> get attributes => throw _privateConstructorUsedError;
  int get stockQuantity => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductVariantEntityCopyWith<ProductVariantEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductVariantEntityCopyWith<$Res> {
  factory $ProductVariantEntityCopyWith(ProductVariantEntity value,
          $Res Function(ProductVariantEntity) then) =
      _$ProductVariantEntityCopyWithImpl<$Res, ProductVariantEntity>;
  @useResult
  $Res call({String id, Map<String, dynamic> attributes, int stockQuantity});
}

/// @nodoc
class _$ProductVariantEntityCopyWithImpl<$Res,
        $Val extends ProductVariantEntity>
    implements $ProductVariantEntityCopyWith<$Res> {
  _$ProductVariantEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? attributes = null,
    Object? stockQuantity = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      attributes: null == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      stockQuantity: null == stockQuantity
          ? _value.stockQuantity
          : stockQuantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductVariantEntityImplCopyWith<$Res>
    implements $ProductVariantEntityCopyWith<$Res> {
  factory _$$ProductVariantEntityImplCopyWith(_$ProductVariantEntityImpl value,
          $Res Function(_$ProductVariantEntityImpl) then) =
      __$$ProductVariantEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, Map<String, dynamic> attributes, int stockQuantity});
}

/// @nodoc
class __$$ProductVariantEntityImplCopyWithImpl<$Res>
    extends _$ProductVariantEntityCopyWithImpl<$Res, _$ProductVariantEntityImpl>
    implements _$$ProductVariantEntityImplCopyWith<$Res> {
  __$$ProductVariantEntityImplCopyWithImpl(_$ProductVariantEntityImpl _value,
      $Res Function(_$ProductVariantEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? attributes = null,
    Object? stockQuantity = null,
  }) {
    return _then(_$ProductVariantEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      attributes: null == attributes
          ? _value._attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      stockQuantity: null == stockQuantity
          ? _value.stockQuantity
          : stockQuantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ProductVariantEntityImpl implements _ProductVariantEntity {
  const _$ProductVariantEntityImpl(
      {required this.id,
      required final Map<String, dynamic> attributes,
      required this.stockQuantity})
      : _attributes = attributes;

  @override
  final String id;
  final Map<String, dynamic> _attributes;
  @override
  Map<String, dynamic> get attributes {
    if (_attributes is EqualUnmodifiableMapView) return _attributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_attributes);
  }

  @override
  final int stockQuantity;

  @override
  String toString() {
    return 'ProductVariantEntity(id: $id, attributes: $attributes, stockQuantity: $stockQuantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductVariantEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._attributes, _attributes) &&
            (identical(other.stockQuantity, stockQuantity) ||
                other.stockQuantity == stockQuantity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id,
      const DeepCollectionEquality().hash(_attributes), stockQuantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductVariantEntityImplCopyWith<_$ProductVariantEntityImpl>
      get copyWith =>
          __$$ProductVariantEntityImplCopyWithImpl<_$ProductVariantEntityImpl>(
              this, _$identity);
}

abstract class _ProductVariantEntity implements ProductVariantEntity {
  const factory _ProductVariantEntity(
      {required final String id,
      required final Map<String, dynamic> attributes,
      required final int stockQuantity}) = _$ProductVariantEntityImpl;

  @override
  String get id;
  @override
  Map<String, dynamic> get attributes;
  @override
  int get stockQuantity;
  @override
  @JsonKey(ignore: true)
  _$$ProductVariantEntityImplCopyWith<_$ProductVariantEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CategoryEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get iconUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryEntityCopyWith<CategoryEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryEntityCopyWith<$Res> {
  factory $CategoryEntityCopyWith(
          CategoryEntity value, $Res Function(CategoryEntity) then) =
      _$CategoryEntityCopyWithImpl<$Res, CategoryEntity>;
  @useResult
  $Res call({String id, String name, String iconUrl});
}

/// @nodoc
class _$CategoryEntityCopyWithImpl<$Res, $Val extends CategoryEntity>
    implements $CategoryEntityCopyWith<$Res> {
  _$CategoryEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? iconUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      iconUrl: null == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryEntityImplCopyWith<$Res>
    implements $CategoryEntityCopyWith<$Res> {
  factory _$$CategoryEntityImplCopyWith(_$CategoryEntityImpl value,
          $Res Function(_$CategoryEntityImpl) then) =
      __$$CategoryEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String iconUrl});
}

/// @nodoc
class __$$CategoryEntityImplCopyWithImpl<$Res>
    extends _$CategoryEntityCopyWithImpl<$Res, _$CategoryEntityImpl>
    implements _$$CategoryEntityImplCopyWith<$Res> {
  __$$CategoryEntityImplCopyWithImpl(
      _$CategoryEntityImpl _value, $Res Function(_$CategoryEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? iconUrl = null,
  }) {
    return _then(_$CategoryEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      iconUrl: null == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CategoryEntityImpl implements _CategoryEntity {
  const _$CategoryEntityImpl(
      {required this.id, required this.name, required this.iconUrl});

  @override
  final String id;
  @override
  final String name;
  @override
  final String iconUrl;

  @override
  String toString() {
    return 'CategoryEntity(id: $id, name: $name, iconUrl: $iconUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, iconUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryEntityImplCopyWith<_$CategoryEntityImpl> get copyWith =>
      __$$CategoryEntityImplCopyWithImpl<_$CategoryEntityImpl>(
          this, _$identity);
}

abstract class _CategoryEntity implements CategoryEntity {
  const factory _CategoryEntity(
      {required final String id,
      required final String name,
      required final String iconUrl}) = _$CategoryEntityImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String get iconUrl;
  @override
  @JsonKey(ignore: true)
  _$$CategoryEntityImplCopyWith<_$CategoryEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HomepageEntity {
  List<ProductEntity> get featuredProducts =>
      throw _privateConstructorUsedError;
  List<CategoryEntity> get categories => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomepageEntityCopyWith<HomepageEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomepageEntityCopyWith<$Res> {
  factory $HomepageEntityCopyWith(
          HomepageEntity value, $Res Function(HomepageEntity) then) =
      _$HomepageEntityCopyWithImpl<$Res, HomepageEntity>;
  @useResult
  $Res call(
      {List<ProductEntity> featuredProducts, List<CategoryEntity> categories});
}

/// @nodoc
class _$HomepageEntityCopyWithImpl<$Res, $Val extends HomepageEntity>
    implements $HomepageEntityCopyWith<$Res> {
  _$HomepageEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? featuredProducts = null,
    Object? categories = null,
  }) {
    return _then(_value.copyWith(
      featuredProducts: null == featuredProducts
          ? _value.featuredProducts
          : featuredProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductEntity>,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomepageEntityImplCopyWith<$Res>
    implements $HomepageEntityCopyWith<$Res> {
  factory _$$HomepageEntityImplCopyWith(_$HomepageEntityImpl value,
          $Res Function(_$HomepageEntityImpl) then) =
      __$$HomepageEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ProductEntity> featuredProducts, List<CategoryEntity> categories});
}

/// @nodoc
class __$$HomepageEntityImplCopyWithImpl<$Res>
    extends _$HomepageEntityCopyWithImpl<$Res, _$HomepageEntityImpl>
    implements _$$HomepageEntityImplCopyWith<$Res> {
  __$$HomepageEntityImplCopyWithImpl(
      _$HomepageEntityImpl _value, $Res Function(_$HomepageEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? featuredProducts = null,
    Object? categories = null,
  }) {
    return _then(_$HomepageEntityImpl(
      featuredProducts: null == featuredProducts
          ? _value._featuredProducts
          : featuredProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductEntity>,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryEntity>,
    ));
  }
}

/// @nodoc

class _$HomepageEntityImpl implements _HomepageEntity {
  const _$HomepageEntityImpl(
      {required final List<ProductEntity> featuredProducts,
      required final List<CategoryEntity> categories})
      : _featuredProducts = featuredProducts,
        _categories = categories;

  final List<ProductEntity> _featuredProducts;
  @override
  List<ProductEntity> get featuredProducts {
    if (_featuredProducts is EqualUnmodifiableListView)
      return _featuredProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_featuredProducts);
  }

  final List<CategoryEntity> _categories;
  @override
  List<CategoryEntity> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'HomepageEntity(featuredProducts: $featuredProducts, categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomepageEntityImpl &&
            const DeepCollectionEquality()
                .equals(other._featuredProducts, _featuredProducts) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_featuredProducts),
      const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomepageEntityImplCopyWith<_$HomepageEntityImpl> get copyWith =>
      __$$HomepageEntityImplCopyWithImpl<_$HomepageEntityImpl>(
          this, _$identity);
}

abstract class _HomepageEntity implements HomepageEntity {
  const factory _HomepageEntity(
      {required final List<ProductEntity> featuredProducts,
      required final List<CategoryEntity> categories}) = _$HomepageEntityImpl;

  @override
  List<ProductEntity> get featuredProducts;
  @override
  List<CategoryEntity> get categories;
  @override
  @JsonKey(ignore: true)
  _$$HomepageEntityImplCopyWith<_$HomepageEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductsResponseEntity {
  List<ProductEntity> get products => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductsResponseEntityCopyWith<ProductsResponseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsResponseEntityCopyWith<$Res> {
  factory $ProductsResponseEntityCopyWith(ProductsResponseEntity value,
          $Res Function(ProductsResponseEntity) then) =
      _$ProductsResponseEntityCopyWithImpl<$Res, ProductsResponseEntity>;
  @useResult
  $Res call(
      {List<ProductEntity> products,
      int total,
      int page,
      int limit,
      int totalPages});
}

/// @nodoc
class _$ProductsResponseEntityCopyWithImpl<$Res,
        $Val extends ProductsResponseEntity>
    implements $ProductsResponseEntityCopyWith<$Res> {
  _$ProductsResponseEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? total = null,
    Object? page = null,
    Object? limit = null,
    Object? totalPages = null,
  }) {
    return _then(_value.copyWith(
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductEntity>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductsResponseEntityImplCopyWith<$Res>
    implements $ProductsResponseEntityCopyWith<$Res> {
  factory _$$ProductsResponseEntityImplCopyWith(
          _$ProductsResponseEntityImpl value,
          $Res Function(_$ProductsResponseEntityImpl) then) =
      __$$ProductsResponseEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ProductEntity> products,
      int total,
      int page,
      int limit,
      int totalPages});
}

/// @nodoc
class __$$ProductsResponseEntityImplCopyWithImpl<$Res>
    extends _$ProductsResponseEntityCopyWithImpl<$Res,
        _$ProductsResponseEntityImpl>
    implements _$$ProductsResponseEntityImplCopyWith<$Res> {
  __$$ProductsResponseEntityImplCopyWithImpl(
      _$ProductsResponseEntityImpl _value,
      $Res Function(_$ProductsResponseEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? total = null,
    Object? page = null,
    Object? limit = null,
    Object? totalPages = null,
  }) {
    return _then(_$ProductsResponseEntityImpl(
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductEntity>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ProductsResponseEntityImpl implements _ProductsResponseEntity {
  const _$ProductsResponseEntityImpl(
      {required final List<ProductEntity> products,
      required this.total,
      required this.page,
      required this.limit,
      required this.totalPages})
      : _products = products;

  final List<ProductEntity> _products;
  @override
  List<ProductEntity> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  final int total;
  @override
  final int page;
  @override
  final int limit;
  @override
  final int totalPages;

  @override
  String toString() {
    return 'ProductsResponseEntity(products: $products, total: $total, page: $page, limit: $limit, totalPages: $totalPages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductsResponseEntityImpl &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_products),
      total,
      page,
      limit,
      totalPages);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductsResponseEntityImplCopyWith<_$ProductsResponseEntityImpl>
      get copyWith => __$$ProductsResponseEntityImplCopyWithImpl<
          _$ProductsResponseEntityImpl>(this, _$identity);
}

abstract class _ProductsResponseEntity implements ProductsResponseEntity {
  const factory _ProductsResponseEntity(
      {required final List<ProductEntity> products,
      required final int total,
      required final int page,
      required final int limit,
      required final int totalPages}) = _$ProductsResponseEntityImpl;

  @override
  List<ProductEntity> get products;
  @override
  int get total;
  @override
  int get page;
  @override
  int get limit;
  @override
  int get totalPages;
  @override
  @JsonKey(ignore: true)
  _$$ProductsResponseEntityImplCopyWith<_$ProductsResponseEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CartEntity {
  String get id => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  List<CartItemEntity> get items => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartEntityCopyWith<CartEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartEntityCopyWith<$Res> {
  factory $CartEntityCopyWith(
          CartEntity value, $Res Function(CartEntity) then) =
      _$CartEntityCopyWithImpl<$Res, CartEntity>;
  @useResult
  $Res call({String id, String updatedAt, List<CartItemEntity> items});
}

/// @nodoc
class _$CartEntityCopyWithImpl<$Res, $Val extends CartEntity>
    implements $CartEntityCopyWith<$Res> {
  _$CartEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? updatedAt = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItemEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartEntityImplCopyWith<$Res>
    implements $CartEntityCopyWith<$Res> {
  factory _$$CartEntityImplCopyWith(
          _$CartEntityImpl value, $Res Function(_$CartEntityImpl) then) =
      __$$CartEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String updatedAt, List<CartItemEntity> items});
}

/// @nodoc
class __$$CartEntityImplCopyWithImpl<$Res>
    extends _$CartEntityCopyWithImpl<$Res, _$CartEntityImpl>
    implements _$$CartEntityImplCopyWith<$Res> {
  __$$CartEntityImplCopyWithImpl(
      _$CartEntityImpl _value, $Res Function(_$CartEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? updatedAt = null,
    Object? items = null,
  }) {
    return _then(_$CartEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItemEntity>,
    ));
  }
}

/// @nodoc

class _$CartEntityImpl implements _CartEntity {
  const _$CartEntityImpl(
      {required this.id,
      required this.updatedAt,
      required final List<CartItemEntity> items})
      : _items = items;

  @override
  final String id;
  @override
  final String updatedAt;
  final List<CartItemEntity> _items;
  @override
  List<CartItemEntity> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'CartEntity(id: $id, updatedAt: $updatedAt, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, updatedAt, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartEntityImplCopyWith<_$CartEntityImpl> get copyWith =>
      __$$CartEntityImplCopyWithImpl<_$CartEntityImpl>(this, _$identity);
}

abstract class _CartEntity implements CartEntity {
  const factory _CartEntity(
      {required final String id,
      required final String updatedAt,
      required final List<CartItemEntity> items}) = _$CartEntityImpl;

  @override
  String get id;
  @override
  String get updatedAt;
  @override
  List<CartItemEntity> get items;
  @override
  @JsonKey(ignore: true)
  _$$CartEntityImplCopyWith<_$CartEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CartItemEntity {
  String get id => throw _privateConstructorUsedError;
  String get productId => throw _privateConstructorUsedError;
  String? get variantId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  CartProductEntity get product => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartItemEntityCopyWith<CartItemEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemEntityCopyWith<$Res> {
  factory $CartItemEntityCopyWith(
          CartItemEntity value, $Res Function(CartItemEntity) then) =
      _$CartItemEntityCopyWithImpl<$Res, CartItemEntity>;
  @useResult
  $Res call(
      {String id,
      String productId,
      String? variantId,
      int quantity,
      double price,
      CartProductEntity product});

  $CartProductEntityCopyWith<$Res> get product;
}

/// @nodoc
class _$CartItemEntityCopyWithImpl<$Res, $Val extends CartItemEntity>
    implements $CartItemEntityCopyWith<$Res> {
  _$CartItemEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? variantId = freezed,
    Object? quantity = null,
    Object? price = null,
    Object? product = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      variantId: freezed == variantId
          ? _value.variantId
          : variantId // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as CartProductEntity,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CartProductEntityCopyWith<$Res> get product {
    return $CartProductEntityCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CartItemEntityImplCopyWith<$Res>
    implements $CartItemEntityCopyWith<$Res> {
  factory _$$CartItemEntityImplCopyWith(_$CartItemEntityImpl value,
          $Res Function(_$CartItemEntityImpl) then) =
      __$$CartItemEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String productId,
      String? variantId,
      int quantity,
      double price,
      CartProductEntity product});

  @override
  $CartProductEntityCopyWith<$Res> get product;
}

/// @nodoc
class __$$CartItemEntityImplCopyWithImpl<$Res>
    extends _$CartItemEntityCopyWithImpl<$Res, _$CartItemEntityImpl>
    implements _$$CartItemEntityImplCopyWith<$Res> {
  __$$CartItemEntityImplCopyWithImpl(
      _$CartItemEntityImpl _value, $Res Function(_$CartItemEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? variantId = freezed,
    Object? quantity = null,
    Object? price = null,
    Object? product = null,
  }) {
    return _then(_$CartItemEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      variantId: freezed == variantId
          ? _value.variantId
          : variantId // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as CartProductEntity,
    ));
  }
}

/// @nodoc

class _$CartItemEntityImpl implements _CartItemEntity {
  const _$CartItemEntityImpl(
      {required this.id,
      required this.productId,
      this.variantId,
      required this.quantity,
      required this.price,
      required this.product});

  @override
  final String id;
  @override
  final String productId;
  @override
  final String? variantId;
  @override
  final int quantity;
  @override
  final double price;
  @override
  final CartProductEntity product;

  @override
  String toString() {
    return 'CartItemEntity(id: $id, productId: $productId, variantId: $variantId, quantity: $quantity, price: $price, product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.variantId, variantId) ||
                other.variantId == variantId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, productId, variantId, quantity, price, product);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemEntityImplCopyWith<_$CartItemEntityImpl> get copyWith =>
      __$$CartItemEntityImplCopyWithImpl<_$CartItemEntityImpl>(
          this, _$identity);
}

abstract class _CartItemEntity implements CartItemEntity {
  const factory _CartItemEntity(
      {required final String id,
      required final String productId,
      final String? variantId,
      required final int quantity,
      required final double price,
      required final CartProductEntity product}) = _$CartItemEntityImpl;

  @override
  String get id;
  @override
  String get productId;
  @override
  String? get variantId;
  @override
  int get quantity;
  @override
  double get price;
  @override
  CartProductEntity get product;
  @override
  @JsonKey(ignore: true)
  _$$CartItemEntityImplCopyWith<_$CartItemEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CartProductEntity {
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartProductEntityCopyWith<CartProductEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartProductEntityCopyWith<$Res> {
  factory $CartProductEntityCopyWith(
          CartProductEntity value, $Res Function(CartProductEntity) then) =
      _$CartProductEntityCopyWithImpl<$Res, CartProductEntity>;
  @useResult
  $Res call({String name, String imageUrl});
}

/// @nodoc
class _$CartProductEntityCopyWithImpl<$Res, $Val extends CartProductEntity>
    implements $CartProductEntityCopyWith<$Res> {
  _$CartProductEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartProductEntityImplCopyWith<$Res>
    implements $CartProductEntityCopyWith<$Res> {
  factory _$$CartProductEntityImplCopyWith(_$CartProductEntityImpl value,
          $Res Function(_$CartProductEntityImpl) then) =
      __$$CartProductEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String imageUrl});
}

/// @nodoc
class __$$CartProductEntityImplCopyWithImpl<$Res>
    extends _$CartProductEntityCopyWithImpl<$Res, _$CartProductEntityImpl>
    implements _$$CartProductEntityImplCopyWith<$Res> {
  __$$CartProductEntityImplCopyWithImpl(_$CartProductEntityImpl _value,
      $Res Function(_$CartProductEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? imageUrl = null,
  }) {
    return _then(_$CartProductEntityImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CartProductEntityImpl implements _CartProductEntity {
  const _$CartProductEntityImpl({required this.name, required this.imageUrl});

  @override
  final String name;
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'CartProductEntity(name: $name, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartProductEntityImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartProductEntityImplCopyWith<_$CartProductEntityImpl> get copyWith =>
      __$$CartProductEntityImplCopyWithImpl<_$CartProductEntityImpl>(
          this, _$identity);
}

abstract class _CartProductEntity implements CartProductEntity {
  const factory _CartProductEntity(
      {required final String name,
      required final String imageUrl}) = _$CartProductEntityImpl;

  @override
  String get name;
  @override
  String get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$CartProductEntityImplCopyWith<_$CartProductEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OrderEntity {
  String get id => throw _privateConstructorUsedError;
  String get orderNumber => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  double get subtotal => throw _privateConstructorUsedError;
  double get deliveryFee => throw _privateConstructorUsedError;
  double get discount => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  List<OrderItemEntity>? get items => throw _privateConstructorUsedError;
  OrderShippingAddressEntity? get shippingAddress =>
      throw _privateConstructorUsedError;
  List<OrderTrackingEntity>? get tracking => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderEntityCopyWith<OrderEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderEntityCopyWith<$Res> {
  factory $OrderEntityCopyWith(
          OrderEntity value, $Res Function(OrderEntity) then) =
      _$OrderEntityCopyWithImpl<$Res, OrderEntity>;
  @useResult
  $Res call(
      {String id,
      String orderNumber,
      String status,
      double subtotal,
      double deliveryFee,
      double discount,
      double total,
      String createdAt,
      List<OrderItemEntity>? items,
      OrderShippingAddressEntity? shippingAddress,
      List<OrderTrackingEntity>? tracking});

  $OrderShippingAddressEntityCopyWith<$Res>? get shippingAddress;
}

/// @nodoc
class _$OrderEntityCopyWithImpl<$Res, $Val extends OrderEntity>
    implements $OrderEntityCopyWith<$Res> {
  _$OrderEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? status = null,
    Object? subtotal = null,
    Object? deliveryFee = null,
    Object? discount = null,
    Object? total = null,
    Object? createdAt = null,
    Object? items = freezed,
    Object? shippingAddress = freezed,
    Object? tracking = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryFee: null == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItemEntity>?,
      shippingAddress: freezed == shippingAddress
          ? _value.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as OrderShippingAddressEntity?,
      tracking: freezed == tracking
          ? _value.tracking
          : tracking // ignore: cast_nullable_to_non_nullable
              as List<OrderTrackingEntity>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderShippingAddressEntityCopyWith<$Res>? get shippingAddress {
    if (_value.shippingAddress == null) {
      return null;
    }

    return $OrderShippingAddressEntityCopyWith<$Res>(_value.shippingAddress!,
        (value) {
      return _then(_value.copyWith(shippingAddress: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderEntityImplCopyWith<$Res>
    implements $OrderEntityCopyWith<$Res> {
  factory _$$OrderEntityImplCopyWith(
          _$OrderEntityImpl value, $Res Function(_$OrderEntityImpl) then) =
      __$$OrderEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String orderNumber,
      String status,
      double subtotal,
      double deliveryFee,
      double discount,
      double total,
      String createdAt,
      List<OrderItemEntity>? items,
      OrderShippingAddressEntity? shippingAddress,
      List<OrderTrackingEntity>? tracking});

  @override
  $OrderShippingAddressEntityCopyWith<$Res>? get shippingAddress;
}

/// @nodoc
class __$$OrderEntityImplCopyWithImpl<$Res>
    extends _$OrderEntityCopyWithImpl<$Res, _$OrderEntityImpl>
    implements _$$OrderEntityImplCopyWith<$Res> {
  __$$OrderEntityImplCopyWithImpl(
      _$OrderEntityImpl _value, $Res Function(_$OrderEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? status = null,
    Object? subtotal = null,
    Object? deliveryFee = null,
    Object? discount = null,
    Object? total = null,
    Object? createdAt = null,
    Object? items = freezed,
    Object? shippingAddress = freezed,
    Object? tracking = freezed,
  }) {
    return _then(_$OrderEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryFee: null == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItemEntity>?,
      shippingAddress: freezed == shippingAddress
          ? _value.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as OrderShippingAddressEntity?,
      tracking: freezed == tracking
          ? _value._tracking
          : tracking // ignore: cast_nullable_to_non_nullable
              as List<OrderTrackingEntity>?,
    ));
  }
}

/// @nodoc

class _$OrderEntityImpl implements _OrderEntity {
  const _$OrderEntityImpl(
      {required this.id,
      required this.orderNumber,
      required this.status,
      required this.subtotal,
      required this.deliveryFee,
      required this.discount,
      required this.total,
      required this.createdAt,
      final List<OrderItemEntity>? items,
      this.shippingAddress,
      final List<OrderTrackingEntity>? tracking})
      : _items = items,
        _tracking = tracking;

  @override
  final String id;
  @override
  final String orderNumber;
  @override
  final String status;
  @override
  final double subtotal;
  @override
  final double deliveryFee;
  @override
  final double discount;
  @override
  final double total;
  @override
  final String createdAt;
  final List<OrderItemEntity>? _items;
  @override
  List<OrderItemEntity>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final OrderShippingAddressEntity? shippingAddress;
  final List<OrderTrackingEntity>? _tracking;
  @override
  List<OrderTrackingEntity>? get tracking {
    final value = _tracking;
    if (value == null) return null;
    if (_tracking is EqualUnmodifiableListView) return _tracking;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'OrderEntity(id: $id, orderNumber: $orderNumber, status: $status, subtotal: $subtotal, deliveryFee: $deliveryFee, discount: $discount, total: $total, createdAt: $createdAt, items: $items, shippingAddress: $shippingAddress, tracking: $tracking)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.deliveryFee, deliveryFee) ||
                other.deliveryFee == deliveryFee) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.shippingAddress, shippingAddress) ||
                other.shippingAddress == shippingAddress) &&
            const DeepCollectionEquality().equals(other._tracking, _tracking));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      orderNumber,
      status,
      subtotal,
      deliveryFee,
      discount,
      total,
      createdAt,
      const DeepCollectionEquality().hash(_items),
      shippingAddress,
      const DeepCollectionEquality().hash(_tracking));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderEntityImplCopyWith<_$OrderEntityImpl> get copyWith =>
      __$$OrderEntityImplCopyWithImpl<_$OrderEntityImpl>(this, _$identity);
}

abstract class _OrderEntity implements OrderEntity {
  const factory _OrderEntity(
      {required final String id,
      required final String orderNumber,
      required final String status,
      required final double subtotal,
      required final double deliveryFee,
      required final double discount,
      required final double total,
      required final String createdAt,
      final List<OrderItemEntity>? items,
      final OrderShippingAddressEntity? shippingAddress,
      final List<OrderTrackingEntity>? tracking}) = _$OrderEntityImpl;

  @override
  String get id;
  @override
  String get orderNumber;
  @override
  String get status;
  @override
  double get subtotal;
  @override
  double get deliveryFee;
  @override
  double get discount;
  @override
  double get total;
  @override
  String get createdAt;
  @override
  List<OrderItemEntity>? get items;
  @override
  OrderShippingAddressEntity? get shippingAddress;
  @override
  List<OrderTrackingEntity>? get tracking;
  @override
  @JsonKey(ignore: true)
  _$$OrderEntityImplCopyWith<_$OrderEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OrderTrackingEntity {
  String get id => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get trackingId => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderTrackingEntityCopyWith<OrderTrackingEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderTrackingEntityCopyWith<$Res> {
  factory $OrderTrackingEntityCopyWith(
          OrderTrackingEntity value, $Res Function(OrderTrackingEntity) then) =
      _$OrderTrackingEntityCopyWithImpl<$Res, OrderTrackingEntity>;
  @useResult
  $Res call({String id, String status, String? trackingId, String createdAt});
}

/// @nodoc
class _$OrderTrackingEntityCopyWithImpl<$Res, $Val extends OrderTrackingEntity>
    implements $OrderTrackingEntityCopyWith<$Res> {
  _$OrderTrackingEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? trackingId = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      trackingId: freezed == trackingId
          ? _value.trackingId
          : trackingId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderTrackingEntityImplCopyWith<$Res>
    implements $OrderTrackingEntityCopyWith<$Res> {
  factory _$$OrderTrackingEntityImplCopyWith(_$OrderTrackingEntityImpl value,
          $Res Function(_$OrderTrackingEntityImpl) then) =
      __$$OrderTrackingEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String status, String? trackingId, String createdAt});
}

/// @nodoc
class __$$OrderTrackingEntityImplCopyWithImpl<$Res>
    extends _$OrderTrackingEntityCopyWithImpl<$Res, _$OrderTrackingEntityImpl>
    implements _$$OrderTrackingEntityImplCopyWith<$Res> {
  __$$OrderTrackingEntityImplCopyWithImpl(_$OrderTrackingEntityImpl _value,
      $Res Function(_$OrderTrackingEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? trackingId = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$OrderTrackingEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      trackingId: freezed == trackingId
          ? _value.trackingId
          : trackingId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OrderTrackingEntityImpl implements _OrderTrackingEntity {
  const _$OrderTrackingEntityImpl(
      {required this.id,
      required this.status,
      this.trackingId,
      required this.createdAt});

  @override
  final String id;
  @override
  final String status;
  @override
  final String? trackingId;
  @override
  final String createdAt;

  @override
  String toString() {
    return 'OrderTrackingEntity(id: $id, status: $status, trackingId: $trackingId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderTrackingEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.trackingId, trackingId) ||
                other.trackingId == trackingId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, status, trackingId, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderTrackingEntityImplCopyWith<_$OrderTrackingEntityImpl> get copyWith =>
      __$$OrderTrackingEntityImplCopyWithImpl<_$OrderTrackingEntityImpl>(
          this, _$identity);
}

abstract class _OrderTrackingEntity implements OrderTrackingEntity {
  const factory _OrderTrackingEntity(
      {required final String id,
      required final String status,
      final String? trackingId,
      required final String createdAt}) = _$OrderTrackingEntityImpl;

  @override
  String get id;
  @override
  String get status;
  @override
  String? get trackingId;
  @override
  String get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$OrderTrackingEntityImplCopyWith<_$OrderTrackingEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OrderItemEntity {
  String get id => throw _privateConstructorUsedError;
  String get productId => throw _privateConstructorUsedError;
  String? get variantId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  CartProductEntity get product => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderItemEntityCopyWith<OrderItemEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemEntityCopyWith<$Res> {
  factory $OrderItemEntityCopyWith(
          OrderItemEntity value, $Res Function(OrderItemEntity) then) =
      _$OrderItemEntityCopyWithImpl<$Res, OrderItemEntity>;
  @useResult
  $Res call(
      {String id,
      String productId,
      String? variantId,
      int quantity,
      double price,
      CartProductEntity product});

  $CartProductEntityCopyWith<$Res> get product;
}

/// @nodoc
class _$OrderItemEntityCopyWithImpl<$Res, $Val extends OrderItemEntity>
    implements $OrderItemEntityCopyWith<$Res> {
  _$OrderItemEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? variantId = freezed,
    Object? quantity = null,
    Object? price = null,
    Object? product = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      variantId: freezed == variantId
          ? _value.variantId
          : variantId // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as CartProductEntity,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CartProductEntityCopyWith<$Res> get product {
    return $CartProductEntityCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderItemEntityImplCopyWith<$Res>
    implements $OrderItemEntityCopyWith<$Res> {
  factory _$$OrderItemEntityImplCopyWith(_$OrderItemEntityImpl value,
          $Res Function(_$OrderItemEntityImpl) then) =
      __$$OrderItemEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String productId,
      String? variantId,
      int quantity,
      double price,
      CartProductEntity product});

  @override
  $CartProductEntityCopyWith<$Res> get product;
}

/// @nodoc
class __$$OrderItemEntityImplCopyWithImpl<$Res>
    extends _$OrderItemEntityCopyWithImpl<$Res, _$OrderItemEntityImpl>
    implements _$$OrderItemEntityImplCopyWith<$Res> {
  __$$OrderItemEntityImplCopyWithImpl(
      _$OrderItemEntityImpl _value, $Res Function(_$OrderItemEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? variantId = freezed,
    Object? quantity = null,
    Object? price = null,
    Object? product = null,
  }) {
    return _then(_$OrderItemEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      variantId: freezed == variantId
          ? _value.variantId
          : variantId // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as CartProductEntity,
    ));
  }
}

/// @nodoc

class _$OrderItemEntityImpl implements _OrderItemEntity {
  const _$OrderItemEntityImpl(
      {required this.id,
      required this.productId,
      this.variantId,
      required this.quantity,
      required this.price,
      required this.product});

  @override
  final String id;
  @override
  final String productId;
  @override
  final String? variantId;
  @override
  final int quantity;
  @override
  final double price;
  @override
  final CartProductEntity product;

  @override
  String toString() {
    return 'OrderItemEntity(id: $id, productId: $productId, variantId: $variantId, quantity: $quantity, price: $price, product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.variantId, variantId) ||
                other.variantId == variantId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, productId, variantId, quantity, price, product);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemEntityImplCopyWith<_$OrderItemEntityImpl> get copyWith =>
      __$$OrderItemEntityImplCopyWithImpl<_$OrderItemEntityImpl>(
          this, _$identity);
}

abstract class _OrderItemEntity implements OrderItemEntity {
  const factory _OrderItemEntity(
      {required final String id,
      required final String productId,
      final String? variantId,
      required final int quantity,
      required final double price,
      required final CartProductEntity product}) = _$OrderItemEntityImpl;

  @override
  String get id;
  @override
  String get productId;
  @override
  String? get variantId;
  @override
  int get quantity;
  @override
  double get price;
  @override
  CartProductEntity get product;
  @override
  @JsonKey(ignore: true)
  _$$OrderItemEntityImplCopyWith<_$OrderItemEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OrderShippingAddressEntity {
  String get receiverName => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderShippingAddressEntityCopyWith<OrderShippingAddressEntity>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderShippingAddressEntityCopyWith<$Res> {
  factory $OrderShippingAddressEntityCopyWith(OrderShippingAddressEntity value,
          $Res Function(OrderShippingAddressEntity) then) =
      _$OrderShippingAddressEntityCopyWithImpl<$Res,
          OrderShippingAddressEntity>;
  @useResult
  $Res call(
      {String receiverName,
      String phoneNumber,
      String country,
      String state,
      String address});
}

/// @nodoc
class _$OrderShippingAddressEntityCopyWithImpl<$Res,
        $Val extends OrderShippingAddressEntity>
    implements $OrderShippingAddressEntityCopyWith<$Res> {
  _$OrderShippingAddressEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? receiverName = null,
    Object? phoneNumber = null,
    Object? country = null,
    Object? state = null,
    Object? address = null,
  }) {
    return _then(_value.copyWith(
      receiverName: null == receiverName
          ? _value.receiverName
          : receiverName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderShippingAddressEntityImplCopyWith<$Res>
    implements $OrderShippingAddressEntityCopyWith<$Res> {
  factory _$$OrderShippingAddressEntityImplCopyWith(
          _$OrderShippingAddressEntityImpl value,
          $Res Function(_$OrderShippingAddressEntityImpl) then) =
      __$$OrderShippingAddressEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String receiverName,
      String phoneNumber,
      String country,
      String state,
      String address});
}

/// @nodoc
class __$$OrderShippingAddressEntityImplCopyWithImpl<$Res>
    extends _$OrderShippingAddressEntityCopyWithImpl<$Res,
        _$OrderShippingAddressEntityImpl>
    implements _$$OrderShippingAddressEntityImplCopyWith<$Res> {
  __$$OrderShippingAddressEntityImplCopyWithImpl(
      _$OrderShippingAddressEntityImpl _value,
      $Res Function(_$OrderShippingAddressEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? receiverName = null,
    Object? phoneNumber = null,
    Object? country = null,
    Object? state = null,
    Object? address = null,
  }) {
    return _then(_$OrderShippingAddressEntityImpl(
      receiverName: null == receiverName
          ? _value.receiverName
          : receiverName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OrderShippingAddressEntityImpl implements _OrderShippingAddressEntity {
  const _$OrderShippingAddressEntityImpl(
      {required this.receiverName,
      required this.phoneNumber,
      required this.country,
      required this.state,
      required this.address});

  @override
  final String receiverName;
  @override
  final String phoneNumber;
  @override
  final String country;
  @override
  final String state;
  @override
  final String address;

  @override
  String toString() {
    return 'OrderShippingAddressEntity(receiverName: $receiverName, phoneNumber: $phoneNumber, country: $country, state: $state, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderShippingAddressEntityImpl &&
            (identical(other.receiverName, receiverName) ||
                other.receiverName == receiverName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.address, address) || other.address == address));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, receiverName, phoneNumber, country, state, address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderShippingAddressEntityImplCopyWith<_$OrderShippingAddressEntityImpl>
      get copyWith => __$$OrderShippingAddressEntityImplCopyWithImpl<
          _$OrderShippingAddressEntityImpl>(this, _$identity);
}

abstract class _OrderShippingAddressEntity
    implements OrderShippingAddressEntity {
  const factory _OrderShippingAddressEntity(
      {required final String receiverName,
      required final String phoneNumber,
      required final String country,
      required final String state,
      required final String address}) = _$OrderShippingAddressEntityImpl;

  @override
  String get receiverName;
  @override
  String get phoneNumber;
  @override
  String get country;
  @override
  String get state;
  @override
  String get address;
  @override
  @JsonKey(ignore: true)
  _$$OrderShippingAddressEntityImplCopyWith<_$OrderShippingAddressEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReviewEntity {
  String get id => throw _privateConstructorUsedError;
  int get rating => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  ReviewUserEntity? get user => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReviewEntityCopyWith<ReviewEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewEntityCopyWith<$Res> {
  factory $ReviewEntityCopyWith(
          ReviewEntity value, $Res Function(ReviewEntity) then) =
      _$ReviewEntityCopyWithImpl<$Res, ReviewEntity>;
  @useResult
  $Res call(
      {String id,
      int rating,
      String comment,
      String createdAt,
      ReviewUserEntity? user});

  $ReviewUserEntityCopyWith<$Res>? get user;
}

/// @nodoc
class _$ReviewEntityCopyWithImpl<$Res, $Val extends ReviewEntity>
    implements $ReviewEntityCopyWith<$Res> {
  _$ReviewEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rating = null,
    Object? comment = null,
    Object? createdAt = null,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as ReviewUserEntity?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReviewUserEntityCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $ReviewUserEntityCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReviewEntityImplCopyWith<$Res>
    implements $ReviewEntityCopyWith<$Res> {
  factory _$$ReviewEntityImplCopyWith(
          _$ReviewEntityImpl value, $Res Function(_$ReviewEntityImpl) then) =
      __$$ReviewEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int rating,
      String comment,
      String createdAt,
      ReviewUserEntity? user});

  @override
  $ReviewUserEntityCopyWith<$Res>? get user;
}

/// @nodoc
class __$$ReviewEntityImplCopyWithImpl<$Res>
    extends _$ReviewEntityCopyWithImpl<$Res, _$ReviewEntityImpl>
    implements _$$ReviewEntityImplCopyWith<$Res> {
  __$$ReviewEntityImplCopyWithImpl(
      _$ReviewEntityImpl _value, $Res Function(_$ReviewEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rating = null,
    Object? comment = null,
    Object? createdAt = null,
    Object? user = freezed,
  }) {
    return _then(_$ReviewEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as ReviewUserEntity?,
    ));
  }
}

/// @nodoc

class _$ReviewEntityImpl implements _ReviewEntity {
  const _$ReviewEntityImpl(
      {required this.id,
      required this.rating,
      required this.comment,
      required this.createdAt,
      this.user});

  @override
  final String id;
  @override
  final int rating;
  @override
  final String comment;
  @override
  final String createdAt;
  @override
  final ReviewUserEntity? user;

  @override
  String toString() {
    return 'ReviewEntity(id: $id, rating: $rating, comment: $comment, createdAt: $createdAt, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, rating, comment, createdAt, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewEntityImplCopyWith<_$ReviewEntityImpl> get copyWith =>
      __$$ReviewEntityImplCopyWithImpl<_$ReviewEntityImpl>(this, _$identity);
}

abstract class _ReviewEntity implements ReviewEntity {
  const factory _ReviewEntity(
      {required final String id,
      required final int rating,
      required final String comment,
      required final String createdAt,
      final ReviewUserEntity? user}) = _$ReviewEntityImpl;

  @override
  String get id;
  @override
  int get rating;
  @override
  String get comment;
  @override
  String get createdAt;
  @override
  ReviewUserEntity? get user;
  @override
  @JsonKey(ignore: true)
  _$$ReviewEntityImplCopyWith<_$ReviewEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReviewUserEntity {
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReviewUserEntityCopyWith<ReviewUserEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewUserEntityCopyWith<$Res> {
  factory $ReviewUserEntityCopyWith(
          ReviewUserEntity value, $Res Function(ReviewUserEntity) then) =
      _$ReviewUserEntityCopyWithImpl<$Res, ReviewUserEntity>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$ReviewUserEntityCopyWithImpl<$Res, $Val extends ReviewUserEntity>
    implements $ReviewUserEntityCopyWith<$Res> {
  _$ReviewUserEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewUserEntityImplCopyWith<$Res>
    implements $ReviewUserEntityCopyWith<$Res> {
  factory _$$ReviewUserEntityImplCopyWith(_$ReviewUserEntityImpl value,
          $Res Function(_$ReviewUserEntityImpl) then) =
      __$$ReviewUserEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$ReviewUserEntityImplCopyWithImpl<$Res>
    extends _$ReviewUserEntityCopyWithImpl<$Res, _$ReviewUserEntityImpl>
    implements _$$ReviewUserEntityImplCopyWith<$Res> {
  __$$ReviewUserEntityImplCopyWithImpl(_$ReviewUserEntityImpl _value,
      $Res Function(_$ReviewUserEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$ReviewUserEntityImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ReviewUserEntityImpl implements _ReviewUserEntity {
  const _$ReviewUserEntityImpl({required this.name});

  @override
  final String name;

  @override
  String toString() {
    return 'ReviewUserEntity(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewUserEntityImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewUserEntityImplCopyWith<_$ReviewUserEntityImpl> get copyWith =>
      __$$ReviewUserEntityImplCopyWithImpl<_$ReviewUserEntityImpl>(
          this, _$identity);
}

abstract class _ReviewUserEntity implements ReviewUserEntity {
  const factory _ReviewUserEntity({required final String name}) =
      _$ReviewUserEntityImpl;

  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$ReviewUserEntityImplCopyWith<_$ReviewUserEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$WatchlistItemEntity {
  String get id => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  WatchlistProductEntity get product => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WatchlistItemEntityCopyWith<WatchlistItemEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WatchlistItemEntityCopyWith<$Res> {
  factory $WatchlistItemEntityCopyWith(
          WatchlistItemEntity value, $Res Function(WatchlistItemEntity) then) =
      _$WatchlistItemEntityCopyWithImpl<$Res, WatchlistItemEntity>;
  @useResult
  $Res call({String id, String createdAt, WatchlistProductEntity product});

  $WatchlistProductEntityCopyWith<$Res> get product;
}

/// @nodoc
class _$WatchlistItemEntityCopyWithImpl<$Res, $Val extends WatchlistItemEntity>
    implements $WatchlistItemEntityCopyWith<$Res> {
  _$WatchlistItemEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? product = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as WatchlistProductEntity,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WatchlistProductEntityCopyWith<$Res> get product {
    return $WatchlistProductEntityCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WatchlistItemEntityImplCopyWith<$Res>
    implements $WatchlistItemEntityCopyWith<$Res> {
  factory _$$WatchlistItemEntityImplCopyWith(_$WatchlistItemEntityImpl value,
          $Res Function(_$WatchlistItemEntityImpl) then) =
      __$$WatchlistItemEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String createdAt, WatchlistProductEntity product});

  @override
  $WatchlistProductEntityCopyWith<$Res> get product;
}

/// @nodoc
class __$$WatchlistItemEntityImplCopyWithImpl<$Res>
    extends _$WatchlistItemEntityCopyWithImpl<$Res, _$WatchlistItemEntityImpl>
    implements _$$WatchlistItemEntityImplCopyWith<$Res> {
  __$$WatchlistItemEntityImplCopyWithImpl(_$WatchlistItemEntityImpl _value,
      $Res Function(_$WatchlistItemEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? product = null,
  }) {
    return _then(_$WatchlistItemEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as WatchlistProductEntity,
    ));
  }
}

/// @nodoc

class _$WatchlistItemEntityImpl implements _WatchlistItemEntity {
  const _$WatchlistItemEntityImpl(
      {required this.id, required this.createdAt, required this.product});

  @override
  final String id;
  @override
  final String createdAt;
  @override
  final WatchlistProductEntity product;

  @override
  String toString() {
    return 'WatchlistItemEntity(id: $id, createdAt: $createdAt, product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatchlistItemEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, product);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WatchlistItemEntityImplCopyWith<_$WatchlistItemEntityImpl> get copyWith =>
      __$$WatchlistItemEntityImplCopyWithImpl<_$WatchlistItemEntityImpl>(
          this, _$identity);
}

abstract class _WatchlistItemEntity implements WatchlistItemEntity {
  const factory _WatchlistItemEntity(
          {required final String id,
          required final String createdAt,
          required final WatchlistProductEntity product}) =
      _$WatchlistItemEntityImpl;

  @override
  String get id;
  @override
  String get createdAt;
  @override
  WatchlistProductEntity get product;
  @override
  @JsonKey(ignore: true)
  _$$WatchlistItemEntityImplCopyWith<_$WatchlistItemEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$WatchlistProductEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double? get discountPrice => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WatchlistProductEntityCopyWith<WatchlistProductEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WatchlistProductEntityCopyWith<$Res> {
  factory $WatchlistProductEntityCopyWith(WatchlistProductEntity value,
          $Res Function(WatchlistProductEntity) then) =
      _$WatchlistProductEntityCopyWithImpl<$Res, WatchlistProductEntity>;
  @useResult
  $Res call(
      {String id,
      String name,
      double price,
      double? discountPrice,
      String imageUrl});
}

/// @nodoc
class _$WatchlistProductEntityCopyWithImpl<$Res,
        $Val extends WatchlistProductEntity>
    implements $WatchlistProductEntityCopyWith<$Res> {
  _$WatchlistProductEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? discountPrice = freezed,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      discountPrice: freezed == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WatchlistProductEntityImplCopyWith<$Res>
    implements $WatchlistProductEntityCopyWith<$Res> {
  factory _$$WatchlistProductEntityImplCopyWith(
          _$WatchlistProductEntityImpl value,
          $Res Function(_$WatchlistProductEntityImpl) then) =
      __$$WatchlistProductEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      double price,
      double? discountPrice,
      String imageUrl});
}

/// @nodoc
class __$$WatchlistProductEntityImplCopyWithImpl<$Res>
    extends _$WatchlistProductEntityCopyWithImpl<$Res,
        _$WatchlistProductEntityImpl>
    implements _$$WatchlistProductEntityImplCopyWith<$Res> {
  __$$WatchlistProductEntityImplCopyWithImpl(
      _$WatchlistProductEntityImpl _value,
      $Res Function(_$WatchlistProductEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? discountPrice = freezed,
    Object? imageUrl = null,
  }) {
    return _then(_$WatchlistProductEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      discountPrice: freezed == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$WatchlistProductEntityImpl implements _WatchlistProductEntity {
  const _$WatchlistProductEntityImpl(
      {required this.id,
      required this.name,
      required this.price,
      this.discountPrice,
      required this.imageUrl});

  @override
  final String id;
  @override
  final String name;
  @override
  final double price;
  @override
  final double? discountPrice;
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'WatchlistProductEntity(id: $id, name: $name, price: $price, discountPrice: $discountPrice, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatchlistProductEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discountPrice, discountPrice) ||
                other.discountPrice == discountPrice) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, price, discountPrice, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WatchlistProductEntityImplCopyWith<_$WatchlistProductEntityImpl>
      get copyWith => __$$WatchlistProductEntityImplCopyWithImpl<
          _$WatchlistProductEntityImpl>(this, _$identity);
}

abstract class _WatchlistProductEntity implements WatchlistProductEntity {
  const factory _WatchlistProductEntity(
      {required final String id,
      required final String name,
      required final double price,
      final double? discountPrice,
      required final String imageUrl}) = _$WatchlistProductEntityImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  double get price;
  @override
  double? get discountPrice;
  @override
  String get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$WatchlistProductEntityImplCopyWith<_$WatchlistProductEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
