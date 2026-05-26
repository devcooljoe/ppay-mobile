// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_bank_account_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateBankAccountRequest _$UpdateBankAccountRequestFromJson(
    Map<String, dynamic> json) {
  return _UpdateBankAccountRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateBankAccountRequest {
  String get accountName => throw _privateConstructorUsedError;
  String get accountNumber => throw _privateConstructorUsedError;
  String get bankName => throw _privateConstructorUsedError;
  String get bankCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateBankAccountRequestCopyWith<UpdateBankAccountRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateBankAccountRequestCopyWith<$Res> {
  factory $UpdateBankAccountRequestCopyWith(UpdateBankAccountRequest value,
          $Res Function(UpdateBankAccountRequest) then) =
      _$UpdateBankAccountRequestCopyWithImpl<$Res, UpdateBankAccountRequest>;
  @useResult
  $Res call(
      {String accountName,
      String accountNumber,
      String bankName,
      String bankCode});
}

/// @nodoc
class _$UpdateBankAccountRequestCopyWithImpl<$Res,
        $Val extends UpdateBankAccountRequest>
    implements $UpdateBankAccountRequestCopyWith<$Res> {
  _$UpdateBankAccountRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountName = null,
    Object? accountNumber = null,
    Object? bankName = null,
    Object? bankCode = null,
  }) {
    return _then(_value.copyWith(
      accountName: null == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
      accountNumber: null == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      bankCode: null == bankCode
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateBankAccountRequestImplCopyWith<$Res>
    implements $UpdateBankAccountRequestCopyWith<$Res> {
  factory _$$UpdateBankAccountRequestImplCopyWith(
          _$UpdateBankAccountRequestImpl value,
          $Res Function(_$UpdateBankAccountRequestImpl) then) =
      __$$UpdateBankAccountRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String accountName,
      String accountNumber,
      String bankName,
      String bankCode});
}

/// @nodoc
class __$$UpdateBankAccountRequestImplCopyWithImpl<$Res>
    extends _$UpdateBankAccountRequestCopyWithImpl<$Res,
        _$UpdateBankAccountRequestImpl>
    implements _$$UpdateBankAccountRequestImplCopyWith<$Res> {
  __$$UpdateBankAccountRequestImplCopyWithImpl(
      _$UpdateBankAccountRequestImpl _value,
      $Res Function(_$UpdateBankAccountRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountName = null,
    Object? accountNumber = null,
    Object? bankName = null,
    Object? bankCode = null,
  }) {
    return _then(_$UpdateBankAccountRequestImpl(
      accountName: null == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
      accountNumber: null == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      bankCode: null == bankCode
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateBankAccountRequestImpl implements _UpdateBankAccountRequest {
  const _$UpdateBankAccountRequestImpl(
      {required this.accountName,
      required this.accountNumber,
      required this.bankName,
      required this.bankCode});

  factory _$UpdateBankAccountRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateBankAccountRequestImplFromJson(json);

  @override
  final String accountName;
  @override
  final String accountNumber;
  @override
  final String bankName;
  @override
  final String bankCode;

  @override
  String toString() {
    return 'UpdateBankAccountRequest(accountName: $accountName, accountNumber: $accountNumber, bankName: $bankName, bankCode: $bankCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateBankAccountRequestImpl &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.bankCode, bankCode) ||
                other.bankCode == bankCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, accountName, accountNumber, bankName, bankCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateBankAccountRequestImplCopyWith<_$UpdateBankAccountRequestImpl>
      get copyWith => __$$UpdateBankAccountRequestImplCopyWithImpl<
          _$UpdateBankAccountRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateBankAccountRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdateBankAccountRequest implements UpdateBankAccountRequest {
  const factory _UpdateBankAccountRequest(
      {required final String accountName,
      required final String accountNumber,
      required final String bankName,
      required final String bankCode}) = _$UpdateBankAccountRequestImpl;

  factory _UpdateBankAccountRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateBankAccountRequestImpl.fromJson;

  @override
  String get accountName;
  @override
  String get accountNumber;
  @override
  String get bankName;
  @override
  String get bankCode;
  @override
  @JsonKey(ignore: true)
  _$$UpdateBankAccountRequestImplCopyWith<_$UpdateBankAccountRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
