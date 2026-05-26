// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_kyc_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VerifyKycRequest _$VerifyKycRequestFromJson(Map<String, dynamic> json) {
  return _VerifyKycRequest.fromJson(json);
}

/// @nodoc
mixin _$VerifyKycRequest {
  String get idType => throw _privateConstructorUsedError;
  String get idNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerifyKycRequestCopyWith<VerifyKycRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyKycRequestCopyWith<$Res> {
  factory $VerifyKycRequestCopyWith(
          VerifyKycRequest value, $Res Function(VerifyKycRequest) then) =
      _$VerifyKycRequestCopyWithImpl<$Res, VerifyKycRequest>;
  @useResult
  $Res call({String idType, String idNumber});
}

/// @nodoc
class _$VerifyKycRequestCopyWithImpl<$Res, $Val extends VerifyKycRequest>
    implements $VerifyKycRequestCopyWith<$Res> {
  _$VerifyKycRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idType = null,
    Object? idNumber = null,
  }) {
    return _then(_value.copyWith(
      idType: null == idType
          ? _value.idType
          : idType // ignore: cast_nullable_to_non_nullable
              as String,
      idNumber: null == idNumber
          ? _value.idNumber
          : idNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifyKycRequestImplCopyWith<$Res>
    implements $VerifyKycRequestCopyWith<$Res> {
  factory _$$VerifyKycRequestImplCopyWith(_$VerifyKycRequestImpl value,
          $Res Function(_$VerifyKycRequestImpl) then) =
      __$$VerifyKycRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String idType, String idNumber});
}

/// @nodoc
class __$$VerifyKycRequestImplCopyWithImpl<$Res>
    extends _$VerifyKycRequestCopyWithImpl<$Res, _$VerifyKycRequestImpl>
    implements _$$VerifyKycRequestImplCopyWith<$Res> {
  __$$VerifyKycRequestImplCopyWithImpl(_$VerifyKycRequestImpl _value,
      $Res Function(_$VerifyKycRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idType = null,
    Object? idNumber = null,
  }) {
    return _then(_$VerifyKycRequestImpl(
      idType: null == idType
          ? _value.idType
          : idType // ignore: cast_nullable_to_non_nullable
              as String,
      idNumber: null == idNumber
          ? _value.idNumber
          : idNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifyKycRequestImpl implements _VerifyKycRequest {
  const _$VerifyKycRequestImpl({required this.idType, required this.idNumber});

  factory _$VerifyKycRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifyKycRequestImplFromJson(json);

  @override
  final String idType;
  @override
  final String idNumber;

  @override
  String toString() {
    return 'VerifyKycRequest(idType: $idType, idNumber: $idNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyKycRequestImpl &&
            (identical(other.idType, idType) || other.idType == idType) &&
            (identical(other.idNumber, idNumber) ||
                other.idNumber == idNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idType, idNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyKycRequestImplCopyWith<_$VerifyKycRequestImpl> get copyWith =>
      __$$VerifyKycRequestImplCopyWithImpl<_$VerifyKycRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyKycRequestImplToJson(
      this,
    );
  }
}

abstract class _VerifyKycRequest implements VerifyKycRequest {
  const factory _VerifyKycRequest(
      {required final String idType,
      required final String idNumber}) = _$VerifyKycRequestImpl;

  factory _VerifyKycRequest.fromJson(Map<String, dynamic> json) =
      _$VerifyKycRequestImpl.fromJson;

  @override
  String get idType;
  @override
  String get idNumber;
  @override
  @JsonKey(ignore: true)
  _$$VerifyKycRequestImplCopyWith<_$VerifyKycRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
