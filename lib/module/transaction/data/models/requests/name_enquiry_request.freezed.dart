// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'name_enquiry_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NameEnquiryRequest _$NameEnquiryRequestFromJson(Map<String, dynamic> json) {
  return _NameEnquiryRequest.fromJson(json);
}

/// @nodoc
mixin _$NameEnquiryRequest {
  String get accountNumber => throw _privateConstructorUsedError;
  String get bankCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NameEnquiryRequestCopyWith<NameEnquiryRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NameEnquiryRequestCopyWith<$Res> {
  factory $NameEnquiryRequestCopyWith(
          NameEnquiryRequest value, $Res Function(NameEnquiryRequest) then) =
      _$NameEnquiryRequestCopyWithImpl<$Res, NameEnquiryRequest>;
  @useResult
  $Res call({String accountNumber, String bankCode});
}

/// @nodoc
class _$NameEnquiryRequestCopyWithImpl<$Res, $Val extends NameEnquiryRequest>
    implements $NameEnquiryRequestCopyWith<$Res> {
  _$NameEnquiryRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountNumber = null,
    Object? bankCode = null,
  }) {
    return _then(_value.copyWith(
      accountNumber: null == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      bankCode: null == bankCode
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NameEnquiryRequestImplCopyWith<$Res>
    implements $NameEnquiryRequestCopyWith<$Res> {
  factory _$$NameEnquiryRequestImplCopyWith(_$NameEnquiryRequestImpl value,
          $Res Function(_$NameEnquiryRequestImpl) then) =
      __$$NameEnquiryRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String accountNumber, String bankCode});
}

/// @nodoc
class __$$NameEnquiryRequestImplCopyWithImpl<$Res>
    extends _$NameEnquiryRequestCopyWithImpl<$Res, _$NameEnquiryRequestImpl>
    implements _$$NameEnquiryRequestImplCopyWith<$Res> {
  __$$NameEnquiryRequestImplCopyWithImpl(_$NameEnquiryRequestImpl _value,
      $Res Function(_$NameEnquiryRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountNumber = null,
    Object? bankCode = null,
  }) {
    return _then(_$NameEnquiryRequestImpl(
      accountNumber: null == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
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
class _$NameEnquiryRequestImpl implements _NameEnquiryRequest {
  const _$NameEnquiryRequestImpl(
      {required this.accountNumber, required this.bankCode});

  factory _$NameEnquiryRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$NameEnquiryRequestImplFromJson(json);

  @override
  final String accountNumber;
  @override
  final String bankCode;

  @override
  String toString() {
    return 'NameEnquiryRequest(accountNumber: $accountNumber, bankCode: $bankCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NameEnquiryRequestImpl &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.bankCode, bankCode) ||
                other.bankCode == bankCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, accountNumber, bankCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NameEnquiryRequestImplCopyWith<_$NameEnquiryRequestImpl> get copyWith =>
      __$$NameEnquiryRequestImplCopyWithImpl<_$NameEnquiryRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NameEnquiryRequestImplToJson(
      this,
    );
  }
}

abstract class _NameEnquiryRequest implements NameEnquiryRequest {
  const factory _NameEnquiryRequest(
      {required final String accountNumber,
      required final String bankCode}) = _$NameEnquiryRequestImpl;

  factory _NameEnquiryRequest.fromJson(Map<String, dynamic> json) =
      _$NameEnquiryRequestImpl.fromJson;

  @override
  String get accountNumber;
  @override
  String get bankCode;
  @override
  @JsonKey(ignore: true)
  _$$NameEnquiryRequestImplCopyWith<_$NameEnquiryRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
