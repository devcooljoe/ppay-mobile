// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dollar_card_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DollarCardModel _$DollarCardModelFromJson(Map<String, dynamic> json) {
  return _DollarCardModel.fromJson(json);
}

/// @nodoc
mixin _$DollarCardModel {
  String get id => throw _privateConstructorUsedError;
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
  DollarCardAddressModel get address => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DollarCardModelCopyWith<DollarCardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DollarCardModelCopyWith<$Res> {
  factory $DollarCardModelCopyWith(
          DollarCardModel value, $Res Function(DollarCardModel) then) =
      _$DollarCardModelCopyWithImpl<$Res, DollarCardModel>;
  @useResult
  $Res call(
      {String id,
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
      DollarCardAddressModel address,
      String createdAt,
      String updatedAt,
      double rate});

  $DollarCardAddressModelCopyWith<$Res> get address;
}

/// @nodoc
class _$DollarCardModelCopyWithImpl<$Res, $Val extends DollarCardModel>
    implements $DollarCardModelCopyWith<$Res> {
  _$DollarCardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
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
              as DollarCardAddressModel,
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
  $DollarCardAddressModelCopyWith<$Res> get address {
    return $DollarCardAddressModelCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DollarCardModelImplCopyWith<$Res>
    implements $DollarCardModelCopyWith<$Res> {
  factory _$$DollarCardModelImplCopyWith(_$DollarCardModelImpl value,
          $Res Function(_$DollarCardModelImpl) then) =
      __$$DollarCardModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
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
      DollarCardAddressModel address,
      String createdAt,
      String updatedAt,
      double rate});

  @override
  $DollarCardAddressModelCopyWith<$Res> get address;
}

/// @nodoc
class __$$DollarCardModelImplCopyWithImpl<$Res>
    extends _$DollarCardModelCopyWithImpl<$Res, _$DollarCardModelImpl>
    implements _$$DollarCardModelImplCopyWith<$Res> {
  __$$DollarCardModelImplCopyWithImpl(
      _$DollarCardModelImpl _value, $Res Function(_$DollarCardModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
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
    return _then(_$DollarCardModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
              as DollarCardAddressModel,
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
@JsonSerializable()
class _$DollarCardModelImpl extends _DollarCardModel {
  const _$DollarCardModelImpl(
      {required this.id,
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
      required this.rate})
      : super._();

  factory _$DollarCardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DollarCardModelImplFromJson(json);

  @override
  final String id;
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
  final DollarCardAddressModel address;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final double rate;

  @override
  String toString() {
    return 'DollarCardModel(id: $id, name: $name, cardNumber: $cardNumber, maskedPan: $maskedPan, expiry: $expiry, cvv: $cvv, status: $status, type: $type, issuer: $issuer, currency: $currency, balance: $balance, address: $address, createdAt: $createdAt, updatedAt: $updatedAt, rate: $rate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DollarCardModelImpl &&
            (identical(other.id, id) || other.id == id) &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
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
  _$$DollarCardModelImplCopyWith<_$DollarCardModelImpl> get copyWith =>
      __$$DollarCardModelImplCopyWithImpl<_$DollarCardModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DollarCardModelImplToJson(
      this,
    );
  }
}

abstract class _DollarCardModel extends DollarCardModel {
  const factory _DollarCardModel(
      {required final String id,
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
      required final DollarCardAddressModel address,
      required final String createdAt,
      required final String updatedAt,
      required final double rate}) = _$DollarCardModelImpl;
  const _DollarCardModel._() : super._();

  factory _DollarCardModel.fromJson(Map<String, dynamic> json) =
      _$DollarCardModelImpl.fromJson;

  @override
  String get id;
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
  DollarCardAddressModel get address;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  double get rate;
  @override
  @JsonKey(ignore: true)
  _$$DollarCardModelImplCopyWith<_$DollarCardModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DollarCardAddressModel _$DollarCardAddressModelFromJson(
    Map<String, dynamic> json) {
  return _DollarCardAddressModel.fromJson(json);
}

/// @nodoc
mixin _$DollarCardAddressModel {
  String get street => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  String get postalCode => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DollarCardAddressModelCopyWith<DollarCardAddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DollarCardAddressModelCopyWith<$Res> {
  factory $DollarCardAddressModelCopyWith(DollarCardAddressModel value,
          $Res Function(DollarCardAddressModel) then) =
      _$DollarCardAddressModelCopyWithImpl<$Res, DollarCardAddressModel>;
  @useResult
  $Res call(
      {String street,
      String city,
      String state,
      String postalCode,
      String country});
}

/// @nodoc
class _$DollarCardAddressModelCopyWithImpl<$Res,
        $Val extends DollarCardAddressModel>
    implements $DollarCardAddressModelCopyWith<$Res> {
  _$DollarCardAddressModelCopyWithImpl(this._value, this._then);

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
abstract class _$$DollarCardAddressModelImplCopyWith<$Res>
    implements $DollarCardAddressModelCopyWith<$Res> {
  factory _$$DollarCardAddressModelImplCopyWith(
          _$DollarCardAddressModelImpl value,
          $Res Function(_$DollarCardAddressModelImpl) then) =
      __$$DollarCardAddressModelImplCopyWithImpl<$Res>;
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
class __$$DollarCardAddressModelImplCopyWithImpl<$Res>
    extends _$DollarCardAddressModelCopyWithImpl<$Res,
        _$DollarCardAddressModelImpl>
    implements _$$DollarCardAddressModelImplCopyWith<$Res> {
  __$$DollarCardAddressModelImplCopyWithImpl(
      _$DollarCardAddressModelImpl _value,
      $Res Function(_$DollarCardAddressModelImpl) _then)
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
    return _then(_$DollarCardAddressModelImpl(
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
@JsonSerializable()
class _$DollarCardAddressModelImpl extends _DollarCardAddressModel {
  const _$DollarCardAddressModelImpl(
      {required this.street,
      required this.city,
      required this.state,
      required this.postalCode,
      required this.country})
      : super._();

  factory _$DollarCardAddressModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DollarCardAddressModelImplFromJson(json);

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
    return 'DollarCardAddressModel(street: $street, city: $city, state: $state, postalCode: $postalCode, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DollarCardAddressModelImpl &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.country, country) || other.country == country));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, street, city, state, postalCode, country);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DollarCardAddressModelImplCopyWith<_$DollarCardAddressModelImpl>
      get copyWith => __$$DollarCardAddressModelImplCopyWithImpl<
          _$DollarCardAddressModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DollarCardAddressModelImplToJson(
      this,
    );
  }
}

abstract class _DollarCardAddressModel extends DollarCardAddressModel {
  const factory _DollarCardAddressModel(
      {required final String street,
      required final String city,
      required final String state,
      required final String postalCode,
      required final String country}) = _$DollarCardAddressModelImpl;
  const _DollarCardAddressModel._() : super._();

  factory _DollarCardAddressModel.fromJson(Map<String, dynamic> json) =
      _$DollarCardAddressModelImpl.fromJson;

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
  _$$DollarCardAddressModelImplCopyWith<_$DollarCardAddressModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
