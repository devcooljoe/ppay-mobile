// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddToCartRequest _$AddToCartRequestFromJson(Map<String, dynamic> json) {
  return _AddToCartRequest.fromJson(json);
}

/// @nodoc
mixin _$AddToCartRequest {
  String get productId => throw _privateConstructorUsedError;
  String? get variantId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddToCartRequestCopyWith<AddToCartRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddToCartRequestCopyWith<$Res> {
  factory $AddToCartRequestCopyWith(
          AddToCartRequest value, $Res Function(AddToCartRequest) then) =
      _$AddToCartRequestCopyWithImpl<$Res, AddToCartRequest>;
  @useResult
  $Res call({String productId, String? variantId, int quantity});
}

/// @nodoc
class _$AddToCartRequestCopyWithImpl<$Res, $Val extends AddToCartRequest>
    implements $AddToCartRequestCopyWith<$Res> {
  _$AddToCartRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? variantId = freezed,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddToCartRequestImplCopyWith<$Res>
    implements $AddToCartRequestCopyWith<$Res> {
  factory _$$AddToCartRequestImplCopyWith(_$AddToCartRequestImpl value,
          $Res Function(_$AddToCartRequestImpl) then) =
      __$$AddToCartRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String productId, String? variantId, int quantity});
}

/// @nodoc
class __$$AddToCartRequestImplCopyWithImpl<$Res>
    extends _$AddToCartRequestCopyWithImpl<$Res, _$AddToCartRequestImpl>
    implements _$$AddToCartRequestImplCopyWith<$Res> {
  __$$AddToCartRequestImplCopyWithImpl(_$AddToCartRequestImpl _value,
      $Res Function(_$AddToCartRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? variantId = freezed,
    Object? quantity = null,
  }) {
    return _then(_$AddToCartRequestImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddToCartRequestImpl implements _AddToCartRequest {
  const _$AddToCartRequestImpl(
      {required this.productId, this.variantId, required this.quantity});

  factory _$AddToCartRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddToCartRequestImplFromJson(json);

  @override
  final String productId;
  @override
  final String? variantId;
  @override
  final int quantity;

  @override
  String toString() {
    return 'AddToCartRequest(productId: $productId, variantId: $variantId, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddToCartRequestImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.variantId, variantId) ||
                other.variantId == variantId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, productId, variantId, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddToCartRequestImplCopyWith<_$AddToCartRequestImpl> get copyWith =>
      __$$AddToCartRequestImplCopyWithImpl<_$AddToCartRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddToCartRequestImplToJson(
      this,
    );
  }
}

abstract class _AddToCartRequest implements AddToCartRequest {
  const factory _AddToCartRequest(
      {required final String productId,
      final String? variantId,
      required final int quantity}) = _$AddToCartRequestImpl;

  factory _AddToCartRequest.fromJson(Map<String, dynamic> json) =
      _$AddToCartRequestImpl.fromJson;

  @override
  String get productId;
  @override
  String? get variantId;
  @override
  int get quantity;
  @override
  @JsonKey(ignore: true)
  _$$AddToCartRequestImplCopyWith<_$AddToCartRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateCartItemRequest _$UpdateCartItemRequestFromJson(
    Map<String, dynamic> json) {
  return _UpdateCartItemRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateCartItemRequest {
  int get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateCartItemRequestCopyWith<UpdateCartItemRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateCartItemRequestCopyWith<$Res> {
  factory $UpdateCartItemRequestCopyWith(UpdateCartItemRequest value,
          $Res Function(UpdateCartItemRequest) then) =
      _$UpdateCartItemRequestCopyWithImpl<$Res, UpdateCartItemRequest>;
  @useResult
  $Res call({int quantity});
}

/// @nodoc
class _$UpdateCartItemRequestCopyWithImpl<$Res,
        $Val extends UpdateCartItemRequest>
    implements $UpdateCartItemRequestCopyWith<$Res> {
  _$UpdateCartItemRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateCartItemRequestImplCopyWith<$Res>
    implements $UpdateCartItemRequestCopyWith<$Res> {
  factory _$$UpdateCartItemRequestImplCopyWith(
          _$UpdateCartItemRequestImpl value,
          $Res Function(_$UpdateCartItemRequestImpl) then) =
      __$$UpdateCartItemRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int quantity});
}

/// @nodoc
class __$$UpdateCartItemRequestImplCopyWithImpl<$Res>
    extends _$UpdateCartItemRequestCopyWithImpl<$Res,
        _$UpdateCartItemRequestImpl>
    implements _$$UpdateCartItemRequestImplCopyWith<$Res> {
  __$$UpdateCartItemRequestImplCopyWithImpl(_$UpdateCartItemRequestImpl _value,
      $Res Function(_$UpdateCartItemRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quantity = null,
  }) {
    return _then(_$UpdateCartItemRequestImpl(
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateCartItemRequestImpl implements _UpdateCartItemRequest {
  const _$UpdateCartItemRequestImpl({required this.quantity});

  factory _$UpdateCartItemRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateCartItemRequestImplFromJson(json);

  @override
  final int quantity;

  @override
  String toString() {
    return 'UpdateCartItemRequest(quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateCartItemRequestImpl &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateCartItemRequestImplCopyWith<_$UpdateCartItemRequestImpl>
      get copyWith => __$$UpdateCartItemRequestImplCopyWithImpl<
          _$UpdateCartItemRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateCartItemRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdateCartItemRequest implements UpdateCartItemRequest {
  const factory _UpdateCartItemRequest({required final int quantity}) =
      _$UpdateCartItemRequestImpl;

  factory _UpdateCartItemRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateCartItemRequestImpl.fromJson;

  @override
  int get quantity;
  @override
  @JsonKey(ignore: true)
  _$$UpdateCartItemRequestImplCopyWith<_$UpdateCartItemRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CreateOrderRequest _$CreateOrderRequestFromJson(Map<String, dynamic> json) {
  return _CreateOrderRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateOrderRequest {
  String get receiverName => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  String? get promoCode => throw _privateConstructorUsedError;
  List<OrderItemRequest> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateOrderRequestCopyWith<CreateOrderRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateOrderRequestCopyWith<$Res> {
  factory $CreateOrderRequestCopyWith(
          CreateOrderRequest value, $Res Function(CreateOrderRequest) then) =
      _$CreateOrderRequestCopyWithImpl<$Res, CreateOrderRequest>;
  @useResult
  $Res call(
      {String receiverName,
      String phoneNumber,
      String country,
      String state,
      String address,
      String? note,
      String? promoCode,
      List<OrderItemRequest> items});
}

/// @nodoc
class _$CreateOrderRequestCopyWithImpl<$Res, $Val extends CreateOrderRequest>
    implements $CreateOrderRequestCopyWith<$Res> {
  _$CreateOrderRequestCopyWithImpl(this._value, this._then);

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
    Object? note = freezed,
    Object? promoCode = freezed,
    Object? items = null,
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
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      promoCode: freezed == promoCode
          ? _value.promoCode
          : promoCode // ignore: cast_nullable_to_non_nullable
              as String?,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItemRequest>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateOrderRequestImplCopyWith<$Res>
    implements $CreateOrderRequestCopyWith<$Res> {
  factory _$$CreateOrderRequestImplCopyWith(_$CreateOrderRequestImpl value,
          $Res Function(_$CreateOrderRequestImpl) then) =
      __$$CreateOrderRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String receiverName,
      String phoneNumber,
      String country,
      String state,
      String address,
      String? note,
      String? promoCode,
      List<OrderItemRequest> items});
}

/// @nodoc
class __$$CreateOrderRequestImplCopyWithImpl<$Res>
    extends _$CreateOrderRequestCopyWithImpl<$Res, _$CreateOrderRequestImpl>
    implements _$$CreateOrderRequestImplCopyWith<$Res> {
  __$$CreateOrderRequestImplCopyWithImpl(_$CreateOrderRequestImpl _value,
      $Res Function(_$CreateOrderRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? receiverName = null,
    Object? phoneNumber = null,
    Object? country = null,
    Object? state = null,
    Object? address = null,
    Object? note = freezed,
    Object? promoCode = freezed,
    Object? items = null,
  }) {
    return _then(_$CreateOrderRequestImpl(
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
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      promoCode: freezed == promoCode
          ? _value.promoCode
          : promoCode // ignore: cast_nullable_to_non_nullable
              as String?,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItemRequest>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateOrderRequestImpl implements _CreateOrderRequest {
  const _$CreateOrderRequestImpl(
      {required this.receiverName,
      required this.phoneNumber,
      required this.country,
      required this.state,
      required this.address,
      this.note,
      this.promoCode,
      required final List<OrderItemRequest> items})
      : _items = items;

  factory _$CreateOrderRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateOrderRequestImplFromJson(json);

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
  final String? note;
  @override
  final String? promoCode;
  final List<OrderItemRequest> _items;
  @override
  List<OrderItemRequest> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'CreateOrderRequest(receiverName: $receiverName, phoneNumber: $phoneNumber, country: $country, state: $state, address: $address, note: $note, promoCode: $promoCode, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateOrderRequestImpl &&
            (identical(other.receiverName, receiverName) ||
                other.receiverName == receiverName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.promoCode, promoCode) ||
                other.promoCode == promoCode) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      receiverName,
      phoneNumber,
      country,
      state,
      address,
      note,
      promoCode,
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateOrderRequestImplCopyWith<_$CreateOrderRequestImpl> get copyWith =>
      __$$CreateOrderRequestImplCopyWithImpl<_$CreateOrderRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateOrderRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateOrderRequest implements CreateOrderRequest {
  const factory _CreateOrderRequest(
      {required final String receiverName,
      required final String phoneNumber,
      required final String country,
      required final String state,
      required final String address,
      final String? note,
      final String? promoCode,
      required final List<OrderItemRequest> items}) = _$CreateOrderRequestImpl;

  factory _CreateOrderRequest.fromJson(Map<String, dynamic> json) =
      _$CreateOrderRequestImpl.fromJson;

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
  String? get note;
  @override
  String? get promoCode;
  @override
  List<OrderItemRequest> get items;
  @override
  @JsonKey(ignore: true)
  _$$CreateOrderRequestImplCopyWith<_$CreateOrderRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderItemRequest _$OrderItemRequestFromJson(Map<String, dynamic> json) {
  return _OrderItemRequest.fromJson(json);
}

/// @nodoc
mixin _$OrderItemRequest {
  String get productId => throw _privateConstructorUsedError;
  String? get variantId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderItemRequestCopyWith<OrderItemRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemRequestCopyWith<$Res> {
  factory $OrderItemRequestCopyWith(
          OrderItemRequest value, $Res Function(OrderItemRequest) then) =
      _$OrderItemRequestCopyWithImpl<$Res, OrderItemRequest>;
  @useResult
  $Res call({String productId, String? variantId, int quantity});
}

/// @nodoc
class _$OrderItemRequestCopyWithImpl<$Res, $Val extends OrderItemRequest>
    implements $OrderItemRequestCopyWith<$Res> {
  _$OrderItemRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? variantId = freezed,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderItemRequestImplCopyWith<$Res>
    implements $OrderItemRequestCopyWith<$Res> {
  factory _$$OrderItemRequestImplCopyWith(_$OrderItemRequestImpl value,
          $Res Function(_$OrderItemRequestImpl) then) =
      __$$OrderItemRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String productId, String? variantId, int quantity});
}

/// @nodoc
class __$$OrderItemRequestImplCopyWithImpl<$Res>
    extends _$OrderItemRequestCopyWithImpl<$Res, _$OrderItemRequestImpl>
    implements _$$OrderItemRequestImplCopyWith<$Res> {
  __$$OrderItemRequestImplCopyWithImpl(_$OrderItemRequestImpl _value,
      $Res Function(_$OrderItemRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? variantId = freezed,
    Object? quantity = null,
  }) {
    return _then(_$OrderItemRequestImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderItemRequestImpl implements _OrderItemRequest {
  const _$OrderItemRequestImpl(
      {required this.productId, this.variantId, required this.quantity});

  factory _$OrderItemRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderItemRequestImplFromJson(json);

  @override
  final String productId;
  @override
  final String? variantId;
  @override
  final int quantity;

  @override
  String toString() {
    return 'OrderItemRequest(productId: $productId, variantId: $variantId, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemRequestImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.variantId, variantId) ||
                other.variantId == variantId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, productId, variantId, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemRequestImplCopyWith<_$OrderItemRequestImpl> get copyWith =>
      __$$OrderItemRequestImplCopyWithImpl<_$OrderItemRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderItemRequestImplToJson(
      this,
    );
  }
}

abstract class _OrderItemRequest implements OrderItemRequest {
  const factory _OrderItemRequest(
      {required final String productId,
      final String? variantId,
      required final int quantity}) = _$OrderItemRequestImpl;

  factory _OrderItemRequest.fromJson(Map<String, dynamic> json) =
      _$OrderItemRequestImpl.fromJson;

  @override
  String get productId;
  @override
  String? get variantId;
  @override
  int get quantity;
  @override
  @JsonKey(ignore: true)
  _$$OrderItemRequestImplCopyWith<_$OrderItemRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateReviewRequest _$CreateReviewRequestFromJson(Map<String, dynamic> json) {
  return _CreateReviewRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateReviewRequest {
  String get productId => throw _privateConstructorUsedError;
  int get rating => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateReviewRequestCopyWith<CreateReviewRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateReviewRequestCopyWith<$Res> {
  factory $CreateReviewRequestCopyWith(
          CreateReviewRequest value, $Res Function(CreateReviewRequest) then) =
      _$CreateReviewRequestCopyWithImpl<$Res, CreateReviewRequest>;
  @useResult
  $Res call({String productId, int rating, String comment});
}

/// @nodoc
class _$CreateReviewRequestCopyWithImpl<$Res, $Val extends CreateReviewRequest>
    implements $CreateReviewRequestCopyWith<$Res> {
  _$CreateReviewRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? rating = null,
    Object? comment = null,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateReviewRequestImplCopyWith<$Res>
    implements $CreateReviewRequestCopyWith<$Res> {
  factory _$$CreateReviewRequestImplCopyWith(_$CreateReviewRequestImpl value,
          $Res Function(_$CreateReviewRequestImpl) then) =
      __$$CreateReviewRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String productId, int rating, String comment});
}

/// @nodoc
class __$$CreateReviewRequestImplCopyWithImpl<$Res>
    extends _$CreateReviewRequestCopyWithImpl<$Res, _$CreateReviewRequestImpl>
    implements _$$CreateReviewRequestImplCopyWith<$Res> {
  __$$CreateReviewRequestImplCopyWithImpl(_$CreateReviewRequestImpl _value,
      $Res Function(_$CreateReviewRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? rating = null,
    Object? comment = null,
  }) {
    return _then(_$CreateReviewRequestImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateReviewRequestImpl implements _CreateReviewRequest {
  const _$CreateReviewRequestImpl(
      {required this.productId, required this.rating, required this.comment});

  factory _$CreateReviewRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateReviewRequestImplFromJson(json);

  @override
  final String productId;
  @override
  final int rating;
  @override
  final String comment;

  @override
  String toString() {
    return 'CreateReviewRequest(productId: $productId, rating: $rating, comment: $comment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateReviewRequestImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, productId, rating, comment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateReviewRequestImplCopyWith<_$CreateReviewRequestImpl> get copyWith =>
      __$$CreateReviewRequestImplCopyWithImpl<_$CreateReviewRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateReviewRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateReviewRequest implements CreateReviewRequest {
  const factory _CreateReviewRequest(
      {required final String productId,
      required final int rating,
      required final String comment}) = _$CreateReviewRequestImpl;

  factory _CreateReviewRequest.fromJson(Map<String, dynamic> json) =
      _$CreateReviewRequestImpl.fromJson;

  @override
  String get productId;
  @override
  int get rating;
  @override
  String get comment;
  @override
  @JsonKey(ignore: true)
  _$$CreateReviewRequestImplCopyWith<_$CreateReviewRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AddToWatchlistRequest _$AddToWatchlistRequestFromJson(
    Map<String, dynamic> json) {
  return _AddToWatchlistRequest.fromJson(json);
}

/// @nodoc
mixin _$AddToWatchlistRequest {
  String get productId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddToWatchlistRequestCopyWith<AddToWatchlistRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddToWatchlistRequestCopyWith<$Res> {
  factory $AddToWatchlistRequestCopyWith(AddToWatchlistRequest value,
          $Res Function(AddToWatchlistRequest) then) =
      _$AddToWatchlistRequestCopyWithImpl<$Res, AddToWatchlistRequest>;
  @useResult
  $Res call({String productId});
}

/// @nodoc
class _$AddToWatchlistRequestCopyWithImpl<$Res,
        $Val extends AddToWatchlistRequest>
    implements $AddToWatchlistRequestCopyWith<$Res> {
  _$AddToWatchlistRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddToWatchlistRequestImplCopyWith<$Res>
    implements $AddToWatchlistRequestCopyWith<$Res> {
  factory _$$AddToWatchlistRequestImplCopyWith(
          _$AddToWatchlistRequestImpl value,
          $Res Function(_$AddToWatchlistRequestImpl) then) =
      __$$AddToWatchlistRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String productId});
}

/// @nodoc
class __$$AddToWatchlistRequestImplCopyWithImpl<$Res>
    extends _$AddToWatchlistRequestCopyWithImpl<$Res,
        _$AddToWatchlistRequestImpl>
    implements _$$AddToWatchlistRequestImplCopyWith<$Res> {
  __$$AddToWatchlistRequestImplCopyWithImpl(_$AddToWatchlistRequestImpl _value,
      $Res Function(_$AddToWatchlistRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
  }) {
    return _then(_$AddToWatchlistRequestImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddToWatchlistRequestImpl implements _AddToWatchlistRequest {
  const _$AddToWatchlistRequestImpl({required this.productId});

  factory _$AddToWatchlistRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddToWatchlistRequestImplFromJson(json);

  @override
  final String productId;

  @override
  String toString() {
    return 'AddToWatchlistRequest(productId: $productId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddToWatchlistRequestImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, productId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddToWatchlistRequestImplCopyWith<_$AddToWatchlistRequestImpl>
      get copyWith => __$$AddToWatchlistRequestImplCopyWithImpl<
          _$AddToWatchlistRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddToWatchlistRequestImplToJson(
      this,
    );
  }
}

abstract class _AddToWatchlistRequest implements AddToWatchlistRequest {
  const factory _AddToWatchlistRequest({required final String productId}) =
      _$AddToWatchlistRequestImpl;

  factory _AddToWatchlistRequest.fromJson(Map<String, dynamic> json) =
      _$AddToWatchlistRequestImpl.fromJson;

  @override
  String get productId;
  @override
  @JsonKey(ignore: true)
  _$$AddToWatchlistRequestImplCopyWith<_$AddToWatchlistRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
