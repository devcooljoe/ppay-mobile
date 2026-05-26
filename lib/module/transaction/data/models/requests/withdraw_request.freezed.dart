// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'withdraw_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WithdrawRequest _$WithdrawRequestFromJson(Map<String, dynamic> json) {
  return _WithdrawRequest.fromJson(json);
}

/// @nodoc
mixin _$WithdrawRequest {
  double get amount => throw _privateConstructorUsedError;
  String get accountNumber => throw _privateConstructorUsedError;
  String get accountName => throw _privateConstructorUsedError;
  String get bankCode => throw _privateConstructorUsedError;
  String get bankName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WithdrawRequestCopyWith<WithdrawRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WithdrawRequestCopyWith<$Res> {
  factory $WithdrawRequestCopyWith(
          WithdrawRequest value, $Res Function(WithdrawRequest) then) =
      _$WithdrawRequestCopyWithImpl<$Res, WithdrawRequest>;
  @useResult
  $Res call(
      {double amount,
      String accountNumber,
      String accountName,
      String bankCode,
      String bankName});
}

/// @nodoc
class _$WithdrawRequestCopyWithImpl<$Res, $Val extends WithdrawRequest>
    implements $WithdrawRequestCopyWith<$Res> {
  _$WithdrawRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? accountNumber = null,
    Object? accountName = null,
    Object? bankCode = null,
    Object? bankName = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      accountNumber: null == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      accountName: null == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
      bankCode: null == bankCode
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WithdrawRequestImplCopyWith<$Res>
    implements $WithdrawRequestCopyWith<$Res> {
  factory _$$WithdrawRequestImplCopyWith(_$WithdrawRequestImpl value,
          $Res Function(_$WithdrawRequestImpl) then) =
      __$$WithdrawRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double amount,
      String accountNumber,
      String accountName,
      String bankCode,
      String bankName});
}

/// @nodoc
class __$$WithdrawRequestImplCopyWithImpl<$Res>
    extends _$WithdrawRequestCopyWithImpl<$Res, _$WithdrawRequestImpl>
    implements _$$WithdrawRequestImplCopyWith<$Res> {
  __$$WithdrawRequestImplCopyWithImpl(
      _$WithdrawRequestImpl _value, $Res Function(_$WithdrawRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? accountNumber = null,
    Object? accountName = null,
    Object? bankCode = null,
    Object? bankName = null,
  }) {
    return _then(_$WithdrawRequestImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      accountNumber: null == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      accountName: null == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
      bankCode: null == bankCode
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WithdrawRequestImpl implements _WithdrawRequest {
  const _$WithdrawRequestImpl(
      {required this.amount,
      required this.accountNumber,
      required this.accountName,
      required this.bankCode,
      required this.bankName});

  factory _$WithdrawRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$WithdrawRequestImplFromJson(json);

  @override
  final double amount;
  @override
  final String accountNumber;
  @override
  final String accountName;
  @override
  final String bankCode;
  @override
  final String bankName;

  @override
  String toString() {
    return 'WithdrawRequest(amount: $amount, accountNumber: $accountNumber, accountName: $accountName, bankCode: $bankCode, bankName: $bankName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WithdrawRequestImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName) &&
            (identical(other.bankCode, bankCode) ||
                other.bankCode == bankCode) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, amount, accountNumber, accountName, bankCode, bankName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WithdrawRequestImplCopyWith<_$WithdrawRequestImpl> get copyWith =>
      __$$WithdrawRequestImplCopyWithImpl<_$WithdrawRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WithdrawRequestImplToJson(
      this,
    );
  }
}

abstract class _WithdrawRequest implements WithdrawRequest {
  const factory _WithdrawRequest(
      {required final double amount,
      required final String accountNumber,
      required final String accountName,
      required final String bankCode,
      required final String bankName}) = _$WithdrawRequestImpl;

  factory _WithdrawRequest.fromJson(Map<String, dynamic> json) =
      _$WithdrawRequestImpl.fromJson;

  @override
  double get amount;
  @override
  String get accountNumber;
  @override
  String get accountName;
  @override
  String get bankCode;
  @override
  String get bankName;
  @override
  @JsonKey(ignore: true)
  _$$WithdrawRequestImplCopyWith<_$WithdrawRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
