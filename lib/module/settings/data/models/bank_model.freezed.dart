// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BankModel _$BankModelFromJson(Map<String, dynamic> json) {
  return _BankModel.fromJson(json);
}

/// @nodoc
mixin _$BankModel {
  String get bankName => throw _privateConstructorUsedError;
  String get bankCode => throw _privateConstructorUsedError;
  String get bankAvailability => throw _privateConstructorUsedError;
  String get bankStatus => throw _privateConstructorUsedError;
  String get bankLogo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BankModelCopyWith<BankModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankModelCopyWith<$Res> {
  factory $BankModelCopyWith(BankModel value, $Res Function(BankModel) then) =
      _$BankModelCopyWithImpl<$Res, BankModel>;
  @useResult
  $Res call(
      {String bankName,
      String bankCode,
      String bankAvailability,
      String bankStatus,
      String bankLogo});
}

/// @nodoc
class _$BankModelCopyWithImpl<$Res, $Val extends BankModel>
    implements $BankModelCopyWith<$Res> {
  _$BankModelCopyWithImpl(this._value, this._then);

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
abstract class _$$BankModelImplCopyWith<$Res>
    implements $BankModelCopyWith<$Res> {
  factory _$$BankModelImplCopyWith(
          _$BankModelImpl value, $Res Function(_$BankModelImpl) then) =
      __$$BankModelImplCopyWithImpl<$Res>;
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
class __$$BankModelImplCopyWithImpl<$Res>
    extends _$BankModelCopyWithImpl<$Res, _$BankModelImpl>
    implements _$$BankModelImplCopyWith<$Res> {
  __$$BankModelImplCopyWithImpl(
      _$BankModelImpl _value, $Res Function(_$BankModelImpl) _then)
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
    return _then(_$BankModelImpl(
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
@JsonSerializable()
class _$BankModelImpl extends _BankModel {
  const _$BankModelImpl(
      {this.bankName = '',
      this.bankCode = '',
      this.bankAvailability = '',
      this.bankStatus = '',
      this.bankLogo = ''})
      : super._();

  factory _$BankModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BankModelImplFromJson(json);

  @override
  @JsonKey()
  final String bankName;
  @override
  @JsonKey()
  final String bankCode;
  @override
  @JsonKey()
  final String bankAvailability;
  @override
  @JsonKey()
  final String bankStatus;
  @override
  @JsonKey()
  final String bankLogo;

  @override
  String toString() {
    return 'BankModel(bankName: $bankName, bankCode: $bankCode, bankAvailability: $bankAvailability, bankStatus: $bankStatus, bankLogo: $bankLogo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankModelImpl &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, bankName, bankCode, bankAvailability, bankStatus, bankLogo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BankModelImplCopyWith<_$BankModelImpl> get copyWith =>
      __$$BankModelImplCopyWithImpl<_$BankModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BankModelImplToJson(
      this,
    );
  }
}

abstract class _BankModel extends BankModel {
  const factory _BankModel(
      {final String bankName,
      final String bankCode,
      final String bankAvailability,
      final String bankStatus,
      final String bankLogo}) = _$BankModelImpl;
  const _BankModel._() : super._();

  factory _BankModel.fromJson(Map<String, dynamic> json) =
      _$BankModelImpl.fromJson;

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
  _$$BankModelImplCopyWith<_$BankModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
