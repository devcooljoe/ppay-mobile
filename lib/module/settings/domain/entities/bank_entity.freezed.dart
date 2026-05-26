// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BankEntity {
  String get bankName => throw _privateConstructorUsedError;
  String get bankCode => throw _privateConstructorUsedError;
  String get bankAvailability => throw _privateConstructorUsedError;
  String get bankStatus => throw _privateConstructorUsedError;
  String get bankLogo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BankEntityCopyWith<BankEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankEntityCopyWith<$Res> {
  factory $BankEntityCopyWith(
          BankEntity value, $Res Function(BankEntity) then) =
      _$BankEntityCopyWithImpl<$Res, BankEntity>;
  @useResult
  $Res call(
      {String bankName,
      String bankCode,
      String bankAvailability,
      String bankStatus,
      String bankLogo});
}

/// @nodoc
class _$BankEntityCopyWithImpl<$Res, $Val extends BankEntity>
    implements $BankEntityCopyWith<$Res> {
  _$BankEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankName = null,
    Object? bankCode = null,
    Object? bankAvailability = null,
    Object? bankStatus = null,
    Object? bankLogo = null,
  }) {
    return _then(_value.copyWith(
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      bankCode: null == bankCode
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String,
      bankAvailability: null == bankAvailability
          ? _value.bankAvailability
          : bankAvailability // ignore: cast_nullable_to_non_nullable
              as String,
      bankStatus: null == bankStatus
          ? _value.bankStatus
          : bankStatus // ignore: cast_nullable_to_non_nullable
              as String,
      bankLogo: null == bankLogo
          ? _value.bankLogo
          : bankLogo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BankEntityImplCopyWith<$Res>
    implements $BankEntityCopyWith<$Res> {
  factory _$$BankEntityImplCopyWith(
          _$BankEntityImpl value, $Res Function(_$BankEntityImpl) then) =
      __$$BankEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String bankName,
      String bankCode,
      String bankAvailability,
      String bankStatus,
      String bankLogo});
}

/// @nodoc
class __$$BankEntityImplCopyWithImpl<$Res>
    extends _$BankEntityCopyWithImpl<$Res, _$BankEntityImpl>
    implements _$$BankEntityImplCopyWith<$Res> {
  __$$BankEntityImplCopyWithImpl(
      _$BankEntityImpl _value, $Res Function(_$BankEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankName = null,
    Object? bankCode = null,
    Object? bankAvailability = null,
    Object? bankStatus = null,
    Object? bankLogo = null,
  }) {
    return _then(_$BankEntityImpl(
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      bankCode: null == bankCode
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String,
      bankAvailability: null == bankAvailability
          ? _value.bankAvailability
          : bankAvailability // ignore: cast_nullable_to_non_nullable
              as String,
      bankStatus: null == bankStatus
          ? _value.bankStatus
          : bankStatus // ignore: cast_nullable_to_non_nullable
              as String,
      bankLogo: null == bankLogo
          ? _value.bankLogo
          : bankLogo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BankEntityImpl implements _BankEntity {
  const _$BankEntityImpl(
      {required this.bankName,
      required this.bankCode,
      required this.bankAvailability,
      required this.bankStatus,
      required this.bankLogo});

  @override
  final String bankName;
  @override
  final String bankCode;
  @override
  final String bankAvailability;
  @override
  final String bankStatus;
  @override
  final String bankLogo;

  @override
  String toString() {
    return 'BankEntity(bankName: $bankName, bankCode: $bankCode, bankAvailability: $bankAvailability, bankStatus: $bankStatus, bankLogo: $bankLogo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankEntityImpl &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.bankCode, bankCode) ||
                other.bankCode == bankCode) &&
            (identical(other.bankAvailability, bankAvailability) ||
                other.bankAvailability == bankAvailability) &&
            (identical(other.bankStatus, bankStatus) ||
                other.bankStatus == bankStatus) &&
            (identical(other.bankLogo, bankLogo) ||
                other.bankLogo == bankLogo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, bankName, bankCode, bankAvailability, bankStatus, bankLogo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BankEntityImplCopyWith<_$BankEntityImpl> get copyWith =>
      __$$BankEntityImplCopyWithImpl<_$BankEntityImpl>(this, _$identity);
}

abstract class _BankEntity implements BankEntity {
  const factory _BankEntity(
      {required final String bankName,
      required final String bankCode,
      required final String bankAvailability,
      required final String bankStatus,
      required final String bankLogo}) = _$BankEntityImpl;

  @override
  String get bankName;
  @override
  String get bankCode;
  @override
  String get bankAvailability;
  @override
  String get bankStatus;
  @override
  String get bankLogo;
  @override
  @JsonKey(ignore: true)
  _$$BankEntityImplCopyWith<_$BankEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
