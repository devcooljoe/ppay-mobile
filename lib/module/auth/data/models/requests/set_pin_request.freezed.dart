// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'set_pin_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SetPinRequest _$SetPinRequestFromJson(Map<String, dynamic> json) {
  return _SetPinRequest.fromJson(json);
}

/// @nodoc
mixin _$SetPinRequest {
  String get pin => throw _privateConstructorUsedError;
  String get confirmPin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SetPinRequestCopyWith<SetPinRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetPinRequestCopyWith<$Res> {
  factory $SetPinRequestCopyWith(
          SetPinRequest value, $Res Function(SetPinRequest) then) =
      _$SetPinRequestCopyWithImpl<$Res, SetPinRequest>;
  @useResult
  $Res call({String pin, String confirmPin});
}

/// @nodoc
class _$SetPinRequestCopyWithImpl<$Res, $Val extends SetPinRequest>
    implements $SetPinRequestCopyWith<$Res> {
  _$SetPinRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pin = null,
    Object? confirmPin = null,
  }) {
    return _then(_value.copyWith(
      pin: null == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPin: null == confirmPin
          ? _value.confirmPin
          : confirmPin // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SetPinRequestImplCopyWith<$Res>
    implements $SetPinRequestCopyWith<$Res> {
  factory _$$SetPinRequestImplCopyWith(
          _$SetPinRequestImpl value, $Res Function(_$SetPinRequestImpl) then) =
      __$$SetPinRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String pin, String confirmPin});
}

/// @nodoc
class __$$SetPinRequestImplCopyWithImpl<$Res>
    extends _$SetPinRequestCopyWithImpl<$Res, _$SetPinRequestImpl>
    implements _$$SetPinRequestImplCopyWith<$Res> {
  __$$SetPinRequestImplCopyWithImpl(
      _$SetPinRequestImpl _value, $Res Function(_$SetPinRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pin = null,
    Object? confirmPin = null,
  }) {
    return _then(_$SetPinRequestImpl(
      pin: null == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPin: null == confirmPin
          ? _value.confirmPin
          : confirmPin // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SetPinRequestImpl implements _SetPinRequest {
  const _$SetPinRequestImpl({required this.pin, required this.confirmPin});

  factory _$SetPinRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SetPinRequestImplFromJson(json);

  @override
  final String pin;
  @override
  final String confirmPin;

  @override
  String toString() {
    return 'SetPinRequest(pin: $pin, confirmPin: $confirmPin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetPinRequestImpl &&
            (identical(other.pin, pin) || other.pin == pin) &&
            (identical(other.confirmPin, confirmPin) ||
                other.confirmPin == confirmPin));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pin, confirmPin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetPinRequestImplCopyWith<_$SetPinRequestImpl> get copyWith =>
      __$$SetPinRequestImplCopyWithImpl<_$SetPinRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SetPinRequestImplToJson(
      this,
    );
  }
}

abstract class _SetPinRequest implements SetPinRequest {
  const factory _SetPinRequest(
      {required final String pin,
      required final String confirmPin}) = _$SetPinRequestImpl;

  factory _SetPinRequest.fromJson(Map<String, dynamic> json) =
      _$SetPinRequestImpl.fromJson;

  @override
  String get pin;
  @override
  String get confirmPin;
  @override
  @JsonKey(ignore: true)
  _$$SetPinRequestImplCopyWith<_$SetPinRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
