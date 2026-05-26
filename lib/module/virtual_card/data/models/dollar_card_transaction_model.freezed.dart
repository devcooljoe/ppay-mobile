// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dollar_card_transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DollarCardTransactionModel _$DollarCardTransactionModelFromJson(
    Map<String, dynamic> json) {
  return _DollarCardTransactionModel.fromJson(json);
}

/// @nodoc
mixin _$DollarCardTransactionModel {
  String get id => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get entry => throw _privateConstructorUsedError;
  DollarCardMerchantModel get merchant => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DollarCardTransactionModelCopyWith<DollarCardTransactionModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DollarCardTransactionModelCopyWith<$Res> {
  factory $DollarCardTransactionModelCopyWith(DollarCardTransactionModel value,
          $Res Function(DollarCardTransactionModel) then) =
      _$DollarCardTransactionModelCopyWithImpl<$Res,
          DollarCardTransactionModel>;
  @useResult
  $Res call(
      {String id,
      double amount,
      String currency,
      String description,
      String status,
      String entry,
      DollarCardMerchantModel merchant,
      String createdAt});

  $DollarCardMerchantModelCopyWith<$Res> get merchant;
}

/// @nodoc
class _$DollarCardTransactionModelCopyWithImpl<$Res,
        $Val extends DollarCardTransactionModel>
    implements $DollarCardTransactionModelCopyWith<$Res> {
  _$DollarCardTransactionModelCopyWithImpl(this._value, this._then);

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
              as DollarCardMerchantModel,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DollarCardMerchantModelCopyWith<$Res> get merchant {
    return $DollarCardMerchantModelCopyWith<$Res>(_value.merchant, (value) {
      return _then(_value.copyWith(merchant: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DollarCardTransactionModelImplCopyWith<$Res>
    implements $DollarCardTransactionModelCopyWith<$Res> {
  factory _$$DollarCardTransactionModelImplCopyWith(
          _$DollarCardTransactionModelImpl value,
          $Res Function(_$DollarCardTransactionModelImpl) then) =
      __$$DollarCardTransactionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      double amount,
      String currency,
      String description,
      String status,
      String entry,
      DollarCardMerchantModel merchant,
      String createdAt});

  @override
  $DollarCardMerchantModelCopyWith<$Res> get merchant;
}

/// @nodoc
class __$$DollarCardTransactionModelImplCopyWithImpl<$Res>
    extends _$DollarCardTransactionModelCopyWithImpl<$Res,
        _$DollarCardTransactionModelImpl>
    implements _$$DollarCardTransactionModelImplCopyWith<$Res> {
  __$$DollarCardTransactionModelImplCopyWithImpl(
      _$DollarCardTransactionModelImpl _value,
      $Res Function(_$DollarCardTransactionModelImpl) _then)
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
    return _then(_$DollarCardTransactionModelImpl(
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
              as DollarCardMerchantModel,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DollarCardTransactionModelImpl extends _DollarCardTransactionModel {
  const _$DollarCardTransactionModelImpl(
      {required this.id,
      required this.amount,
      required this.currency,
      required this.description,
      required this.status,
      required this.entry,
      required this.merchant,
      required this.createdAt})
      : super._();

  factory _$DollarCardTransactionModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DollarCardTransactionModelImplFromJson(json);

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
  final DollarCardMerchantModel merchant;
  @override
  final String createdAt;

  @override
  String toString() {
    return 'DollarCardTransactionModel(id: $id, amount: $amount, currency: $currency, description: $description, status: $status, entry: $entry, merchant: $merchant, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DollarCardTransactionModelImpl &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, amount, currency,
      description, status, entry, merchant, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DollarCardTransactionModelImplCopyWith<_$DollarCardTransactionModelImpl>
      get copyWith => __$$DollarCardTransactionModelImplCopyWithImpl<
          _$DollarCardTransactionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DollarCardTransactionModelImplToJson(
      this,
    );
  }
}

abstract class _DollarCardTransactionModel extends DollarCardTransactionModel {
  const factory _DollarCardTransactionModel(
      {required final String id,
      required final double amount,
      required final String currency,
      required final String description,
      required final String status,
      required final String entry,
      required final DollarCardMerchantModel merchant,
      required final String createdAt}) = _$DollarCardTransactionModelImpl;
  const _DollarCardTransactionModel._() : super._();

  factory _DollarCardTransactionModel.fromJson(Map<String, dynamic> json) =
      _$DollarCardTransactionModelImpl.fromJson;

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
  DollarCardMerchantModel get merchant;
  @override
  String get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$DollarCardTransactionModelImplCopyWith<_$DollarCardTransactionModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DollarCardMerchantModel _$DollarCardMerchantModelFromJson(
    Map<String, dynamic> json) {
  return _DollarCardMerchantModel.fromJson(json);
}

/// @nodoc
mixin _$DollarCardMerchantModel {
  String get name => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DollarCardMerchantModelCopyWith<DollarCardMerchantModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DollarCardMerchantModelCopyWith<$Res> {
  factory $DollarCardMerchantModelCopyWith(DollarCardMerchantModel value,
          $Res Function(DollarCardMerchantModel) then) =
      _$DollarCardMerchantModelCopyWithImpl<$Res, DollarCardMerchantModel>;
  @useResult
  $Res call({String name, String city, String country});
}

/// @nodoc
class _$DollarCardMerchantModelCopyWithImpl<$Res,
        $Val extends DollarCardMerchantModel>
    implements $DollarCardMerchantModelCopyWith<$Res> {
  _$DollarCardMerchantModelCopyWithImpl(this._value, this._then);

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
abstract class _$$DollarCardMerchantModelImplCopyWith<$Res>
    implements $DollarCardMerchantModelCopyWith<$Res> {
  factory _$$DollarCardMerchantModelImplCopyWith(
          _$DollarCardMerchantModelImpl value,
          $Res Function(_$DollarCardMerchantModelImpl) then) =
      __$$DollarCardMerchantModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String city, String country});
}

/// @nodoc
class __$$DollarCardMerchantModelImplCopyWithImpl<$Res>
    extends _$DollarCardMerchantModelCopyWithImpl<$Res,
        _$DollarCardMerchantModelImpl>
    implements _$$DollarCardMerchantModelImplCopyWith<$Res> {
  __$$DollarCardMerchantModelImplCopyWithImpl(
      _$DollarCardMerchantModelImpl _value,
      $Res Function(_$DollarCardMerchantModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? city = null,
    Object? country = null,
  }) {
    return _then(_$DollarCardMerchantModelImpl(
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
@JsonSerializable()
class _$DollarCardMerchantModelImpl extends _DollarCardMerchantModel {
  const _$DollarCardMerchantModelImpl(
      {required this.name, required this.city, required this.country})
      : super._();

  factory _$DollarCardMerchantModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DollarCardMerchantModelImplFromJson(json);

  @override
  final String name;
  @override
  final String city;
  @override
  final String country;

  @override
  String toString() {
    return 'DollarCardMerchantModel(name: $name, city: $city, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DollarCardMerchantModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.country, country) || other.country == country));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, city, country);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DollarCardMerchantModelImplCopyWith<_$DollarCardMerchantModelImpl>
      get copyWith => __$$DollarCardMerchantModelImplCopyWithImpl<
          _$DollarCardMerchantModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DollarCardMerchantModelImplToJson(
      this,
    );
  }
}

abstract class _DollarCardMerchantModel extends DollarCardMerchantModel {
  const factory _DollarCardMerchantModel(
      {required final String name,
      required final String city,
      required final String country}) = _$DollarCardMerchantModelImpl;
  const _DollarCardMerchantModel._() : super._();

  factory _DollarCardMerchantModel.fromJson(Map<String, dynamic> json) =
      _$DollarCardMerchantModelImpl.fromJson;

  @override
  String get name;
  @override
  String get city;
  @override
  String get country;
  @override
  @JsonKey(ignore: true)
  _$$DollarCardMerchantModelImplCopyWith<_$DollarCardMerchantModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
