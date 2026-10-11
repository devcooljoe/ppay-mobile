// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verification_job_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VerificationJobResponse _$VerificationJobResponseFromJson(
    Map<String, dynamic> json) {
  return _VerificationJobResponse.fromJson(json);
}

/// @nodoc
mixin _$VerificationJobResponse {
  String get jobId => throw _privateConstructorUsedError;
  String get smileJobId => throw _privateConstructorUsedError;
  String get smileUserId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerificationJobResponseCopyWith<VerificationJobResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerificationJobResponseCopyWith<$Res> {
  factory $VerificationJobResponseCopyWith(VerificationJobResponse value,
          $Res Function(VerificationJobResponse) then) =
      _$VerificationJobResponseCopyWithImpl<$Res, VerificationJobResponse>;
  @useResult
  $Res call({String jobId, String smileJobId, String smileUserId});
}

/// @nodoc
class _$VerificationJobResponseCopyWithImpl<$Res,
        $Val extends VerificationJobResponse>
    implements $VerificationJobResponseCopyWith<$Res> {
  _$VerificationJobResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobId = null,
    Object? smileJobId = null,
    Object? smileUserId = null,
  }) {
    return _then(_value.copyWith(
      jobId: null == jobId
          ? _value.jobId
          : jobId // ignore: cast_nullable_to_non_nullable
              as String,
      smileJobId: null == smileJobId
          ? _value.smileJobId
          : smileJobId // ignore: cast_nullable_to_non_nullable
              as String,
      smileUserId: null == smileUserId
          ? _value.smileUserId
          : smileUserId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerificationJobResponseImplCopyWith<$Res>
    implements $VerificationJobResponseCopyWith<$Res> {
  factory _$$VerificationJobResponseImplCopyWith(
          _$VerificationJobResponseImpl value,
          $Res Function(_$VerificationJobResponseImpl) then) =
      __$$VerificationJobResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String jobId, String smileJobId, String smileUserId});
}

/// @nodoc
class __$$VerificationJobResponseImplCopyWithImpl<$Res>
    extends _$VerificationJobResponseCopyWithImpl<$Res,
        _$VerificationJobResponseImpl>
    implements _$$VerificationJobResponseImplCopyWith<$Res> {
  __$$VerificationJobResponseImplCopyWithImpl(
      _$VerificationJobResponseImpl _value,
      $Res Function(_$VerificationJobResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobId = null,
    Object? smileJobId = null,
    Object? smileUserId = null,
  }) {
    return _then(_$VerificationJobResponseImpl(
      jobId: null == jobId
          ? _value.jobId
          : jobId // ignore: cast_nullable_to_non_nullable
              as String,
      smileJobId: null == smileJobId
          ? _value.smileJobId
          : smileJobId // ignore: cast_nullable_to_non_nullable
              as String,
      smileUserId: null == smileUserId
          ? _value.smileUserId
          : smileUserId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerificationJobResponseImpl implements _VerificationJobResponse {
  const _$VerificationJobResponseImpl(
      {required this.jobId,
      required this.smileJobId,
      required this.smileUserId});

  factory _$VerificationJobResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerificationJobResponseImplFromJson(json);

  @override
  final String jobId;
  @override
  final String smileJobId;
  @override
  final String smileUserId;

  @override
  String toString() {
    return 'VerificationJobResponse(jobId: $jobId, smileJobId: $smileJobId, smileUserId: $smileUserId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerificationJobResponseImpl &&
            (identical(other.jobId, jobId) || other.jobId == jobId) &&
            (identical(other.smileJobId, smileJobId) ||
                other.smileJobId == smileJobId) &&
            (identical(other.smileUserId, smileUserId) ||
                other.smileUserId == smileUserId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, jobId, smileJobId, smileUserId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerificationJobResponseImplCopyWith<_$VerificationJobResponseImpl>
      get copyWith => __$$VerificationJobResponseImplCopyWithImpl<
          _$VerificationJobResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerificationJobResponseImplToJson(
      this,
    );
  }
}

abstract class _VerificationJobResponse implements VerificationJobResponse {
  const factory _VerificationJobResponse(
      {required final String jobId,
      required final String smileJobId,
      required final String smileUserId}) = _$VerificationJobResponseImpl;

  factory _VerificationJobResponse.fromJson(Map<String, dynamic> json) =
      _$VerificationJobResponseImpl.fromJson;

  @override
  String get jobId;
  @override
  String get smileJobId;
  @override
  String get smileUserId;
  @override
  @JsonKey(ignore: true)
  _$$VerificationJobResponseImplCopyWith<_$VerificationJobResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
