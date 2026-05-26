// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dollar_card_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DollarCardEntity {
  String get id => throw _privateConstructorUsedError;
  String get reference => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get cardNumber => throw _privateConstructorUsedError;
  String get maskedPan => throw _privateConstructorUsedError;
  String get expiry => throw _privateConstructorUsedError;
  String get cvv => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get issuer => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;
  DollarCardAddressEntity get address => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DollarCardEntityCopyWith<DollarCardEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DollarCardEntityCopyWith<$Res> {
  factory $DollarCardEntityCopyWith(
          DollarCardEntity value, $Res Function(DollarCardEntity) then) =
      _$DollarCardEntityCopyWithImpl<$Res, DollarCardEntity>;
  @useResult
  $Res call(
      {String id,
      String reference,
      String name,
      String cardNumber,
      String maskedPan,
      String expiry,
      String cvv,
      String status,
      String type,
      String issuer,
      String currency,
      double balance,
      DollarCardAddressEntity address,
      String createdAt,
      String updatedAt,
      double rate});

  $DollarCardAddressEntityCopyWith<$Res> get address;
}

/// @nodoc
class _$DollarCardEntityCopyWithImpl<$Res, $Val extends DollarCardEntity>
    implements $DollarCardEntityCopyWith<$Res> {
  _$DollarCardEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? reference = null,
    Object? name = null,
    Object? cardNumber = null,
    Object? maskedPan = null,
    Object? expiry = null,
    Object? cvv = null,
    Object? status = null,
    Object? type = null,
    Object? issuer = null,
    Object? currency = null,
    Object? balance = null,
    Object? address = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? rate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      cardNumber: null == cardNumber
          ? _value.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as String,
      maskedPan: null == maskedPan
          ? _value.maskedPan
          : maskedPan // ignore: cast_nullable_to_non_nullable
              as String,
      expiry: null == expiry
          ? _value.expiry
          : expiry // ignore: cast_nullable_to_non_nullable
              as String,
      cvv: null == cvv
          ? _value.cvv
          : cvv // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      issuer: null == issuer
          ? _value.issuer
          : issuer // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as DollarCardAddressEntity,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DollarCardAddressEntityCopyWith<$Res> get address {
    return $DollarCardAddressEntityCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DollarCardEntityImplCopyWith<$Res>
    implements $DollarCardEntityCopyWith<$Res> {
  factory _$$DollarCardEntityImplCopyWith(_$DollarCardEntityImpl value,
          $Res Function(_$DollarCardEntityImpl) then) =
      __$$DollarCardEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String reference,
      String name,
      String cardNumber,
      String maskedPan,
      String expiry,
      String cvv,
      String status,
      String type,
      String issuer,
      String currency,
      double balance,
      DollarCardAddressEntity address,
      String createdAt,
      String updatedAt,
      double rate});

  @override
  $DollarCardAddressEntityCopyWith<$Res> get address;
}

/// @nodoc
class __$$DollarCardEntityImplCopyWithImpl<$Res>
    extends _$DollarCardEntityCopyWithImpl<$Res, _$DollarCardEntityImpl>
    implements _$$DollarCardEntityImplCopyWith<$Res> {
  __$$DollarCardEntityImplCopyWithImpl(_$DollarCardEntityImpl _value,
      $Res Function(_$DollarCardEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? reference = null,
    Object? name = null,
    Object? cardNumber = null,
    Object? maskedPan = null,
    Object? expiry = null,
    Object? cvv = null,
    Object? status = null,
    Object? type = null,
    Object? issuer = null,
    Object? currency = null,
    Object? balance = null,
    Object? address = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? rate = null,
  }) {
    return _then(_$DollarCardEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      cardNumber: null == cardNumber
          ? _value.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as String,
      maskedPan: null == maskedPan
          ? _value.maskedPan
          : maskedPan // ignore: cast_nullable_to_non_nullable
              as String,
      expiry: null == expiry
          ? _value.expiry
          : expiry // ignore: cast_nullable_to_non_nullable
              as String,
      cvv: null == cvv
          ? _value.cvv
          : cvv // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      issuer: null == issuer
          ? _value.issuer
          : issuer // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as DollarCardAddressEntity,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$DollarCardEntityImpl implements _DollarCardEntity {
  const _$DollarCardEntityImpl(
      {required this.id,
      required this.reference,
      required this.name,
      required this.cardNumber,
      required this.maskedPan,
      required this.expiry,
      required this.cvv,
      required this.status,
      required this.type,
      required this.issuer,
      required this.currency,
      required this.balance,
      required this.address,
      required this.createdAt,
      required this.updatedAt,
      required this.rate});

  @override
  final String id;
  @override
  final String reference;
  @override
  final String name;
  @override
  final String cardNumber;
  @override
  final String maskedPan;
  @override
  final String expiry;
  @override
  final String cvv;
  @override
  final String status;
  @override
  final String type;
  @override
  final String issuer;
  @override
  final String currency;
  @override
  final double balance;
  @override
  final DollarCardAddressEntity address;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final double rate;

  @override
  String toString() {
    return 'DollarCardEntity(id: $id, reference: $reference, name: $name, cardNumber: $cardNumber, maskedPan: $maskedPan, expiry: $expiry, cvv: $cvv, status: $status, type: $type, issuer: $issuer, currency: $currency, balance: $balance, address: $address, createdAt: $createdAt, updatedAt: $updatedAt, rate: $rate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DollarCardEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.cardNumber, cardNumber) ||
                other.cardNumber == cardNumber) &&
            (identical(other.maskedPan, maskedPan) ||
                other.maskedPan == maskedPan) &&
            (identical(other.expiry, expiry) || other.expiry == expiry) &&
            (identical(other.cvv, cvv) || other.cvv == cvv) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.issuer, issuer) || other.issuer == issuer) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.rate, rate) || other.rate == rate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      reference,
      name,
      cardNumber,
      maskedPan,
      expiry,
      cvv,
      status,
      type,
      issuer,
      currency,
      balance,
      address,
      createdAt,
      updatedAt,
      rate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DollarCardEntityImplCopyWith<_$DollarCardEntityImpl> get copyWith =>
      __$$DollarCardEntityImplCopyWithImpl<_$DollarCardEntityImpl>(
          this, _$identity);
}

abstract class _DollarCardEntity implements DollarCardEntity {
  const factory _DollarCardEntity(
      {required final String id,
      required final String reference,
      required final String name,
      required final String cardNumber,
      required final String maskedPan,
      required final String expiry,
      required final String cvv,
      required final String status,
      required final String type,
      required final String issuer,
      required final String currency,
      required final double balance,
      required final DollarCardAddressEntity address,
      required final String createdAt,
      required final String updatedAt,
      required final double rate}) = _$DollarCardEntityImpl;

  @override
  String get id;
  @override
  String get reference;
  @override
  String get name;
  @override
  String get cardNumber;
  @override
  String get maskedPan;
  @override
  String get expiry;
  @override
  String get cvv;
  @override
  String get status;
  @override
  String get type;
  @override
  String get issuer;
  @override
  String get currency;
  @override
  double get balance;
  @override
  DollarCardAddressEntity get address;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  double get rate;
  @override
  @JsonKey(ignore: true)
  _$$DollarCardEntityImplCopyWith<_$DollarCardEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DollarCardAddressEntity {
  String get street => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  String get postalCode => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DollarCardAddressEntityCopyWith<DollarCardAddressEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DollarCardAddressEntityCopyWith<$Res> {
  factory $DollarCardAddressEntityCopyWith(DollarCardAddressEntity value,
          $Res Function(DollarCardAddressEntity) then) =
      _$DollarCardAddressEntityCopyWithImpl<$Res, DollarCardAddressEntity>;
  @useResult
  $Res call(
      {String street,
      String city,
      String state,
      String postalCode,
      String country});
}

/// @nodoc
class _$DollarCardAddressEntityCopyWithImpl<$Res,
        $Val extends DollarCardAddressEntity>
    implements $DollarCardAddressEntityCopyWith<$Res> {
  _$DollarCardAddressEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? street = null,
    Object? city = null,
    Object? state = null,
    Object? postalCode = null,
    Object? country = null,
  }) {
    return _then(_value.copyWith(
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DollarCardAddressEntityImplCopyWith<$Res>
    implements $DollarCardAddressEntityCopyWith<$Res> {
  factory _$$DollarCardAddressEntityImplCopyWith(
          _$DollarCardAddressEntityImpl value,
          $Res Function(_$DollarCardAddressEntityImpl) then) =
      __$$DollarCardAddressEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String street,
      String city,
      String state,
      String postalCode,
      String country});
}

/// @nodoc
class __$$DollarCardAddressEntityImplCopyWithImpl<$Res>
    extends _$DollarCardAddressEntityCopyWithImpl<$Res,
        _$DollarCardAddressEntityImpl>
    implements _$$DollarCardAddressEntityImplCopyWith<$Res> {
  __$$DollarCardAddressEntityImplCopyWithImpl(
      _$DollarCardAddressEntityImpl _value,
      $Res Function(_$DollarCardAddressEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? street = null,
    Object? city = null,
    Object? state = null,
    Object? postalCode = null,
    Object? country = null,
  }) {
    return _then(_$DollarCardAddressEntityImpl(
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DollarCardAddressEntityImpl implements _DollarCardAddressEntity {
  const _$DollarCardAddressEntityImpl(
      {required this.street,
      required this.city,
      required this.state,
      required this.postalCode,
      required this.country});

  @override
  final String street;
  @override
  final String city;
  @override
  final String state;
  @override
  final String postalCode;
  @override
  final String country;

  @override
  String toString() {
    return 'DollarCardAddressEntity(street: $street, city: $city, state: $state, postalCode: $postalCode, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DollarCardAddressEntityImpl &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.country, country) || other.country == country));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, street, city, state, postalCode, country);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DollarCardAddressEntityImplCopyWith<_$DollarCardAddressEntityImpl>
      get copyWith => __$$DollarCardAddressEntityImplCopyWithImpl<
          _$DollarCardAddressEntityImpl>(this, _$identity);
}

abstract class _DollarCardAddressEntity implements DollarCardAddressEntity {
  const factory _DollarCardAddressEntity(
      {required final String street,
      required final String city,
      required final String state,
      required final String postalCode,
      required final String country}) = _$DollarCardAddressEntityImpl;

  @override
  String get street;
  @override
  String get city;
  @override
  String get state;
  @override
  String get postalCode;
  @override
  String get country;
  @override
  @JsonKey(ignore: true)
  _$$DollarCardAddressEntityImplCopyWith<_$DollarCardAddressEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
