// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bill_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BillerEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get billerIconUrl => throw _privateConstructorUsedError;
  String get billTypeId => throw _privateConstructorUsedError;
  List<BillItemEntity> get billItems => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BillerEntityCopyWith<BillerEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillerEntityCopyWith<$Res> {
  factory $BillerEntityCopyWith(
          BillerEntity value, $Res Function(BillerEntity) then) =
      _$BillerEntityCopyWithImpl<$Res, BillerEntity>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String billerIconUrl,
      String billTypeId,
      List<BillItemEntity> billItems});
}

/// @nodoc
class _$BillerEntityCopyWithImpl<$Res, $Val extends BillerEntity>
    implements $BillerEntityCopyWith<$Res> {
  _$BillerEntityCopyWithImpl(this._value, this._then);

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
    Object? billerIconUrl = null,
    Object? billTypeId = null,
    Object? billItems = null,
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
      billerIconUrl: null == billerIconUrl
          ? _value.billerIconUrl
          : billerIconUrl // ignore: cast_nullable_to_non_nullable
              as String,
      billTypeId: null == billTypeId
          ? _value.billTypeId
          : billTypeId // ignore: cast_nullable_to_non_nullable
              as String,
      billItems: null == billItems
          ? _value.billItems
          : billItems // ignore: cast_nullable_to_non_nullable
              as List<BillItemEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BillerEntityImplCopyWith<$Res>
    implements $BillerEntityCopyWith<$Res> {
  factory _$$BillerEntityImplCopyWith(
          _$BillerEntityImpl value, $Res Function(_$BillerEntityImpl) then) =
      __$$BillerEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String billerIconUrl,
      String billTypeId,
      List<BillItemEntity> billItems});
}

/// @nodoc
class __$$BillerEntityImplCopyWithImpl<$Res>
    extends _$BillerEntityCopyWithImpl<$Res, _$BillerEntityImpl>
    implements _$$BillerEntityImplCopyWith<$Res> {
  __$$BillerEntityImplCopyWithImpl(
      _$BillerEntityImpl _value, $Res Function(_$BillerEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? billerIconUrl = null,
    Object? billTypeId = null,
    Object? billItems = null,
  }) {
    return _then(_$BillerEntityImpl(
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
      billerIconUrl: null == billerIconUrl
          ? _value.billerIconUrl
          : billerIconUrl // ignore: cast_nullable_to_non_nullable
              as String,
      billTypeId: null == billTypeId
          ? _value.billTypeId
          : billTypeId // ignore: cast_nullable_to_non_nullable
              as String,
      billItems: null == billItems
          ? _value._billItems
          : billItems // ignore: cast_nullable_to_non_nullable
              as List<BillItemEntity>,
    ));
  }
}

/// @nodoc

class _$BillerEntityImpl implements _BillerEntity {
  const _$BillerEntityImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.billerIconUrl,
      required this.billTypeId,
      required final List<BillItemEntity> billItems})
      : _billItems = billItems;

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String billerIconUrl;
  @override
  final String billTypeId;
  final List<BillItemEntity> _billItems;
  @override
  List<BillItemEntity> get billItems {
    if (_billItems is EqualUnmodifiableListView) return _billItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_billItems);
  }

  @override
  String toString() {
    return 'BillerEntity(id: $id, name: $name, description: $description, billerIconUrl: $billerIconUrl, billTypeId: $billTypeId, billItems: $billItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BillerEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.billerIconUrl, billerIconUrl) ||
                other.billerIconUrl == billerIconUrl) &&
            (identical(other.billTypeId, billTypeId) ||
                other.billTypeId == billTypeId) &&
            const DeepCollectionEquality()
                .equals(other._billItems, _billItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      billerIconUrl,
      billTypeId,
      const DeepCollectionEquality().hash(_billItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BillerEntityImplCopyWith<_$BillerEntityImpl> get copyWith =>
      __$$BillerEntityImplCopyWithImpl<_$BillerEntityImpl>(this, _$identity);
}

abstract class _BillerEntity implements BillerEntity {
  const factory _BillerEntity(
      {required final String id,
      required final String name,
      required final String description,
      required final String billerIconUrl,
      required final String billTypeId,
      required final List<BillItemEntity> billItems}) = _$BillerEntityImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get billerIconUrl;
  @override
  String get billTypeId;
  @override
  List<BillItemEntity> get billItems;
  @override
  @JsonKey(ignore: true)
  _$$BillerEntityImplCopyWith<_$BillerEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BillItemEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get kudaIdentifier => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  bool get isFixedPrice => throw _privateConstructorUsedError;
  String get billerId => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BillItemEntityCopyWith<BillItemEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillItemEntityCopyWith<$Res> {
  factory $BillItemEntityCopyWith(
          BillItemEntity value, $Res Function(BillItemEntity) then) =
      _$BillItemEntityCopyWithImpl<$Res, BillItemEntity>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String kudaIdentifier,
      double amount,
      bool isFixedPrice,
      String billerId,
      bool isActive});
}

/// @nodoc
class _$BillItemEntityCopyWithImpl<$Res, $Val extends BillItemEntity>
    implements $BillItemEntityCopyWith<$Res> {
  _$BillItemEntityCopyWithImpl(this._value, this._then);

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
    Object? kudaIdentifier = null,
    Object? amount = null,
    Object? isFixedPrice = null,
    Object? billerId = null,
    Object? isActive = null,
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
      kudaIdentifier: null == kudaIdentifier
          ? _value.kudaIdentifier
          : kudaIdentifier // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      isFixedPrice: null == isFixedPrice
          ? _value.isFixedPrice
          : isFixedPrice // ignore: cast_nullable_to_non_nullable
              as bool,
      billerId: null == billerId
          ? _value.billerId
          : billerId // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BillItemEntityImplCopyWith<$Res>
    implements $BillItemEntityCopyWith<$Res> {
  factory _$$BillItemEntityImplCopyWith(_$BillItemEntityImpl value,
          $Res Function(_$BillItemEntityImpl) then) =
      __$$BillItemEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String kudaIdentifier,
      double amount,
      bool isFixedPrice,
      String billerId,
      bool isActive});
}

/// @nodoc
class __$$BillItemEntityImplCopyWithImpl<$Res>
    extends _$BillItemEntityCopyWithImpl<$Res, _$BillItemEntityImpl>
    implements _$$BillItemEntityImplCopyWith<$Res> {
  __$$BillItemEntityImplCopyWithImpl(
      _$BillItemEntityImpl _value, $Res Function(_$BillItemEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? kudaIdentifier = null,
    Object? amount = null,
    Object? isFixedPrice = null,
    Object? billerId = null,
    Object? isActive = null,
  }) {
    return _then(_$BillItemEntityImpl(
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
      kudaIdentifier: null == kudaIdentifier
          ? _value.kudaIdentifier
          : kudaIdentifier // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      isFixedPrice: null == isFixedPrice
          ? _value.isFixedPrice
          : isFixedPrice // ignore: cast_nullable_to_non_nullable
              as bool,
      billerId: null == billerId
          ? _value.billerId
          : billerId // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$BillItemEntityImpl implements _BillItemEntity {
  const _$BillItemEntityImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.kudaIdentifier,
      required this.amount,
      required this.isFixedPrice,
      required this.billerId,
      required this.isActive});

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String kudaIdentifier;
  @override
  final double amount;
  @override
  final bool isFixedPrice;
  @override
  final String billerId;
  @override
  final bool isActive;

  @override
  String toString() {
    return 'BillItemEntity(id: $id, name: $name, description: $description, kudaIdentifier: $kudaIdentifier, amount: $amount, isFixedPrice: $isFixedPrice, billerId: $billerId, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BillItemEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.kudaIdentifier, kudaIdentifier) ||
                other.kudaIdentifier == kudaIdentifier) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.isFixedPrice, isFixedPrice) ||
                other.isFixedPrice == isFixedPrice) &&
            (identical(other.billerId, billerId) ||
                other.billerId == billerId) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, description,
      kudaIdentifier, amount, isFixedPrice, billerId, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BillItemEntityImplCopyWith<_$BillItemEntityImpl> get copyWith =>
      __$$BillItemEntityImplCopyWithImpl<_$BillItemEntityImpl>(
          this, _$identity);
}

abstract class _BillItemEntity implements BillItemEntity {
  const factory _BillItemEntity(
      {required final String id,
      required final String name,
      required final String description,
      required final String kudaIdentifier,
      required final double amount,
      required final bool isFixedPrice,
      required final String billerId,
      required final bool isActive}) = _$BillItemEntityImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get kudaIdentifier;
  @override
  double get amount;
  @override
  bool get isFixedPrice;
  @override
  String get billerId;
  @override
  bool get isActive;
  @override
  @JsonKey(ignore: true)
  _$$BillItemEntityImplCopyWith<_$BillItemEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CustomerVerificationEntity {
  String get customerName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomerVerificationEntityCopyWith<CustomerVerificationEntity>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerVerificationEntityCopyWith<$Res> {
  factory $CustomerVerificationEntityCopyWith(CustomerVerificationEntity value,
          $Res Function(CustomerVerificationEntity) then) =
      _$CustomerVerificationEntityCopyWithImpl<$Res,
          CustomerVerificationEntity>;
  @useResult
  $Res call({String customerName});
}

/// @nodoc
class _$CustomerVerificationEntityCopyWithImpl<$Res,
        $Val extends CustomerVerificationEntity>
    implements $CustomerVerificationEntityCopyWith<$Res> {
  _$CustomerVerificationEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerName = null,
  }) {
    return _then(_value.copyWith(
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerVerificationEntityImplCopyWith<$Res>
    implements $CustomerVerificationEntityCopyWith<$Res> {
  factory _$$CustomerVerificationEntityImplCopyWith(
          _$CustomerVerificationEntityImpl value,
          $Res Function(_$CustomerVerificationEntityImpl) then) =
      __$$CustomerVerificationEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String customerName});
}

/// @nodoc
class __$$CustomerVerificationEntityImplCopyWithImpl<$Res>
    extends _$CustomerVerificationEntityCopyWithImpl<$Res,
        _$CustomerVerificationEntityImpl>
    implements _$$CustomerVerificationEntityImplCopyWith<$Res> {
  __$$CustomerVerificationEntityImplCopyWithImpl(
      _$CustomerVerificationEntityImpl _value,
      $Res Function(_$CustomerVerificationEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerName = null,
  }) {
    return _then(_$CustomerVerificationEntityImpl(
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CustomerVerificationEntityImpl implements _CustomerVerificationEntity {
  const _$CustomerVerificationEntityImpl({required this.customerName});

  @override
  final String customerName;

  @override
  String toString() {
    return 'CustomerVerificationEntity(customerName: $customerName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerVerificationEntityImpl &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customerName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerVerificationEntityImplCopyWith<_$CustomerVerificationEntityImpl>
      get copyWith => __$$CustomerVerificationEntityImplCopyWithImpl<
          _$CustomerVerificationEntityImpl>(this, _$identity);
}

abstract class _CustomerVerificationEntity
    implements CustomerVerificationEntity {
  const factory _CustomerVerificationEntity(
      {required final String customerName}) = _$CustomerVerificationEntityImpl;

  @override
  String get customerName;
  @override
  @JsonKey(ignore: true)
  _$$CustomerVerificationEntityImplCopyWith<_$CustomerVerificationEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BillPurchaseEntity {
  String get reference => throw _privateConstructorUsedError;
  String? get pin => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BillPurchaseEntityCopyWith<BillPurchaseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillPurchaseEntityCopyWith<$Res> {
  factory $BillPurchaseEntityCopyWith(
          BillPurchaseEntity value, $Res Function(BillPurchaseEntity) then) =
      _$BillPurchaseEntityCopyWithImpl<$Res, BillPurchaseEntity>;
  @useResult
  $Res call({String reference, String? pin});
}

/// @nodoc
class _$BillPurchaseEntityCopyWithImpl<$Res, $Val extends BillPurchaseEntity>
    implements $BillPurchaseEntityCopyWith<$Res> {
  _$BillPurchaseEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference = null,
    Object? pin = freezed,
  }) {
    return _then(_value.copyWith(
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      pin: freezed == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BillPurchaseEntityImplCopyWith<$Res>
    implements $BillPurchaseEntityCopyWith<$Res> {
  factory _$$BillPurchaseEntityImplCopyWith(_$BillPurchaseEntityImpl value,
          $Res Function(_$BillPurchaseEntityImpl) then) =
      __$$BillPurchaseEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String reference, String? pin});
}

/// @nodoc
class __$$BillPurchaseEntityImplCopyWithImpl<$Res>
    extends _$BillPurchaseEntityCopyWithImpl<$Res, _$BillPurchaseEntityImpl>
    implements _$$BillPurchaseEntityImplCopyWith<$Res> {
  __$$BillPurchaseEntityImplCopyWithImpl(_$BillPurchaseEntityImpl _value,
      $Res Function(_$BillPurchaseEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference = null,
    Object? pin = freezed,
  }) {
    return _then(_$BillPurchaseEntityImpl(
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      pin: freezed == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$BillPurchaseEntityImpl implements _BillPurchaseEntity {
  const _$BillPurchaseEntityImpl({required this.reference, this.pin});

  @override
  final String reference;
  @override
  final String? pin;

  @override
  String toString() {
    return 'BillPurchaseEntity(reference: $reference, pin: $pin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BillPurchaseEntityImpl &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.pin, pin) || other.pin == pin));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference, pin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BillPurchaseEntityImplCopyWith<_$BillPurchaseEntityImpl> get copyWith =>
      __$$BillPurchaseEntityImplCopyWithImpl<_$BillPurchaseEntityImpl>(
          this, _$identity);
}

abstract class _BillPurchaseEntity implements BillPurchaseEntity {
  const factory _BillPurchaseEntity(
      {required final String reference,
      final String? pin}) = _$BillPurchaseEntityImpl;

  @override
  String get reference;
  @override
  String? get pin;
  @override
  @JsonKey(ignore: true)
  _$$BillPurchaseEntityImplCopyWith<_$BillPurchaseEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
