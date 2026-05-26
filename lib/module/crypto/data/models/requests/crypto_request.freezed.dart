// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crypto_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BuyCryptoRequest _$BuyCryptoRequestFromJson(Map<String, dynamic> json) {
  return _BuyCryptoRequest.fromJson(json);
}

/// @nodoc
mixin _$BuyCryptoRequest {
  double get amount => throw _privateConstructorUsedError;
  String get walletAddressId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BuyCryptoRequestCopyWith<BuyCryptoRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BuyCryptoRequestCopyWith<$Res> {
  factory $BuyCryptoRequestCopyWith(
          BuyCryptoRequest value, $Res Function(BuyCryptoRequest) then) =
      _$BuyCryptoRequestCopyWithImpl<$Res, BuyCryptoRequest>;
  @useResult
  $Res call({double amount, String walletAddressId});
}

/// @nodoc
class _$BuyCryptoRequestCopyWithImpl<$Res, $Val extends BuyCryptoRequest>
    implements $BuyCryptoRequestCopyWith<$Res> {
  _$BuyCryptoRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? walletAddressId = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      walletAddressId: null == walletAddressId
          ? _value.walletAddressId
          : walletAddressId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BuyCryptoRequestImplCopyWith<$Res>
    implements $BuyCryptoRequestCopyWith<$Res> {
  factory _$$BuyCryptoRequestImplCopyWith(_$BuyCryptoRequestImpl value,
          $Res Function(_$BuyCryptoRequestImpl) then) =
      __$$BuyCryptoRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double amount, String walletAddressId});
}

/// @nodoc
class __$$BuyCryptoRequestImplCopyWithImpl<$Res>
    extends _$BuyCryptoRequestCopyWithImpl<$Res, _$BuyCryptoRequestImpl>
    implements _$$BuyCryptoRequestImplCopyWith<$Res> {
  __$$BuyCryptoRequestImplCopyWithImpl(_$BuyCryptoRequestImpl _value,
      $Res Function(_$BuyCryptoRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? walletAddressId = null,
  }) {
    return _then(_$BuyCryptoRequestImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      walletAddressId: null == walletAddressId
          ? _value.walletAddressId
          : walletAddressId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BuyCryptoRequestImpl implements _BuyCryptoRequest {
  const _$BuyCryptoRequestImpl(
      {required this.amount, required this.walletAddressId});

  factory _$BuyCryptoRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$BuyCryptoRequestImplFromJson(json);

  @override
  final double amount;
  @override
  final String walletAddressId;

  @override
  String toString() {
    return 'BuyCryptoRequest(amount: $amount, walletAddressId: $walletAddressId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BuyCryptoRequestImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.walletAddressId, walletAddressId) ||
                other.walletAddressId == walletAddressId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, amount, walletAddressId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BuyCryptoRequestImplCopyWith<_$BuyCryptoRequestImpl> get copyWith =>
      __$$BuyCryptoRequestImplCopyWithImpl<_$BuyCryptoRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BuyCryptoRequestImplToJson(
      this,
    );
  }
}

abstract class _BuyCryptoRequest implements BuyCryptoRequest {
  const factory _BuyCryptoRequest(
      {required final double amount,
      required final String walletAddressId}) = _$BuyCryptoRequestImpl;

  factory _BuyCryptoRequest.fromJson(Map<String, dynamic> json) =
      _$BuyCryptoRequestImpl.fromJson;

  @override
  double get amount;
  @override
  String get walletAddressId;
  @override
  @JsonKey(ignore: true)
  _$$BuyCryptoRequestImplCopyWith<_$BuyCryptoRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SellCryptoRequest _$SellCryptoRequestFromJson(Map<String, dynamic> json) {
  return _SellCryptoRequest.fromJson(json);
}

/// @nodoc
mixin _$SellCryptoRequest {
  double get amount => throw _privateConstructorUsedError;
  String get walletAddressId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SellCryptoRequestCopyWith<SellCryptoRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellCryptoRequestCopyWith<$Res> {
  factory $SellCryptoRequestCopyWith(
          SellCryptoRequest value, $Res Function(SellCryptoRequest) then) =
      _$SellCryptoRequestCopyWithImpl<$Res, SellCryptoRequest>;
  @useResult
  $Res call({double amount, String walletAddressId});
}

/// @nodoc
class _$SellCryptoRequestCopyWithImpl<$Res, $Val extends SellCryptoRequest>
    implements $SellCryptoRequestCopyWith<$Res> {
  _$SellCryptoRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? walletAddressId = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      walletAddressId: null == walletAddressId
          ? _value.walletAddressId
          : walletAddressId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SellCryptoRequestImplCopyWith<$Res>
    implements $SellCryptoRequestCopyWith<$Res> {
  factory _$$SellCryptoRequestImplCopyWith(_$SellCryptoRequestImpl value,
          $Res Function(_$SellCryptoRequestImpl) then) =
      __$$SellCryptoRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double amount, String walletAddressId});
}

/// @nodoc
class __$$SellCryptoRequestImplCopyWithImpl<$Res>
    extends _$SellCryptoRequestCopyWithImpl<$Res, _$SellCryptoRequestImpl>
    implements _$$SellCryptoRequestImplCopyWith<$Res> {
  __$$SellCryptoRequestImplCopyWithImpl(_$SellCryptoRequestImpl _value,
      $Res Function(_$SellCryptoRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? walletAddressId = null,
  }) {
    return _then(_$SellCryptoRequestImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      walletAddressId: null == walletAddressId
          ? _value.walletAddressId
          : walletAddressId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SellCryptoRequestImpl implements _SellCryptoRequest {
  const _$SellCryptoRequestImpl(
      {required this.amount, required this.walletAddressId});

  factory _$SellCryptoRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SellCryptoRequestImplFromJson(json);

  @override
  final double amount;
  @override
  final String walletAddressId;

  @override
  String toString() {
    return 'SellCryptoRequest(amount: $amount, walletAddressId: $walletAddressId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SellCryptoRequestImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.walletAddressId, walletAddressId) ||
                other.walletAddressId == walletAddressId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, amount, walletAddressId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SellCryptoRequestImplCopyWith<_$SellCryptoRequestImpl> get copyWith =>
      __$$SellCryptoRequestImplCopyWithImpl<_$SellCryptoRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SellCryptoRequestImplToJson(
      this,
    );
  }
}

abstract class _SellCryptoRequest implements SellCryptoRequest {
  const factory _SellCryptoRequest(
      {required final double amount,
      required final String walletAddressId}) = _$SellCryptoRequestImpl;

  factory _SellCryptoRequest.fromJson(Map<String, dynamic> json) =
      _$SellCryptoRequestImpl.fromJson;

  @override
  double get amount;
  @override
  String get walletAddressId;
  @override
  @JsonKey(ignore: true)
  _$$SellCryptoRequestImplCopyWith<_$SellCryptoRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
