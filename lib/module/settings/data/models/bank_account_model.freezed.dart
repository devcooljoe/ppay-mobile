// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_account_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BankAccountModel _$BankAccountModelFromJson(Map<String, dynamic> json) {
  return _BankAccountModel.fromJson(json);
}

/// @nodoc
mixin _$BankAccountModel {
  String get id => throw _privateConstructorUsedError;
  String get accountName => throw _privateConstructorUsedError;
  String get accountNumber => throw _privateConstructorUsedError;
  String get bankName => throw _privateConstructorUsedError;
  String get bankCode => throw _privateConstructorUsedError;
  String get bankLogo => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BankAccountModelCopyWith<BankAccountModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankAccountModelCopyWith<$Res> {
  factory $BankAccountModelCopyWith(
          BankAccountModel value, $Res Function(BankAccountModel) then) =
      _$BankAccountModelCopyWithImpl<$Res, BankAccountModel>;
  @useResult
  $Res call(
      {String id,
      String accountName,
      String accountNumber,
      String bankName,
      String bankCode,
      String bankLogo,
      String date});
}

/// @nodoc
class _$BankAccountModelCopyWithImpl<$Res, $Val extends BankAccountModel>
    implements $BankAccountModelCopyWith<$Res> {
  _$BankAccountModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accountName = null,
    Object? accountNumber = null,
    Object? bankName = null,
    Object? bankCode = null,
    Object? bankLogo = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      accountName: null == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
      accountNumber: null == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      bankCode: null == bankCode
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String,
      bankLogo: null == bankLogo
          ? _value.bankLogo
          : bankLogo // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BankAccountModelImplCopyWith<$Res>
    implements $BankAccountModelCopyWith<$Res> {
  factory _$$BankAccountModelImplCopyWith(_$BankAccountModelImpl value,
          $Res Function(_$BankAccountModelImpl) then) =
      __$$BankAccountModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String accountName,
      String accountNumber,
      String bankName,
      String bankCode,
      String bankLogo,
      String date});
}

/// @nodoc
class __$$BankAccountModelImplCopyWithImpl<$Res>
    extends _$BankAccountModelCopyWithImpl<$Res, _$BankAccountModelImpl>
    implements _$$BankAccountModelImplCopyWith<$Res> {
  __$$BankAccountModelImplCopyWithImpl(_$BankAccountModelImpl _value,
      $Res Function(_$BankAccountModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accountName = null,
    Object? accountNumber = null,
    Object? bankName = null,
    Object? bankCode = null,
    Object? bankLogo = null,
    Object? date = null,
  }) {
    return _then(_$BankAccountModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      accountName: null == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
      accountNumber: null == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      bankCode: null == bankCode
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String,
      bankLogo: null == bankLogo
          ? _value.bankLogo
          : bankLogo // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BankAccountModelImpl extends _BankAccountModel {
  const _$BankAccountModelImpl(
      {this.id = '',
      this.accountName = '',
      this.accountNumber = '',
      this.bankName = '',
      this.bankCode = '',
      this.bankLogo = '',
      this.date = ''})
      : super._();

  factory _$BankAccountModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BankAccountModelImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String accountName;
  @override
  @JsonKey()
  final String accountNumber;
  @override
  @JsonKey()
  final String bankName;
  @override
  @JsonKey()
  final String bankCode;
  @override
  @JsonKey()
  final String bankLogo;
  @override
  @JsonKey()
  final String date;

  @override
  String toString() {
    return 'BankAccountModel(id: $id, accountName: $accountName, accountNumber: $accountNumber, bankName: $bankName, bankCode: $bankCode, bankLogo: $bankLogo, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankAccountModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.bankCode, bankCode) ||
                other.bankCode == bankCode) &&
            (identical(other.bankLogo, bankLogo) ||
                other.bankLogo == bankLogo) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, accountName, accountNumber,
      bankName, bankCode, bankLogo, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BankAccountModelImplCopyWith<_$BankAccountModelImpl> get copyWith =>
      __$$BankAccountModelImplCopyWithImpl<_$BankAccountModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BankAccountModelImplToJson(
      this,
    );
  }
}

abstract class _BankAccountModel extends BankAccountModel {
  const factory _BankAccountModel(
      {final String id,
      final String accountName,
      final String accountNumber,
      final String bankName,
      final String bankCode,
      final String bankLogo,
      final String date}) = _$BankAccountModelImpl;
  const _BankAccountModel._() : super._();

  factory _BankAccountModel.fromJson(Map<String, dynamic> json) =
      _$BankAccountModelImpl.fromJson;

  @override
  String get id;
  @override
  String get accountName;
  @override
  String get accountNumber;
  @override
  String get bankName;
  @override
  String get bankCode;
  @override
  String get bankLogo;
  @override
  String get date;
  @override
  @JsonKey(ignore: true)
  _$$BankAccountModelImplCopyWith<_$BankAccountModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
