// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_verification_job_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateVerificationJobRequest _$CreateVerificationJobRequestFromJson(
    Map<String, dynamic> json) {
  return _CreateVerificationJobRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateVerificationJobRequest {
  String get jobType => throw _privateConstructorUsedError;
  String get idType => throw _privateConstructorUsedError;
  String get idNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateVerificationJobRequestCopyWith<CreateVerificationJobRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateVerificationJobRequestCopyWith<$Res> {
  factory $CreateVerificationJobRequestCopyWith(
          CreateVerificationJobRequest value,
          $Res Function(CreateVerificationJobRequest) then) =
      _$CreateVerificationJobRequestCopyWithImpl<$Res,
          CreateVerificationJobRequest>;
  @useResult
  $Res call({String jobType, String idType, String idNumber});
}

/// @nodoc
class _$CreateVerificationJobRequestCopyWithImpl<$Res,
        $Val extends CreateVerificationJobRequest>
    implements $CreateVerificationJobRequestCopyWith<$Res> {
  _$CreateVerificationJobRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobType = null,
    Object? idType = null,
    Object? idNumber = null,
  }) {
    return _then(_value.copyWith(
      jobType: null == jobType
          ? _value.jobType
          : jobType // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$CreateVerificationJobRequestImplCopyWith<$Res>
    implements $CreateVerificationJobRequestCopyWith<$Res> {
  factory _$$CreateVerificationJobRequestImplCopyWith(
          _$CreateVerificationJobRequestImpl value,
          $Res Function(_$CreateVerificationJobRequestImpl) then) =
      __$$CreateVerificationJobRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String jobType, String idType, String idNumber});
}

/// @nodoc
class __$$CreateVerificationJobRequestImplCopyWithImpl<$Res>
    extends _$CreateVerificationJobRequestCopyWithImpl<$Res,
        _$CreateVerificationJobRequestImpl>
    implements _$$CreateVerificationJobRequestImplCopyWith<$Res> {
  __$$CreateVerificationJobRequestImplCopyWithImpl(
      _$CreateVerificationJobRequestImpl _value,
      $Res Function(_$CreateVerificationJobRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobType = null,
    Object? idType = null,
    Object? idNumber = null,
  }) {
    return _then(_$CreateVerificationJobRequestImpl(
      jobType: null == jobType
          ? _value.jobType
          : jobType // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$CreateVerificationJobRequestImpl
    implements _CreateVerificationJobRequest {
  const _$CreateVerificationJobRequestImpl(
      {required this.jobType, required this.idType, required this.idNumber});

  factory _$CreateVerificationJobRequestImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CreateVerificationJobRequestImplFromJson(json);

  @override
  final String jobType;
  @override
  final String idType;
  @override
  final String idNumber;

  @override
  String toString() {
    return 'CreateVerificationJobRequest(jobType: $jobType, idType: $idType, idNumber: $idNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateVerificationJobRequestImpl &&
            (identical(other.jobType, jobType) || other.jobType == jobType) &&
            (identical(other.idType, idType) || other.idType == idType) &&
            (identical(other.idNumber, idNumber) ||
                other.idNumber == idNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, jobType, idType, idNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateVerificationJobRequestImplCopyWith<
          _$CreateVerificationJobRequestImpl>
      get copyWith => __$$CreateVerificationJobRequestImplCopyWithImpl<
          _$CreateVerificationJobRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateVerificationJobRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateVerificationJobRequest
    implements CreateVerificationJobRequest {
  const factory _CreateVerificationJobRequest(
      {required final String jobType,
      required final String idType,
      required final String idNumber}) = _$CreateVerificationJobRequestImpl;

  factory _CreateVerificationJobRequest.fromJson(Map<String, dynamic> json) =
      _$CreateVerificationJobRequestImpl.fromJson;

  @override
  String get jobType;
  @override
  String get idType;
  @override
  String get idNumber;
  @override
  @JsonKey(ignore: true)
  _$$CreateVerificationJobRequestImplCopyWith<
          _$CreateVerificationJobRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
