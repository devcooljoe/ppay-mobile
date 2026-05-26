// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dollar_card_transaction_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DollarCardTransactionEntity {
  String get id => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get entry => throw _privateConstructorUsedError;
  DollarCardMerchantEntity get merchant => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DollarCardTransactionEntityCopyWith<DollarCardTransactionEntity>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DollarCardTransactionEntityCopyWith<$Res> {
  factory $DollarCardTransactionEntityCopyWith(
          DollarCardTransactionEntity value,
          $Res Function(DollarCardTransactionEntity) then) =
      _$DollarCardTransactionEntityCopyWithImpl<$Res,
          DollarCardTransactionEntity>;
  @useResult
  $Res call(
      {String id,
      double amount,
      String currency,
      String description,
      String status,
      String entry,
      DollarCardMerchantEntity merchant,
      String createdAt});

  $DollarCardMerchantEntityCopyWith<$Res> get merchant;
}

/// @nodoc
class _$DollarCardTransactionEntityCopyWithImpl<$Res,
        $Val extends DollarCardTransactionEntity>
    implements $DollarCardTransactionEntityCopyWith<$Res> {
  _$DollarCardTransactionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? currency = null,
    Object? description = null,
    Object? status = null,
    Object? entry = null,
    Object? merchant = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      entry: null == entry
          ? _value.entry
          : entry // ignore: cast_nullable_to_non_nullable
              as String,
      merchant: null == merchant
          ? _value.merchant
          : merchant // ignore: cast_nullable_to_non_nullable
              as DollarCardMerchantEntity,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DollarCardMerchantEntityCopyWith<$Res> get merchant {
    return $DollarCardMerchantEntityCopyWith<$Res>(_value.merchant, (value) {
      return _then(_value.copyWith(merchant: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DollarCardTransactionEntityImplCopyWith<$Res>
    implements $DollarCardTransactionEntityCopyWith<$Res> {
  factory _$$DollarCardTransactionEntityImplCopyWith(
          _$DollarCardTransactionEntityImpl value,
          $Res Function(_$DollarCardTransactionEntityImpl) then) =
      __$$DollarCardTransactionEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      double amount,
      String currency,
      String description,
      String status,
      String entry,
      DollarCardMerchantEntity merchant,
      String createdAt});

  @override
  $DollarCardMerchantEntityCopyWith<$Res> get merchant;
}

/// @nodoc
class __$$DollarCardTransactionEntityImplCopyWithImpl<$Res>
    extends _$DollarCardTransactionEntityCopyWithImpl<$Res,
        _$DollarCardTransactionEntityImpl>
    implements _$$DollarCardTransactionEntityImplCopyWith<$Res> {
  __$$DollarCardTransactionEntityImplCopyWithImpl(
      _$DollarCardTransactionEntityImpl _value,
      $Res Function(_$DollarCardTransactionEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? currency = null,
    Object? description = null,
    Object? status = null,
    Object? entry = null,
    Object? merchant = null,
    Object? createdAt = null,
  }) {
    return _then(_$DollarCardTransactionEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      entry: null == entry
          ? _value.entry
          : entry // ignore: cast_nullable_to_non_nullable
              as String,
      merchant: null == merchant
          ? _value.merchant
          : merchant // ignore: cast_nullable_to_non_nullable
              as DollarCardMerchantEntity,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DollarCardTransactionEntityImpl
    implements _DollarCardTransactionEntity {
  const _$DollarCardTransactionEntityImpl(
      {required this.id,
      required this.amount,
      required this.currency,
      required this.description,
      required this.status,
      required this.entry,
      required this.merchant,
      required this.createdAt});

  @override
  final String id;
  @override
  final double amount;
  @override
  final String currency;
  @override
  final String description;
  @override
  final String status;
  @override
  final String entry;
  @override
  final DollarCardMerchantEntity merchant;
  @override
  final String createdAt;

  @override
  String toString() {
    return 'DollarCardTransactionEntity(id: $id, amount: $amount, currency: $currency, description: $description, status: $status, entry: $entry, merchant: $merchant, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DollarCardTransactionEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.entry, entry) || other.entry == entry) &&
            (identical(other.merchant, merchant) ||
                other.merchant == merchant) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, amount, currency,
      description, status, entry, merchant, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DollarCardTransactionEntityImplCopyWith<_$DollarCardTransactionEntityImpl>
      get copyWith => __$$DollarCardTransactionEntityImplCopyWithImpl<
          _$DollarCardTransactionEntityImpl>(this, _$identity);
}

abstract class _DollarCardTransactionEntity
    implements DollarCardTransactionEntity {
  const factory _DollarCardTransactionEntity(
      {required final String id,
      required final double amount,
      required final String currency,
      required final String description,
      required final String status,
      required final String entry,
      required final DollarCardMerchantEntity merchant,
      required final String createdAt}) = _$DollarCardTransactionEntityImpl;

  @override
  String get id;
  @override
  double get amount;
  @override
  String get currency;
  @override
  String get description;
  @override
  String get status;
  @override
  String get entry;
  @override
  DollarCardMerchantEntity get merchant;
  @override
  String get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$DollarCardTransactionEntityImplCopyWith<_$DollarCardTransactionEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DollarCardMerchantEntity {
  String get name => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DollarCardMerchantEntityCopyWith<DollarCardMerchantEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DollarCardMerchantEntityCopyWith<$Res> {
  factory $DollarCardMerchantEntityCopyWith(DollarCardMerchantEntity value,
          $Res Function(DollarCardMerchantEntity) then) =
      _$DollarCardMerchantEntityCopyWithImpl<$Res, DollarCardMerchantEntity>;
  @useResult
  $Res call({String name, String city, String country});
}

/// @nodoc
class _$DollarCardMerchantEntityCopyWithImpl<$Res,
        $Val extends DollarCardMerchantEntity>
    implements $DollarCardMerchantEntityCopyWith<$Res> {
  _$DollarCardMerchantEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? city = null,
    Object? country = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DollarCardMerchantEntityImplCopyWith<$Res>
    implements $DollarCardMerchantEntityCopyWith<$Res> {
  factory _$$DollarCardMerchantEntityImplCopyWith(
          _$DollarCardMerchantEntityImpl value,
          $Res Function(_$DollarCardMerchantEntityImpl) then) =
      __$$DollarCardMerchantEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String city, String country});
}

/// @nodoc
class __$$DollarCardMerchantEntityImplCopyWithImpl<$Res>
    extends _$DollarCardMerchantEntityCopyWithImpl<$Res,
        _$DollarCardMerchantEntityImpl>
    implements _$$DollarCardMerchantEntityImplCopyWith<$Res> {
  __$$DollarCardMerchantEntityImplCopyWithImpl(
      _$DollarCardMerchantEntityImpl _value,
      $Res Function(_$DollarCardMerchantEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? city = null,
    Object? country = null,
  }) {
    return _then(_$DollarCardMerchantEntityImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DollarCardMerchantEntityImpl implements _DollarCardMerchantEntity {
  const _$DollarCardMerchantEntityImpl(
      {required this.name, required this.city, required this.country});

  @override
  final String name;
  @override
  final String city;
  @override
  final String country;

  @override
  String toString() {
    return 'DollarCardMerchantEntity(name: $name, city: $city, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DollarCardMerchantEntityImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.country, country) || other.country == country));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, city, country);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DollarCardMerchantEntityImplCopyWith<_$DollarCardMerchantEntityImpl>
      get copyWith => __$$DollarCardMerchantEntityImplCopyWithImpl<
          _$DollarCardMerchantEntityImpl>(this, _$identity);
}

abstract class _DollarCardMerchantEntity implements DollarCardMerchantEntity {
  const factory _DollarCardMerchantEntity(
      {required final String name,
      required final String city,
      required final String country}) = _$DollarCardMerchantEntityImpl;

  @override
  String get name;
  @override
  String get city;
  @override
  String get country;
  @override
  @JsonKey(ignore: true)
  _$$DollarCardMerchantEntityImplCopyWith<_$DollarCardMerchantEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
