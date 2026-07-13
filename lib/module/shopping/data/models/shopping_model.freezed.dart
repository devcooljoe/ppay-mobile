// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double? get discountPrice => throw _privateConstructorUsedError;
  bool get inStock => throw _privateConstructorUsedError;
  int get stockQuantity => throw _privateConstructorUsedError;
  List<ProductVariantModel> get variants => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res, ProductModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      double price,
      double? discountPrice,
      bool inStock,
      int stockQuantity,
      List<ProductVariantModel> variants});
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res, $Val extends ProductModel>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

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
              as List<ProductVariantModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductModelImplCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$ProductModelImplCopyWith(
          _$ProductModelImpl value, $Res Function(_$ProductModelImpl) then) =
      __$$ProductModelImplCopyWithImpl<$Res>;
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
      List<ProductVariantModel> variants});
}

/// @nodoc
class __$$ProductModelImplCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res, _$ProductModelImpl>
    implements _$$ProductModelImplCopyWith<$Res> {
  __$$ProductModelImplCopyWithImpl(
      _$ProductModelImpl _value, $Res Function(_$ProductModelImpl) _then)
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
  }) {
    return _then(_$ProductModelImpl(
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
              as List<ProductVariantModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductModelImpl extends _ProductModel {
  const _$ProductModelImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      this.discountPrice,
      required this.inStock,
      required this.stockQuantity,
      required final List<ProductVariantModel> variants})
      : _variants = variants,
        super._();

  factory _$ProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductModelImplFromJson(json);

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
  final List<ProductVariantModel> _variants;
  @override
  List<ProductVariantModel> get variants {
    if (_variants is EqualUnmodifiableListView) return _variants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_variants);
  }

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, description: $description, price: $price, discountPrice: $discountPrice, inStock: $inStock, stockQuantity: $stockQuantity, variants: $variants)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductModelImpl &&
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
            const DeepCollectionEquality().equals(other._variants, _variants));
  }

  @JsonKey(ignore: true)
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
      const DeepCollectionEquality().hash(_variants));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      __$$ProductModelImplCopyWithImpl<_$ProductModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductModelImplToJson(
      this,
    );
  }
}

abstract class _ProductModel extends ProductModel {
  const factory _ProductModel(
      {required final String id,
      required final String name,
      required final String description,
      required final double price,
      final double? discountPrice,
      required final bool inStock,
      required final int stockQuantity,
      required final List<ProductVariantModel> variants}) = _$ProductModelImpl;
  const _ProductModel._() : super._();

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$ProductModelImpl.fromJson;

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
  List<ProductVariantModel> get variants;
  @override
  @JsonKey(ignore: true)
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductVariantModel _$ProductVariantModelFromJson(Map<String, dynamic> json) {
  return _ProductVariantModel.fromJson(json);
}

/// @nodoc
mixin _$ProductVariantModel {
  String get id => throw _privateConstructorUsedError;
  Map<String, dynamic> get attributes => throw _privateConstructorUsedError;
  int get stockQuantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductVariantModelCopyWith<ProductVariantModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductVariantModelCopyWith<$Res> {
  factory $ProductVariantModelCopyWith(
          ProductVariantModel value, $Res Function(ProductVariantModel) then) =
      _$ProductVariantModelCopyWithImpl<$Res, ProductVariantModel>;
  @useResult
  $Res call({String id, Map<String, dynamic> attributes, int stockQuantity});
}

/// @nodoc
class _$ProductVariantModelCopyWithImpl<$Res, $Val extends ProductVariantModel>
    implements $ProductVariantModelCopyWith<$Res> {
  _$ProductVariantModelCopyWithImpl(this._value, this._then);

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
abstract class _$$ProductVariantModelImplCopyWith<$Res>
    implements $ProductVariantModelCopyWith<$Res> {
  factory _$$ProductVariantModelImplCopyWith(_$ProductVariantModelImpl value,
          $Res Function(_$ProductVariantModelImpl) then) =
      __$$ProductVariantModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, Map<String, dynamic> attributes, int stockQuantity});
}

/// @nodoc
class __$$ProductVariantModelImplCopyWithImpl<$Res>
    extends _$ProductVariantModelCopyWithImpl<$Res, _$ProductVariantModelImpl>
    implements _$$ProductVariantModelImplCopyWith<$Res> {
  __$$ProductVariantModelImplCopyWithImpl(_$ProductVariantModelImpl _value,
      $Res Function(_$ProductVariantModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? attributes = null,
    Object? stockQuantity = null,
  }) {
    return _then(_$ProductVariantModelImpl(
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
@JsonSerializable()
class _$ProductVariantModelImpl extends _ProductVariantModel {
  const _$ProductVariantModelImpl(
      {required this.id,
      required final Map<String, dynamic> attributes,
      required this.stockQuantity})
      : _attributes = attributes,
        super._();

  factory _$ProductVariantModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductVariantModelImplFromJson(json);

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
    return 'ProductVariantModel(id: $id, attributes: $attributes, stockQuantity: $stockQuantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductVariantModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._attributes, _attributes) &&
            (identical(other.stockQuantity, stockQuantity) ||
                other.stockQuantity == stockQuantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id,
      const DeepCollectionEquality().hash(_attributes), stockQuantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductVariantModelImplCopyWith<_$ProductVariantModelImpl> get copyWith =>
      __$$ProductVariantModelImplCopyWithImpl<_$ProductVariantModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductVariantModelImplToJson(
      this,
    );
  }
}

abstract class _ProductVariantModel extends ProductVariantModel {
  const factory _ProductVariantModel(
      {required final String id,
      required final Map<String, dynamic> attributes,
      required final int stockQuantity}) = _$ProductVariantModelImpl;
  const _ProductVariantModel._() : super._();

  factory _ProductVariantModel.fromJson(Map<String, dynamic> json) =
      _$ProductVariantModelImpl.fromJson;

  @override
  String get id;
  @override
  Map<String, dynamic> get attributes;
  @override
  int get stockQuantity;
  @override
  @JsonKey(ignore: true)
  _$$ProductVariantModelImplCopyWith<_$ProductVariantModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) {
  return _CategoryModel.fromJson(json);
}

/// @nodoc
mixin _$CategoryModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get iconUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryModelCopyWith<CategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryModelCopyWith<$Res> {
  factory $CategoryModelCopyWith(
          CategoryModel value, $Res Function(CategoryModel) then) =
      _$CategoryModelCopyWithImpl<$Res, CategoryModel>;
  @useResult
  $Res call({String id, String name, String iconUrl});
}

/// @nodoc
class _$CategoryModelCopyWithImpl<$Res, $Val extends CategoryModel>
    implements $CategoryModelCopyWith<$Res> {
  _$CategoryModelCopyWithImpl(this._value, this._then);

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
abstract class _$$CategoryModelImplCopyWith<$Res>
    implements $CategoryModelCopyWith<$Res> {
  factory _$$CategoryModelImplCopyWith(
          _$CategoryModelImpl value, $Res Function(_$CategoryModelImpl) then) =
      __$$CategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String iconUrl});
}

/// @nodoc
class __$$CategoryModelImplCopyWithImpl<$Res>
    extends _$CategoryModelCopyWithImpl<$Res, _$CategoryModelImpl>
    implements _$$CategoryModelImplCopyWith<$Res> {
  __$$CategoryModelImplCopyWithImpl(
      _$CategoryModelImpl _value, $Res Function(_$CategoryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? iconUrl = null,
  }) {
    return _then(_$CategoryModelImpl(
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
@JsonSerializable()
class _$CategoryModelImpl extends _CategoryModel {
  const _$CategoryModelImpl(
      {required this.id, required this.name, required this.iconUrl})
      : super._();

  factory _$CategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String iconUrl;

  @override
  String toString() {
    return 'CategoryModel(id: $id, name: $name, iconUrl: $iconUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, iconUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryModelImplCopyWith<_$CategoryModelImpl> get copyWith =>
      __$$CategoryModelImplCopyWithImpl<_$CategoryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryModelImplToJson(
      this,
    );
  }
}

abstract class _CategoryModel extends CategoryModel {
  const factory _CategoryModel(
      {required final String id,
      required final String name,
      required final String iconUrl}) = _$CategoryModelImpl;
  const _CategoryModel._() : super._();

  factory _CategoryModel.fromJson(Map<String, dynamic> json) =
      _$CategoryModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get iconUrl;
  @override
  @JsonKey(ignore: true)
  _$$CategoryModelImplCopyWith<_$CategoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HomepageModel _$HomepageModelFromJson(Map<String, dynamic> json) {
  return _HomepageModel.fromJson(json);
}

/// @nodoc
mixin _$HomepageModel {
  List<ProductModel> get featuredProducts => throw _privateConstructorUsedError;
  List<CategoryModel> get categories => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomepageModelCopyWith<HomepageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomepageModelCopyWith<$Res> {
  factory $HomepageModelCopyWith(
          HomepageModel value, $Res Function(HomepageModel) then) =
      _$HomepageModelCopyWithImpl<$Res, HomepageModel>;
  @useResult
  $Res call(
      {List<ProductModel> featuredProducts, List<CategoryModel> categories});
}

/// @nodoc
class _$HomepageModelCopyWithImpl<$Res, $Val extends HomepageModel>
    implements $HomepageModelCopyWith<$Res> {
  _$HomepageModelCopyWithImpl(this._value, this._then);

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
              as List<ProductModel>,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomepageModelImplCopyWith<$Res>
    implements $HomepageModelCopyWith<$Res> {
  factory _$$HomepageModelImplCopyWith(
          _$HomepageModelImpl value, $Res Function(_$HomepageModelImpl) then) =
      __$$HomepageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ProductModel> featuredProducts, List<CategoryModel> categories});
}

/// @nodoc
class __$$HomepageModelImplCopyWithImpl<$Res>
    extends _$HomepageModelCopyWithImpl<$Res, _$HomepageModelImpl>
    implements _$$HomepageModelImplCopyWith<$Res> {
  __$$HomepageModelImplCopyWithImpl(
      _$HomepageModelImpl _value, $Res Function(_$HomepageModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? featuredProducts = null,
    Object? categories = null,
  }) {
    return _then(_$HomepageModelImpl(
      featuredProducts: null == featuredProducts
          ? _value._featuredProducts
          : featuredProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomepageModelImpl extends _HomepageModel {
  const _$HomepageModelImpl(
      {required final List<ProductModel> featuredProducts,
      required final List<CategoryModel> categories})
      : _featuredProducts = featuredProducts,
        _categories = categories,
        super._();

  factory _$HomepageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomepageModelImplFromJson(json);

  final List<ProductModel> _featuredProducts;
  @override
  List<ProductModel> get featuredProducts {
    if (_featuredProducts is EqualUnmodifiableListView)
      return _featuredProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_featuredProducts);
  }

  final List<CategoryModel> _categories;
  @override
  List<CategoryModel> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'HomepageModel(featuredProducts: $featuredProducts, categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomepageModelImpl &&
            const DeepCollectionEquality()
                .equals(other._featuredProducts, _featuredProducts) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_featuredProducts),
      const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomepageModelImplCopyWith<_$HomepageModelImpl> get copyWith =>
      __$$HomepageModelImplCopyWithImpl<_$HomepageModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomepageModelImplToJson(
      this,
    );
  }
}

abstract class _HomepageModel extends HomepageModel {
  const factory _HomepageModel(
      {required final List<ProductModel> featuredProducts,
      required final List<CategoryModel> categories}) = _$HomepageModelImpl;
  const _HomepageModel._() : super._();

  factory _HomepageModel.fromJson(Map<String, dynamic> json) =
      _$HomepageModelImpl.fromJson;

  @override
  List<ProductModel> get featuredProducts;
  @override
  List<CategoryModel> get categories;
  @override
  @JsonKey(ignore: true)
  _$$HomepageModelImplCopyWith<_$HomepageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductsResponseModel _$ProductsResponseModelFromJson(
    Map<String, dynamic> json) {
  return _ProductsResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ProductsResponseModel {
  List<ProductModel> get products => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductsResponseModelCopyWith<ProductsResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsResponseModelCopyWith<$Res> {
  factory $ProductsResponseModelCopyWith(ProductsResponseModel value,
          $Res Function(ProductsResponseModel) then) =
      _$ProductsResponseModelCopyWithImpl<$Res, ProductsResponseModel>;
  @useResult
  $Res call(
      {List<ProductModel> products,
      int total,
      int page,
      int limit,
      int totalPages});
}

/// @nodoc
class _$ProductsResponseModelCopyWithImpl<$Res,
        $Val extends ProductsResponseModel>
    implements $ProductsResponseModelCopyWith<$Res> {
  _$ProductsResponseModelCopyWithImpl(this._value, this._then);

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
              as List<ProductModel>,
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
abstract class _$$ProductsResponseModelImplCopyWith<$Res>
    implements $ProductsResponseModelCopyWith<$Res> {
  factory _$$ProductsResponseModelImplCopyWith(
          _$ProductsResponseModelImpl value,
          $Res Function(_$ProductsResponseModelImpl) then) =
      __$$ProductsResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ProductModel> products,
      int total,
      int page,
      int limit,
      int totalPages});
}

/// @nodoc
class __$$ProductsResponseModelImplCopyWithImpl<$Res>
    extends _$ProductsResponseModelCopyWithImpl<$Res,
        _$ProductsResponseModelImpl>
    implements _$$ProductsResponseModelImplCopyWith<$Res> {
  __$$ProductsResponseModelImplCopyWithImpl(_$ProductsResponseModelImpl _value,
      $Res Function(_$ProductsResponseModelImpl) _then)
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
    return _then(_$ProductsResponseModelImpl(
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
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
@JsonSerializable()
class _$ProductsResponseModelImpl extends _ProductsResponseModel {
  const _$ProductsResponseModelImpl(
      {required final List<ProductModel> products,
      required this.total,
      required this.page,
      required this.limit,
      required this.totalPages})
      : _products = products,
        super._();

  factory _$ProductsResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductsResponseModelImplFromJson(json);

  final List<ProductModel> _products;
  @override
  List<ProductModel> get products {
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
    return 'ProductsResponseModel(products: $products, total: $total, page: $page, limit: $limit, totalPages: $totalPages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductsResponseModelImpl &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages));
  }

  @JsonKey(ignore: true)
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
  _$$ProductsResponseModelImplCopyWith<_$ProductsResponseModelImpl>
      get copyWith => __$$ProductsResponseModelImplCopyWithImpl<
          _$ProductsResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductsResponseModelImplToJson(
      this,
    );
  }
}

abstract class _ProductsResponseModel extends ProductsResponseModel {
  const factory _ProductsResponseModel(
      {required final List<ProductModel> products,
      required final int total,
      required final int page,
      required final int limit,
      required final int totalPages}) = _$ProductsResponseModelImpl;
  const _ProductsResponseModel._() : super._();

  factory _ProductsResponseModel.fromJson(Map<String, dynamic> json) =
      _$ProductsResponseModelImpl.fromJson;

  @override
  List<ProductModel> get products;
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
  _$$ProductsResponseModelImplCopyWith<_$ProductsResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CartModel _$CartModelFromJson(Map<String, dynamic> json) {
  return _CartModel.fromJson(json);
}

/// @nodoc
mixin _$CartModel {
  String get id => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  List<CartItemModel> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartModelCopyWith<CartModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartModelCopyWith<$Res> {
  factory $CartModelCopyWith(CartModel value, $Res Function(CartModel) then) =
      _$CartModelCopyWithImpl<$Res, CartModel>;
  @useResult
  $Res call({String id, String updatedAt, List<CartItemModel> items});
}

/// @nodoc
class _$CartModelCopyWithImpl<$Res, $Val extends CartModel>
    implements $CartModelCopyWith<$Res> {
  _$CartModelCopyWithImpl(this._value, this._then);

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
              as List<CartItemModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartModelImplCopyWith<$Res>
    implements $CartModelCopyWith<$Res> {
  factory _$$CartModelImplCopyWith(
          _$CartModelImpl value, $Res Function(_$CartModelImpl) then) =
      __$$CartModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String updatedAt, List<CartItemModel> items});
}

/// @nodoc
class __$$CartModelImplCopyWithImpl<$Res>
    extends _$CartModelCopyWithImpl<$Res, _$CartModelImpl>
    implements _$$CartModelImplCopyWith<$Res> {
  __$$CartModelImplCopyWithImpl(
      _$CartModelImpl _value, $Res Function(_$CartModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? updatedAt = null,
    Object? items = null,
  }) {
    return _then(_$CartModelImpl(
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
              as List<CartItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartModelImpl extends _CartModel {
  const _$CartModelImpl(
      {required this.id,
      required this.updatedAt,
      required final List<CartItemModel> items})
      : _items = items,
        super._();

  factory _$CartModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartModelImplFromJson(json);

  @override
  final String id;
  @override
  final String updatedAt;
  final List<CartItemModel> _items;
  @override
  List<CartItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'CartModel(id: $id, updatedAt: $updatedAt, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, updatedAt, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartModelImplCopyWith<_$CartModelImpl> get copyWith =>
      __$$CartModelImplCopyWithImpl<_$CartModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartModelImplToJson(
      this,
    );
  }
}

abstract class _CartModel extends CartModel {
  const factory _CartModel(
      {required final String id,
      required final String updatedAt,
      required final List<CartItemModel> items}) = _$CartModelImpl;
  const _CartModel._() : super._();

  factory _CartModel.fromJson(Map<String, dynamic> json) =
      _$CartModelImpl.fromJson;

  @override
  String get id;
  @override
  String get updatedAt;
  @override
  List<CartItemModel> get items;
  @override
  @JsonKey(ignore: true)
  _$$CartModelImplCopyWith<_$CartModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CartItemModel _$CartItemModelFromJson(Map<String, dynamic> json) {
  return _CartItemModel.fromJson(json);
}

/// @nodoc
mixin _$CartItemModel {
  String get id => throw _privateConstructorUsedError;
  String get productId => throw _privateConstructorUsedError;
  String? get variantId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  CartProductModel get product => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartItemModelCopyWith<CartItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemModelCopyWith<$Res> {
  factory $CartItemModelCopyWith(
          CartItemModel value, $Res Function(CartItemModel) then) =
      _$CartItemModelCopyWithImpl<$Res, CartItemModel>;
  @useResult
  $Res call(
      {String id,
      String productId,
      String? variantId,
      int quantity,
      double price,
      CartProductModel product});

  $CartProductModelCopyWith<$Res> get product;
}

/// @nodoc
class _$CartItemModelCopyWithImpl<$Res, $Val extends CartItemModel>
    implements $CartItemModelCopyWith<$Res> {
  _$CartItemModelCopyWithImpl(this._value, this._then);

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
              as CartProductModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CartProductModelCopyWith<$Res> get product {
    return $CartProductModelCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CartItemModelImplCopyWith<$Res>
    implements $CartItemModelCopyWith<$Res> {
  factory _$$CartItemModelImplCopyWith(
          _$CartItemModelImpl value, $Res Function(_$CartItemModelImpl) then) =
      __$$CartItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String productId,
      String? variantId,
      int quantity,
      double price,
      CartProductModel product});

  @override
  $CartProductModelCopyWith<$Res> get product;
}

/// @nodoc
class __$$CartItemModelImplCopyWithImpl<$Res>
    extends _$CartItemModelCopyWithImpl<$Res, _$CartItemModelImpl>
    implements _$$CartItemModelImplCopyWith<$Res> {
  __$$CartItemModelImplCopyWithImpl(
      _$CartItemModelImpl _value, $Res Function(_$CartItemModelImpl) _then)
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
    return _then(_$CartItemModelImpl(
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
              as CartProductModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartItemModelImpl extends _CartItemModel {
  const _$CartItemModelImpl(
      {required this.id,
      required this.productId,
      this.variantId,
      required this.quantity,
      required this.price,
      required this.product})
      : super._();

  factory _$CartItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartItemModelImplFromJson(json);

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
  final CartProductModel product;

  @override
  String toString() {
    return 'CartItemModel(id: $id, productId: $productId, variantId: $variantId, quantity: $quantity, price: $price, product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemModelImpl &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, productId, variantId, quantity, price, product);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemModelImplCopyWith<_$CartItemModelImpl> get copyWith =>
      __$$CartItemModelImplCopyWithImpl<_$CartItemModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartItemModelImplToJson(
      this,
    );
  }
}

abstract class _CartItemModel extends CartItemModel {
  const factory _CartItemModel(
      {required final String id,
      required final String productId,
      final String? variantId,
      required final int quantity,
      required final double price,
      required final CartProductModel product}) = _$CartItemModelImpl;
  const _CartItemModel._() : super._();

  factory _CartItemModel.fromJson(Map<String, dynamic> json) =
      _$CartItemModelImpl.fromJson;

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
  CartProductModel get product;
  @override
  @JsonKey(ignore: true)
  _$$CartItemModelImplCopyWith<_$CartItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CartProductModel _$CartProductModelFromJson(Map<String, dynamic> json) {
  return _CartProductModel.fromJson(json);
}

/// @nodoc
mixin _$CartProductModel {
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartProductModelCopyWith<CartProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartProductModelCopyWith<$Res> {
  factory $CartProductModelCopyWith(
          CartProductModel value, $Res Function(CartProductModel) then) =
      _$CartProductModelCopyWithImpl<$Res, CartProductModel>;
  @useResult
  $Res call({String name, String imageUrl});
}

/// @nodoc
class _$CartProductModelCopyWithImpl<$Res, $Val extends CartProductModel>
    implements $CartProductModelCopyWith<$Res> {
  _$CartProductModelCopyWithImpl(this._value, this._then);

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
abstract class _$$CartProductModelImplCopyWith<$Res>
    implements $CartProductModelCopyWith<$Res> {
  factory _$$CartProductModelImplCopyWith(_$CartProductModelImpl value,
          $Res Function(_$CartProductModelImpl) then) =
      __$$CartProductModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String imageUrl});
}

/// @nodoc
class __$$CartProductModelImplCopyWithImpl<$Res>
    extends _$CartProductModelCopyWithImpl<$Res, _$CartProductModelImpl>
    implements _$$CartProductModelImplCopyWith<$Res> {
  __$$CartProductModelImplCopyWithImpl(_$CartProductModelImpl _value,
      $Res Function(_$CartProductModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? imageUrl = null,
  }) {
    return _then(_$CartProductModelImpl(
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
@JsonSerializable()
class _$CartProductModelImpl extends _CartProductModel {
  const _$CartProductModelImpl({required this.name, required this.imageUrl})
      : super._();

  factory _$CartProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartProductModelImplFromJson(json);

  @override
  final String name;
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'CartProductModel(name: $name, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartProductModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartProductModelImplCopyWith<_$CartProductModelImpl> get copyWith =>
      __$$CartProductModelImplCopyWithImpl<_$CartProductModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartProductModelImplToJson(
      this,
    );
  }
}

abstract class _CartProductModel extends CartProductModel {
  const factory _CartProductModel(
      {required final String name,
      required final String imageUrl}) = _$CartProductModelImpl;
  const _CartProductModel._() : super._();

  factory _CartProductModel.fromJson(Map<String, dynamic> json) =
      _$CartProductModelImpl.fromJson;

  @override
  String get name;
  @override
  String get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$CartProductModelImplCopyWith<_$CartProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return _OrderModel.fromJson(json);
}

/// @nodoc
mixin _$OrderModel {
  String get id => throw _privateConstructorUsedError;
  String get orderNumber => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  double get subtotal => throw _privateConstructorUsedError;
  double get deliveryFee => throw _privateConstructorUsedError;
  double get discount => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  List<OrderItemModel>? get items => throw _privateConstructorUsedError;
  OrderShippingAddressModel? get shippingAddress =>
      throw _privateConstructorUsedError;
  List<OrderTrackingModel>? get tracking => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderModelCopyWith<OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
          OrderModel value, $Res Function(OrderModel) then) =
      _$OrderModelCopyWithImpl<$Res, OrderModel>;
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
      List<OrderItemModel>? items,
      OrderShippingAddressModel? shippingAddress,
      List<OrderTrackingModel>? tracking});

  $OrderShippingAddressModelCopyWith<$Res>? get shippingAddress;
}

/// @nodoc
class _$OrderModelCopyWithImpl<$Res, $Val extends OrderModel>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._value, this._then);

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
              as List<OrderItemModel>?,
      shippingAddress: freezed == shippingAddress
          ? _value.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as OrderShippingAddressModel?,
      tracking: freezed == tracking
          ? _value.tracking
          : tracking // ignore: cast_nullable_to_non_nullable
              as List<OrderTrackingModel>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderShippingAddressModelCopyWith<$Res>? get shippingAddress {
    if (_value.shippingAddress == null) {
      return null;
    }

    return $OrderShippingAddressModelCopyWith<$Res>(_value.shippingAddress!,
        (value) {
      return _then(_value.copyWith(shippingAddress: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderModelImplCopyWith<$Res>
    implements $OrderModelCopyWith<$Res> {
  factory _$$OrderModelImplCopyWith(
          _$OrderModelImpl value, $Res Function(_$OrderModelImpl) then) =
      __$$OrderModelImplCopyWithImpl<$Res>;
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
      List<OrderItemModel>? items,
      OrderShippingAddressModel? shippingAddress,
      List<OrderTrackingModel>? tracking});

  @override
  $OrderShippingAddressModelCopyWith<$Res>? get shippingAddress;
}

/// @nodoc
class __$$OrderModelImplCopyWithImpl<$Res>
    extends _$OrderModelCopyWithImpl<$Res, _$OrderModelImpl>
    implements _$$OrderModelImplCopyWith<$Res> {
  __$$OrderModelImplCopyWithImpl(
      _$OrderModelImpl _value, $Res Function(_$OrderModelImpl) _then)
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
    return _then(_$OrderModelImpl(
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
              as List<OrderItemModel>?,
      shippingAddress: freezed == shippingAddress
          ? _value.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as OrderShippingAddressModel?,
      tracking: freezed == tracking
          ? _value._tracking
          : tracking // ignore: cast_nullable_to_non_nullable
              as List<OrderTrackingModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderModelImpl extends _OrderModel {
  const _$OrderModelImpl(
      {required this.id,
      required this.orderNumber,
      required this.status,
      required this.subtotal,
      required this.deliveryFee,
      required this.discount,
      required this.total,
      required this.createdAt,
      final List<OrderItemModel>? items,
      this.shippingAddress,
      final List<OrderTrackingModel>? tracking})
      : _items = items,
        _tracking = tracking,
        super._();

  factory _$OrderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderModelImplFromJson(json);

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
  final List<OrderItemModel>? _items;
  @override
  List<OrderItemModel>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final OrderShippingAddressModel? shippingAddress;
  final List<OrderTrackingModel>? _tracking;
  @override
  List<OrderTrackingModel>? get tracking {
    final value = _tracking;
    if (value == null) return null;
    if (_tracking is EqualUnmodifiableListView) return _tracking;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'OrderModel(id: $id, orderNumber: $orderNumber, status: $status, subtotal: $subtotal, deliveryFee: $deliveryFee, discount: $discount, total: $total, createdAt: $createdAt, items: $items, shippingAddress: $shippingAddress, tracking: $tracking)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderModelImpl &&
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

  @JsonKey(ignore: true)
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
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      __$$OrderModelImplCopyWithImpl<_$OrderModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderModelImplToJson(
      this,
    );
  }
}

abstract class _OrderModel extends OrderModel {
  const factory _OrderModel(
      {required final String id,
      required final String orderNumber,
      required final String status,
      required final double subtotal,
      required final double deliveryFee,
      required final double discount,
      required final double total,
      required final String createdAt,
      final List<OrderItemModel>? items,
      final OrderShippingAddressModel? shippingAddress,
      final List<OrderTrackingModel>? tracking}) = _$OrderModelImpl;
  const _OrderModel._() : super._();

  factory _OrderModel.fromJson(Map<String, dynamic> json) =
      _$OrderModelImpl.fromJson;

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
  List<OrderItemModel>? get items;
  @override
  OrderShippingAddressModel? get shippingAddress;
  @override
  List<OrderTrackingModel>? get tracking;
  @override
  @JsonKey(ignore: true)
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderTrackingModel _$OrderTrackingModelFromJson(Map<String, dynamic> json) {
  return _OrderTrackingModel.fromJson(json);
}

/// @nodoc
mixin _$OrderTrackingModel {
  String get id => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get trackingId => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderTrackingModelCopyWith<OrderTrackingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderTrackingModelCopyWith<$Res> {
  factory $OrderTrackingModelCopyWith(
          OrderTrackingModel value, $Res Function(OrderTrackingModel) then) =
      _$OrderTrackingModelCopyWithImpl<$Res, OrderTrackingModel>;
  @useResult
  $Res call({String id, String status, String? trackingId, String createdAt});
}

/// @nodoc
class _$OrderTrackingModelCopyWithImpl<$Res, $Val extends OrderTrackingModel>
    implements $OrderTrackingModelCopyWith<$Res> {
  _$OrderTrackingModelCopyWithImpl(this._value, this._then);

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
abstract class _$$OrderTrackingModelImplCopyWith<$Res>
    implements $OrderTrackingModelCopyWith<$Res> {
  factory _$$OrderTrackingModelImplCopyWith(_$OrderTrackingModelImpl value,
          $Res Function(_$OrderTrackingModelImpl) then) =
      __$$OrderTrackingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String status, String? trackingId, String createdAt});
}

/// @nodoc
class __$$OrderTrackingModelImplCopyWithImpl<$Res>
    extends _$OrderTrackingModelCopyWithImpl<$Res, _$OrderTrackingModelImpl>
    implements _$$OrderTrackingModelImplCopyWith<$Res> {
  __$$OrderTrackingModelImplCopyWithImpl(_$OrderTrackingModelImpl _value,
      $Res Function(_$OrderTrackingModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? trackingId = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$OrderTrackingModelImpl(
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
@JsonSerializable()
class _$OrderTrackingModelImpl extends _OrderTrackingModel {
  const _$OrderTrackingModelImpl(
      {required this.id,
      required this.status,
      this.trackingId,
      required this.createdAt})
      : super._();

  factory _$OrderTrackingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderTrackingModelImplFromJson(json);

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
    return 'OrderTrackingModel(id: $id, status: $status, trackingId: $trackingId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderTrackingModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.trackingId, trackingId) ||
                other.trackingId == trackingId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, status, trackingId, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderTrackingModelImplCopyWith<_$OrderTrackingModelImpl> get copyWith =>
      __$$OrderTrackingModelImplCopyWithImpl<_$OrderTrackingModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderTrackingModelImplToJson(
      this,
    );
  }
}

abstract class _OrderTrackingModel extends OrderTrackingModel {
  const factory _OrderTrackingModel(
      {required final String id,
      required final String status,
      final String? trackingId,
      required final String createdAt}) = _$OrderTrackingModelImpl;
  const _OrderTrackingModel._() : super._();

  factory _OrderTrackingModel.fromJson(Map<String, dynamic> json) =
      _$OrderTrackingModelImpl.fromJson;

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
  _$$OrderTrackingModelImplCopyWith<_$OrderTrackingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderItemModel _$OrderItemModelFromJson(Map<String, dynamic> json) {
  return _OrderItemModel.fromJson(json);
}

/// @nodoc
mixin _$OrderItemModel {
  String get id => throw _privateConstructorUsedError;
  String get productId => throw _privateConstructorUsedError;
  String? get variantId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  CartProductModel get product => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderItemModelCopyWith<OrderItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemModelCopyWith<$Res> {
  factory $OrderItemModelCopyWith(
          OrderItemModel value, $Res Function(OrderItemModel) then) =
      _$OrderItemModelCopyWithImpl<$Res, OrderItemModel>;
  @useResult
  $Res call(
      {String id,
      String productId,
      String? variantId,
      int quantity,
      double price,
      CartProductModel product});

  $CartProductModelCopyWith<$Res> get product;
}

/// @nodoc
class _$OrderItemModelCopyWithImpl<$Res, $Val extends OrderItemModel>
    implements $OrderItemModelCopyWith<$Res> {
  _$OrderItemModelCopyWithImpl(this._value, this._then);

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
              as CartProductModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CartProductModelCopyWith<$Res> get product {
    return $CartProductModelCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderItemModelImplCopyWith<$Res>
    implements $OrderItemModelCopyWith<$Res> {
  factory _$$OrderItemModelImplCopyWith(_$OrderItemModelImpl value,
          $Res Function(_$OrderItemModelImpl) then) =
      __$$OrderItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String productId,
      String? variantId,
      int quantity,
      double price,
      CartProductModel product});

  @override
  $CartProductModelCopyWith<$Res> get product;
}

/// @nodoc
class __$$OrderItemModelImplCopyWithImpl<$Res>
    extends _$OrderItemModelCopyWithImpl<$Res, _$OrderItemModelImpl>
    implements _$$OrderItemModelImplCopyWith<$Res> {
  __$$OrderItemModelImplCopyWithImpl(
      _$OrderItemModelImpl _value, $Res Function(_$OrderItemModelImpl) _then)
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
    return _then(_$OrderItemModelImpl(
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
              as CartProductModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderItemModelImpl extends _OrderItemModel {
  const _$OrderItemModelImpl(
      {required this.id,
      required this.productId,
      this.variantId,
      required this.quantity,
      required this.price,
      required this.product})
      : super._();

  factory _$OrderItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderItemModelImplFromJson(json);

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
  final CartProductModel product;

  @override
  String toString() {
    return 'OrderItemModel(id: $id, productId: $productId, variantId: $variantId, quantity: $quantity, price: $price, product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemModelImpl &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, productId, variantId, quantity, price, product);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemModelImplCopyWith<_$OrderItemModelImpl> get copyWith =>
      __$$OrderItemModelImplCopyWithImpl<_$OrderItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderItemModelImplToJson(
      this,
    );
  }
}

abstract class _OrderItemModel extends OrderItemModel {
  const factory _OrderItemModel(
      {required final String id,
      required final String productId,
      final String? variantId,
      required final int quantity,
      required final double price,
      required final CartProductModel product}) = _$OrderItemModelImpl;
  const _OrderItemModel._() : super._();

  factory _OrderItemModel.fromJson(Map<String, dynamic> json) =
      _$OrderItemModelImpl.fromJson;

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
  CartProductModel get product;
  @override
  @JsonKey(ignore: true)
  _$$OrderItemModelImplCopyWith<_$OrderItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderShippingAddressModel _$OrderShippingAddressModelFromJson(
    Map<String, dynamic> json) {
  return _OrderShippingAddressModel.fromJson(json);
}

/// @nodoc
mixin _$OrderShippingAddressModel {
  String get receiverName => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderShippingAddressModelCopyWith<OrderShippingAddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderShippingAddressModelCopyWith<$Res> {
  factory $OrderShippingAddressModelCopyWith(OrderShippingAddressModel value,
          $Res Function(OrderShippingAddressModel) then) =
      _$OrderShippingAddressModelCopyWithImpl<$Res, OrderShippingAddressModel>;
  @useResult
  $Res call(
      {String receiverName,
      String phoneNumber,
      String country,
      String state,
      String address});
}

/// @nodoc
class _$OrderShippingAddressModelCopyWithImpl<$Res,
        $Val extends OrderShippingAddressModel>
    implements $OrderShippingAddressModelCopyWith<$Res> {
  _$OrderShippingAddressModelCopyWithImpl(this._value, this._then);

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
abstract class _$$OrderShippingAddressModelImplCopyWith<$Res>
    implements $OrderShippingAddressModelCopyWith<$Res> {
  factory _$$OrderShippingAddressModelImplCopyWith(
          _$OrderShippingAddressModelImpl value,
          $Res Function(_$OrderShippingAddressModelImpl) then) =
      __$$OrderShippingAddressModelImplCopyWithImpl<$Res>;
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
class __$$OrderShippingAddressModelImplCopyWithImpl<$Res>
    extends _$OrderShippingAddressModelCopyWithImpl<$Res,
        _$OrderShippingAddressModelImpl>
    implements _$$OrderShippingAddressModelImplCopyWith<$Res> {
  __$$OrderShippingAddressModelImplCopyWithImpl(
      _$OrderShippingAddressModelImpl _value,
      $Res Function(_$OrderShippingAddressModelImpl) _then)
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
    return _then(_$OrderShippingAddressModelImpl(
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
@JsonSerializable()
class _$OrderShippingAddressModelImpl extends _OrderShippingAddressModel {
  const _$OrderShippingAddressModelImpl(
      {required this.receiverName,
      required this.phoneNumber,
      required this.country,
      required this.state,
      required this.address})
      : super._();

  factory _$OrderShippingAddressModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderShippingAddressModelImplFromJson(json);

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
    return 'OrderShippingAddressModel(receiverName: $receiverName, phoneNumber: $phoneNumber, country: $country, state: $state, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderShippingAddressModelImpl &&
            (identical(other.receiverName, receiverName) ||
                other.receiverName == receiverName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, receiverName, phoneNumber, country, state, address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderShippingAddressModelImplCopyWith<_$OrderShippingAddressModelImpl>
      get copyWith => __$$OrderShippingAddressModelImplCopyWithImpl<
          _$OrderShippingAddressModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderShippingAddressModelImplToJson(
      this,
    );
  }
}

abstract class _OrderShippingAddressModel extends OrderShippingAddressModel {
  const factory _OrderShippingAddressModel(
      {required final String receiverName,
      required final String phoneNumber,
      required final String country,
      required final String state,
      required final String address}) = _$OrderShippingAddressModelImpl;
  const _OrderShippingAddressModel._() : super._();

  factory _OrderShippingAddressModel.fromJson(Map<String, dynamic> json) =
      _$OrderShippingAddressModelImpl.fromJson;

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
  _$$OrderShippingAddressModelImplCopyWith<_$OrderShippingAddressModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) {
  return _ReviewModel.fromJson(json);
}

/// @nodoc
mixin _$ReviewModel {
  String get id => throw _privateConstructorUsedError;
  int get rating => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  ReviewUserModel? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewModelCopyWith<ReviewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewModelCopyWith<$Res> {
  factory $ReviewModelCopyWith(
          ReviewModel value, $Res Function(ReviewModel) then) =
      _$ReviewModelCopyWithImpl<$Res, ReviewModel>;
  @useResult
  $Res call(
      {String id,
      int rating,
      String comment,
      String createdAt,
      ReviewUserModel? user});

  $ReviewUserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$ReviewModelCopyWithImpl<$Res, $Val extends ReviewModel>
    implements $ReviewModelCopyWith<$Res> {
  _$ReviewModelCopyWithImpl(this._value, this._then);

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
              as ReviewUserModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReviewUserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $ReviewUserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReviewModelImplCopyWith<$Res>
    implements $ReviewModelCopyWith<$Res> {
  factory _$$ReviewModelImplCopyWith(
          _$ReviewModelImpl value, $Res Function(_$ReviewModelImpl) then) =
      __$$ReviewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int rating,
      String comment,
      String createdAt,
      ReviewUserModel? user});

  @override
  $ReviewUserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$ReviewModelImplCopyWithImpl<$Res>
    extends _$ReviewModelCopyWithImpl<$Res, _$ReviewModelImpl>
    implements _$$ReviewModelImplCopyWith<$Res> {
  __$$ReviewModelImplCopyWithImpl(
      _$ReviewModelImpl _value, $Res Function(_$ReviewModelImpl) _then)
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
    return _then(_$ReviewModelImpl(
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
              as ReviewUserModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewModelImpl extends _ReviewModel {
  const _$ReviewModelImpl(
      {required this.id,
      required this.rating,
      required this.comment,
      required this.createdAt,
      this.user})
      : super._();

  factory _$ReviewModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewModelImplFromJson(json);

  @override
  final String id;
  @override
  final int rating;
  @override
  final String comment;
  @override
  final String createdAt;
  @override
  final ReviewUserModel? user;

  @override
  String toString() {
    return 'ReviewModel(id: $id, rating: $rating, comment: $comment, createdAt: $createdAt, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, rating, comment, createdAt, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewModelImplCopyWith<_$ReviewModelImpl> get copyWith =>
      __$$ReviewModelImplCopyWithImpl<_$ReviewModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewModelImplToJson(
      this,
    );
  }
}

abstract class _ReviewModel extends ReviewModel {
  const factory _ReviewModel(
      {required final String id,
      required final int rating,
      required final String comment,
      required final String createdAt,
      final ReviewUserModel? user}) = _$ReviewModelImpl;
  const _ReviewModel._() : super._();

  factory _ReviewModel.fromJson(Map<String, dynamic> json) =
      _$ReviewModelImpl.fromJson;

  @override
  String get id;
  @override
  int get rating;
  @override
  String get comment;
  @override
  String get createdAt;
  @override
  ReviewUserModel? get user;
  @override
  @JsonKey(ignore: true)
  _$$ReviewModelImplCopyWith<_$ReviewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReviewUserModel _$ReviewUserModelFromJson(Map<String, dynamic> json) {
  return _ReviewUserModel.fromJson(json);
}

/// @nodoc
mixin _$ReviewUserModel {
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewUserModelCopyWith<ReviewUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewUserModelCopyWith<$Res> {
  factory $ReviewUserModelCopyWith(
          ReviewUserModel value, $Res Function(ReviewUserModel) then) =
      _$ReviewUserModelCopyWithImpl<$Res, ReviewUserModel>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$ReviewUserModelCopyWithImpl<$Res, $Val extends ReviewUserModel>
    implements $ReviewUserModelCopyWith<$Res> {
  _$ReviewUserModelCopyWithImpl(this._value, this._then);

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
abstract class _$$ReviewUserModelImplCopyWith<$Res>
    implements $ReviewUserModelCopyWith<$Res> {
  factory _$$ReviewUserModelImplCopyWith(_$ReviewUserModelImpl value,
          $Res Function(_$ReviewUserModelImpl) then) =
      __$$ReviewUserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$ReviewUserModelImplCopyWithImpl<$Res>
    extends _$ReviewUserModelCopyWithImpl<$Res, _$ReviewUserModelImpl>
    implements _$$ReviewUserModelImplCopyWith<$Res> {
  __$$ReviewUserModelImplCopyWithImpl(
      _$ReviewUserModelImpl _value, $Res Function(_$ReviewUserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$ReviewUserModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewUserModelImpl extends _ReviewUserModel {
  const _$ReviewUserModelImpl({required this.name}) : super._();

  factory _$ReviewUserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewUserModelImplFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'ReviewUserModel(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewUserModelImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewUserModelImplCopyWith<_$ReviewUserModelImpl> get copyWith =>
      __$$ReviewUserModelImplCopyWithImpl<_$ReviewUserModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewUserModelImplToJson(
      this,
    );
  }
}

abstract class _ReviewUserModel extends ReviewUserModel {
  const factory _ReviewUserModel({required final String name}) =
      _$ReviewUserModelImpl;
  const _ReviewUserModel._() : super._();

  factory _ReviewUserModel.fromJson(Map<String, dynamic> json) =
      _$ReviewUserModelImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$ReviewUserModelImplCopyWith<_$ReviewUserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WatchlistItemModel _$WatchlistItemModelFromJson(Map<String, dynamic> json) {
  return _WatchlistItemModel.fromJson(json);
}

/// @nodoc
mixin _$WatchlistItemModel {
  String get id => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  WatchlistProductModel get product => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WatchlistItemModelCopyWith<WatchlistItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WatchlistItemModelCopyWith<$Res> {
  factory $WatchlistItemModelCopyWith(
          WatchlistItemModel value, $Res Function(WatchlistItemModel) then) =
      _$WatchlistItemModelCopyWithImpl<$Res, WatchlistItemModel>;
  @useResult
  $Res call({String id, String createdAt, WatchlistProductModel product});

  $WatchlistProductModelCopyWith<$Res> get product;
}

/// @nodoc
class _$WatchlistItemModelCopyWithImpl<$Res, $Val extends WatchlistItemModel>
    implements $WatchlistItemModelCopyWith<$Res> {
  _$WatchlistItemModelCopyWithImpl(this._value, this._then);

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
              as WatchlistProductModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WatchlistProductModelCopyWith<$Res> get product {
    return $WatchlistProductModelCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WatchlistItemModelImplCopyWith<$Res>
    implements $WatchlistItemModelCopyWith<$Res> {
  factory _$$WatchlistItemModelImplCopyWith(_$WatchlistItemModelImpl value,
          $Res Function(_$WatchlistItemModelImpl) then) =
      __$$WatchlistItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String createdAt, WatchlistProductModel product});

  @override
  $WatchlistProductModelCopyWith<$Res> get product;
}

/// @nodoc
class __$$WatchlistItemModelImplCopyWithImpl<$Res>
    extends _$WatchlistItemModelCopyWithImpl<$Res, _$WatchlistItemModelImpl>
    implements _$$WatchlistItemModelImplCopyWith<$Res> {
  __$$WatchlistItemModelImplCopyWithImpl(_$WatchlistItemModelImpl _value,
      $Res Function(_$WatchlistItemModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? product = null,
  }) {
    return _then(_$WatchlistItemModelImpl(
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
              as WatchlistProductModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WatchlistItemModelImpl extends _WatchlistItemModel {
  const _$WatchlistItemModelImpl(
      {required this.id, required this.createdAt, required this.product})
      : super._();

  factory _$WatchlistItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WatchlistItemModelImplFromJson(json);

  @override
  final String id;
  @override
  final String createdAt;
  @override
  final WatchlistProductModel product;

  @override
  String toString() {
    return 'WatchlistItemModel(id: $id, createdAt: $createdAt, product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatchlistItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.product, product) || other.product == product));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, product);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WatchlistItemModelImplCopyWith<_$WatchlistItemModelImpl> get copyWith =>
      __$$WatchlistItemModelImplCopyWithImpl<_$WatchlistItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WatchlistItemModelImplToJson(
      this,
    );
  }
}

abstract class _WatchlistItemModel extends WatchlistItemModel {
  const factory _WatchlistItemModel(
      {required final String id,
      required final String createdAt,
      required final WatchlistProductModel product}) = _$WatchlistItemModelImpl;
  const _WatchlistItemModel._() : super._();

  factory _WatchlistItemModel.fromJson(Map<String, dynamic> json) =
      _$WatchlistItemModelImpl.fromJson;

  @override
  String get id;
  @override
  String get createdAt;
  @override
  WatchlistProductModel get product;
  @override
  @JsonKey(ignore: true)
  _$$WatchlistItemModelImplCopyWith<_$WatchlistItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WatchlistProductModel _$WatchlistProductModelFromJson(
    Map<String, dynamic> json) {
  return _WatchlistProductModel.fromJson(json);
}

/// @nodoc
mixin _$WatchlistProductModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double? get discountPrice => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WatchlistProductModelCopyWith<WatchlistProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WatchlistProductModelCopyWith<$Res> {
  factory $WatchlistProductModelCopyWith(WatchlistProductModel value,
          $Res Function(WatchlistProductModel) then) =
      _$WatchlistProductModelCopyWithImpl<$Res, WatchlistProductModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      double price,
      double? discountPrice,
      String imageUrl});
}

/// @nodoc
class _$WatchlistProductModelCopyWithImpl<$Res,
        $Val extends WatchlistProductModel>
    implements $WatchlistProductModelCopyWith<$Res> {
  _$WatchlistProductModelCopyWithImpl(this._value, this._then);

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
abstract class _$$WatchlistProductModelImplCopyWith<$Res>
    implements $WatchlistProductModelCopyWith<$Res> {
  factory _$$WatchlistProductModelImplCopyWith(
          _$WatchlistProductModelImpl value,
          $Res Function(_$WatchlistProductModelImpl) then) =
      __$$WatchlistProductModelImplCopyWithImpl<$Res>;
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
class __$$WatchlistProductModelImplCopyWithImpl<$Res>
    extends _$WatchlistProductModelCopyWithImpl<$Res,
        _$WatchlistProductModelImpl>
    implements _$$WatchlistProductModelImplCopyWith<$Res> {
  __$$WatchlistProductModelImplCopyWithImpl(_$WatchlistProductModelImpl _value,
      $Res Function(_$WatchlistProductModelImpl) _then)
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
    return _then(_$WatchlistProductModelImpl(
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
@JsonSerializable()
class _$WatchlistProductModelImpl extends _WatchlistProductModel {
  const _$WatchlistProductModelImpl(
      {required this.id,
      required this.name,
      required this.price,
      this.discountPrice,
      required this.imageUrl})
      : super._();

  factory _$WatchlistProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WatchlistProductModelImplFromJson(json);

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
    return 'WatchlistProductModel(id: $id, name: $name, price: $price, discountPrice: $discountPrice, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatchlistProductModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discountPrice, discountPrice) ||
                other.discountPrice == discountPrice) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, price, discountPrice, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WatchlistProductModelImplCopyWith<_$WatchlistProductModelImpl>
      get copyWith => __$$WatchlistProductModelImplCopyWithImpl<
          _$WatchlistProductModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WatchlistProductModelImplToJson(
      this,
    );
  }
}

abstract class _WatchlistProductModel extends WatchlistProductModel {
  const factory _WatchlistProductModel(
      {required final String id,
      required final String name,
      required final double price,
      final double? discountPrice,
      required final String imageUrl}) = _$WatchlistProductModelImpl;
  const _WatchlistProductModel._() : super._();

  factory _WatchlistProductModel.fromJson(Map<String, dynamic> json) =
      _$WatchlistProductModelImpl.fromJson;

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
  _$$WatchlistProductModelImplCopyWith<_$WatchlistProductModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
