// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'smile_id_token_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SmileIdTokenResponse _$SmileIdTokenResponseFromJson(Map<String, dynamic> json) {
  return _SmileIdTokenResponse.fromJson(json);
}

/// @nodoc
mixin _$SmileIdTokenResponse {
  String get token => throw _privateConstructorUsedError;
  String get partnerId => throw _privateConstructorUsedError;
  String get callbackUrl => throw _privateConstructorUsedError;
  bool get useSandbox => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SmileIdTokenResponseCopyWith<SmileIdTokenResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SmileIdTokenResponseCopyWith<$Res> {
  factory $SmileIdTokenResponseCopyWith(SmileIdTokenResponse value,
          $Res Function(SmileIdTokenResponse) then) =
      _$SmileIdTokenResponseCopyWithImpl<$Res, SmileIdTokenResponse>;
  @useResult
  $Res call(
      {String token, String partnerId, String callbackUrl, bool useSandbox});
}

/// @nodoc
class _$SmileIdTokenResponseCopyWithImpl<$Res,
        $Val extends SmileIdTokenResponse>
    implements $SmileIdTokenResponseCopyWith<$Res> {
  _$SmileIdTokenResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? partnerId = null,
    Object? callbackUrl = null,
    Object? useSandbox = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      partnerId: null == partnerId
          ? _value.partnerId
          : partnerId // ignore: cast_nullable_to_non_nullable
              as String,
      callbackUrl: null == callbackUrl
          ? _value.callbackUrl
          : callbackUrl // ignore: cast_nullable_to_non_nullable
              as String,
      useSandbox: null == useSandbox
          ? _value.useSandbox
          : useSandbox // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SmileIdTokenResponseImplCopyWith<$Res>
    implements $SmileIdTokenResponseCopyWith<$Res> {
  factory _$$SmileIdTokenResponseImplCopyWith(_$SmileIdTokenResponseImpl value,
          $Res Function(_$SmileIdTokenResponseImpl) then) =
      __$$SmileIdTokenResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String token, String partnerId, String callbackUrl, bool useSandbox});
}

/// @nodoc
class __$$SmileIdTokenResponseImplCopyWithImpl<$Res>
    extends _$SmileIdTokenResponseCopyWithImpl<$Res, _$SmileIdTokenResponseImpl>
    implements _$$SmileIdTokenResponseImplCopyWith<$Res> {
  __$$SmileIdTokenResponseImplCopyWithImpl(_$SmileIdTokenResponseImpl _value,
      $Res Function(_$SmileIdTokenResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? partnerId = null,
    Object? callbackUrl = null,
    Object? useSandbox = null,
  }) {
    return _then(_$SmileIdTokenResponseImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      partnerId: null == partnerId
          ? _value.partnerId
          : partnerId // ignore: cast_nullable_to_non_nullable
              as String,
      callbackUrl: null == callbackUrl
          ? _value.callbackUrl
          : callbackUrl // ignore: cast_nullable_to_non_nullable
              as String,
      useSandbox: null == useSandbox
          ? _value.useSandbox
          : useSandbox // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SmileIdTokenResponseImpl implements _SmileIdTokenResponse {
  const _$SmileIdTokenResponseImpl(
      {required this.token,
      required this.partnerId,
      required this.callbackUrl,
      required this.useSandbox});

  factory _$SmileIdTokenResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SmileIdTokenResponseImplFromJson(json);

  @override
  final String token;
  @override
  final String partnerId;
  @override
  final String callbackUrl;
  @override
  final bool useSandbox;

  @override
  String toString() {
    return 'SmileIdTokenResponse(token: $token, partnerId: $partnerId, callbackUrl: $callbackUrl, useSandbox: $useSandbox)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SmileIdTokenResponseImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.partnerId, partnerId) ||
                other.partnerId == partnerId) &&
            (identical(other.callbackUrl, callbackUrl) ||
                other.callbackUrl == callbackUrl) &&
            (identical(other.useSandbox, useSandbox) ||
                other.useSandbox == useSandbox));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, token, partnerId, callbackUrl, useSandbox);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SmileIdTokenResponseImplCopyWith<_$SmileIdTokenResponseImpl>
      get copyWith =>
          __$$SmileIdTokenResponseImplCopyWithImpl<_$SmileIdTokenResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SmileIdTokenResponseImplToJson(
      this,
    );
  }
}

abstract class _SmileIdTokenResponse implements SmileIdTokenResponse {
  const factory _SmileIdTokenResponse(
      {required final String token,
      required final String partnerId,
      required final String callbackUrl,
      required final bool useSandbox}) = _$SmileIdTokenResponseImpl;

  factory _SmileIdTokenResponse.fromJson(Map<String, dynamic> json) =
      _$SmileIdTokenResponseImpl.fromJson;

  @override
  String get token;
  @override
  String get partnerId;
  @override
  String get callbackUrl;
  @override
  bool get useSandbox;
  @override
  @JsonKey(ignore: true)
  _$$SmileIdTokenResponseImplCopyWith<_$SmileIdTokenResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
