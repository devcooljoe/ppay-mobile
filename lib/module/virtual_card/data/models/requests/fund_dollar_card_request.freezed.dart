// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fund_dollar_card_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FundDollarCardRequest _$FundDollarCardRequestFromJson(
    Map<String, dynamic> json) {
  return _FundDollarCardRequest.fromJson(json);
}

/// @nodoc
mixin _$FundDollarCardRequest {
  double get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FundDollarCardRequestCopyWith<FundDollarCardRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FundDollarCardRequestCopyWith<$Res> {
  factory $FundDollarCardRequestCopyWith(FundDollarCardRequest value,
          $Res Function(FundDollarCardRequest) then) =
      _$FundDollarCardRequestCopyWithImpl<$Res, FundDollarCardRequest>;
  @useResult
  $Res call({double amount});
}

/// @nodoc
class _$FundDollarCardRequestCopyWithImpl<$Res,
        $Val extends FundDollarCardRequest>
    implements $FundDollarCardRequestCopyWith<$Res> {
  _$FundDollarCardRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FundDollarCardRequestImplCopyWith<$Res>
    implements $FundDollarCardRequestCopyWith<$Res> {
  factory _$$FundDollarCardRequestImplCopyWith(
          _$FundDollarCardRequestImpl value,
          $Res Function(_$FundDollarCardRequestImpl) then) =
      __$$FundDollarCardRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double amount});
}

/// @nodoc
class __$$FundDollarCardRequestImplCopyWithImpl<$Res>
    extends _$FundDollarCardRequestCopyWithImpl<$Res,
        _$FundDollarCardRequestImpl>
    implements _$$FundDollarCardRequestImplCopyWith<$Res> {
  __$$FundDollarCardRequestImplCopyWithImpl(_$FundDollarCardRequestImpl _value,
      $Res Function(_$FundDollarCardRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
  }) {
    return _then(_$FundDollarCardRequestImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FundDollarCardRequestImpl implements _FundDollarCardRequest {
  const _$FundDollarCardRequestImpl({required this.amount});

  factory _$FundDollarCardRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$FundDollarCardRequestImplFromJson(json);

  @override
  final double amount;

  @override
  String toString() {
    return 'FundDollarCardRequest(amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FundDollarCardRequestImpl &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FundDollarCardRequestImplCopyWith<_$FundDollarCardRequestImpl>
      get copyWith => __$$FundDollarCardRequestImplCopyWithImpl<
          _$FundDollarCardRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FundDollarCardRequestImplToJson(
      this,
    );
  }
}

abstract class _FundDollarCardRequest implements FundDollarCardRequest {
  const factory _FundDollarCardRequest({required final double amount}) =
      _$FundDollarCardRequestImpl;

  factory _FundDollarCardRequest.fromJson(Map<String, dynamic> json) =
      _$FundDollarCardRequestImpl.fromJson;

  @override
  double get amount;
  @override
  @JsonKey(ignore: true)
  _$$FundDollarCardRequestImplCopyWith<_$FundDollarCardRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
