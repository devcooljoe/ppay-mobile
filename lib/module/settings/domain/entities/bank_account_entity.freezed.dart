// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_account_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BankAccountEntity {
  String get id => throw _privateConstructorUsedError;
  String get accountName => throw _privateConstructorUsedError;
  String get accountNumber => throw _privateConstructorUsedError;
  String get bankName => throw _privateConstructorUsedError;
  String get bankCode => throw _privateConstructorUsedError;
  String get bankLogo => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BankAccountEntityCopyWith<BankAccountEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankAccountEntityCopyWith<$Res> {
  factory $BankAccountEntityCopyWith(
          BankAccountEntity value, $Res Function(BankAccountEntity) then) =
      _$BankAccountEntityCopyWithImpl<$Res, BankAccountEntity>;
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
class _$BankAccountEntityCopyWithImpl<$Res, $Val extends BankAccountEntity>
    implements $BankAccountEntityCopyWith<$Res> {
  _$BankAccountEntityCopyWithImpl(this._value, this._then);

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
abstract class _$$BankAccountEntityImplCopyWith<$Res>
    implements $BankAccountEntityCopyWith<$Res> {
  factory _$$BankAccountEntityImplCopyWith(_$BankAccountEntityImpl value,
          $Res Function(_$BankAccountEntityImpl) then) =
      __$$BankAccountEntityImplCopyWithImpl<$Res>;
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
class __$$BankAccountEntityImplCopyWithImpl<$Res>
    extends _$BankAccountEntityCopyWithImpl<$Res, _$BankAccountEntityImpl>
    implements _$$BankAccountEntityImplCopyWith<$Res> {
  __$$BankAccountEntityImplCopyWithImpl(_$BankAccountEntityImpl _value,
      $Res Function(_$BankAccountEntityImpl) _then)
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
    return _then(_$BankAccountEntityImpl(
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

class _$BankAccountEntityImpl implements _BankAccountEntity {
  const _$BankAccountEntityImpl(
      {required this.id,
      required this.accountName,
      required this.accountNumber,
      required this.bankName,
      required this.bankCode,
      required this.bankLogo,
      required this.date});

  @override
  final String id;
  @override
  final String accountName;
  @override
  final String accountNumber;
  @override
  final String bankName;
  @override
  final String bankCode;
  @override
  final String bankLogo;
  @override
  final String date;

  @override
  String toString() {
    return 'BankAccountEntity(id: $id, accountName: $accountName, accountNumber: $accountNumber, bankName: $bankName, bankCode: $bankCode, bankLogo: $bankLogo, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankAccountEntityImpl &&
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

  @override
  int get hashCode => Object.hash(runtimeType, id, accountName, accountNumber,
      bankName, bankCode, bankLogo, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BankAccountEntityImplCopyWith<_$BankAccountEntityImpl> get copyWith =>
      __$$BankAccountEntityImplCopyWithImpl<_$BankAccountEntityImpl>(
          this, _$identity);
}

abstract class _BankAccountEntity implements BankAccountEntity {
  const factory _BankAccountEntity(
      {required final String id,
      required final String accountName,
      required final String accountNumber,
      required final String bankName,
      required final String bankCode,
      required final String bankLogo,
      required final String date}) = _$BankAccountEntityImpl;

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
  _$$BankAccountEntityImplCopyWith<_$BankAccountEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
