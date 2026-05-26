// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_bvn_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VerifyBvnRequest _$VerifyBvnRequestFromJson(Map<String, dynamic> json) {
  return _VerifyBvnRequest.fromJson(json);
}

/// @nodoc
mixin _$VerifyBvnRequest {
  String get bvnNumber => throw _privateConstructorUsedError;
  String get dob => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerifyBvnRequestCopyWith<VerifyBvnRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyBvnRequestCopyWith<$Res> {
  factory $VerifyBvnRequestCopyWith(
          VerifyBvnRequest value, $Res Function(VerifyBvnRequest) then) =
      _$VerifyBvnRequestCopyWithImpl<$Res, VerifyBvnRequest>;
  @useResult
  $Res call({String bvnNumber, String dob});
}

/// @nodoc
class _$VerifyBvnRequestCopyWithImpl<$Res, $Val extends VerifyBvnRequest>
    implements $VerifyBvnRequestCopyWith<$Res> {
  _$VerifyBvnRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bvnNumber = null,
    Object? dob = null,
  }) {
    return _then(_value.copyWith(
      bvnNumber: null == bvnNumber
          ? _value.bvnNumber
          : bvnNumber // ignore: cast_nullable_to_non_nullable
              as String,
      dob: null == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifyBvnRequestImplCopyWith<$Res>
    implements $VerifyBvnRequestCopyWith<$Res> {
  factory _$$VerifyBvnRequestImplCopyWith(_$VerifyBvnRequestImpl value,
          $Res Function(_$VerifyBvnRequestImpl) then) =
      __$$VerifyBvnRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String bvnNumber, String dob});
}

/// @nodoc
class __$$VerifyBvnRequestImplCopyWithImpl<$Res>
    extends _$VerifyBvnRequestCopyWithImpl<$Res, _$VerifyBvnRequestImpl>
    implements _$$VerifyBvnRequestImplCopyWith<$Res> {
  __$$VerifyBvnRequestImplCopyWithImpl(_$VerifyBvnRequestImpl _value,
      $Res Function(_$VerifyBvnRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bvnNumber = null,
    Object? dob = null,
  }) {
    return _then(_$VerifyBvnRequestImpl(
      bvnNumber: null == bvnNumber
          ? _value.bvnNumber
          : bvnNumber // ignore: cast_nullable_to_non_nullable
              as String,
      dob: null == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifyBvnRequestImpl implements _VerifyBvnRequest {
  const _$VerifyBvnRequestImpl({required this.bvnNumber, required this.dob});

  factory _$VerifyBvnRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifyBvnRequestImplFromJson(json);

  @override
  final String bvnNumber;
  @override
  final String dob;

  @override
  String toString() {
    return 'VerifyBvnRequest(bvnNumber: $bvnNumber, dob: $dob)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyBvnRequestImpl &&
            (identical(other.bvnNumber, bvnNumber) ||
                other.bvnNumber == bvnNumber) &&
            (identical(other.dob, dob) || other.dob == dob));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, bvnNumber, dob);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyBvnRequestImplCopyWith<_$VerifyBvnRequestImpl> get copyWith =>
      __$$VerifyBvnRequestImplCopyWithImpl<_$VerifyBvnRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyBvnRequestImplToJson(
      this,
    );
  }
}

abstract class _VerifyBvnRequest implements VerifyBvnRequest {
  const factory _VerifyBvnRequest(
      {required final String bvnNumber,
      required final String dob}) = _$VerifyBvnRequestImpl;

  factory _VerifyBvnRequest.fromJson(Map<String, dynamic> json) =
      _$VerifyBvnRequestImpl.fromJson;

  @override
  String get bvnNumber;
  @override
  String get dob;
  @override
  @JsonKey(ignore: true)
  _$$VerifyBvnRequestImplCopyWith<_$VerifyBvnRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
