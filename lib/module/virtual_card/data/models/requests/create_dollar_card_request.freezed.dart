// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_dollar_card_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateDollarCardRequest _$CreateDollarCardRequestFromJson(
    Map<String, dynamic> json) {
  return _CreateDollarCardRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateDollarCardRequest {
  String get street => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  String get postalCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateDollarCardRequestCopyWith<CreateDollarCardRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateDollarCardRequestCopyWith<$Res> {
  factory $CreateDollarCardRequestCopyWith(CreateDollarCardRequest value,
          $Res Function(CreateDollarCardRequest) then) =
      _$CreateDollarCardRequestCopyWithImpl<$Res, CreateDollarCardRequest>;
  @useResult
  $Res call(
      {String street,
      String city,
      String state,
      String country,
      String postalCode});
}

/// @nodoc
class _$CreateDollarCardRequestCopyWithImpl<$Res,
        $Val extends CreateDollarCardRequest>
    implements $CreateDollarCardRequestCopyWith<$Res> {
  _$CreateDollarCardRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? street = null,
    Object? city = null,
    Object? state = null,
    Object? country = null,
    Object? postalCode = null,
  }) {
    return _then(_value.copyWith(
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateDollarCardRequestImplCopyWith<$Res>
    implements $CreateDollarCardRequestCopyWith<$Res> {
  factory _$$CreateDollarCardRequestImplCopyWith(
          _$CreateDollarCardRequestImpl value,
          $Res Function(_$CreateDollarCardRequestImpl) then) =
      __$$CreateDollarCardRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String street,
      String city,
      String state,
      String country,
      String postalCode});
}

/// @nodoc
class __$$CreateDollarCardRequestImplCopyWithImpl<$Res>
    extends _$CreateDollarCardRequestCopyWithImpl<$Res,
        _$CreateDollarCardRequestImpl>
    implements _$$CreateDollarCardRequestImplCopyWith<$Res> {
  __$$CreateDollarCardRequestImplCopyWithImpl(
      _$CreateDollarCardRequestImpl _value,
      $Res Function(_$CreateDollarCardRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? street = null,
    Object? city = null,
    Object? state = null,
    Object? country = null,
    Object? postalCode = null,
  }) {
    return _then(_$CreateDollarCardRequestImpl(
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateDollarCardRequestImpl implements _CreateDollarCardRequest {
  const _$CreateDollarCardRequestImpl(
      {required this.street,
      required this.city,
      required this.state,
      required this.country,
      required this.postalCode});

  factory _$CreateDollarCardRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateDollarCardRequestImplFromJson(json);

  @override
  final String street;
  @override
  final String city;
  @override
  final String state;
  @override
  final String country;
  @override
  final String postalCode;

  @override
  String toString() {
    return 'CreateDollarCardRequest(street: $street, city: $city, state: $state, country: $country, postalCode: $postalCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateDollarCardRequestImpl &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, street, city, state, country, postalCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateDollarCardRequestImplCopyWith<_$CreateDollarCardRequestImpl>
      get copyWith => __$$CreateDollarCardRequestImplCopyWithImpl<
          _$CreateDollarCardRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateDollarCardRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateDollarCardRequest implements CreateDollarCardRequest {
  const factory _CreateDollarCardRequest(
      {required final String street,
      required final String city,
      required final String state,
      required final String country,
      required final String postalCode}) = _$CreateDollarCardRequestImpl;

  factory _CreateDollarCardRequest.fromJson(Map<String, dynamic> json) =
      _$CreateDollarCardRequestImpl.fromJson;

  @override
  String get street;
  @override
  String get city;
  @override
  String get state;
  @override
  String get country;
  @override
  String get postalCode;
  @override
  @JsonKey(ignore: true)
  _$$CreateDollarCardRequestImplCopyWith<_$CreateDollarCardRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
