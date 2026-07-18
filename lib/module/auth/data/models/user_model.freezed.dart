// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get fullName => throw _privateConstructorUsedError;
  String get emailAddress => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String? get picture => throw _privateConstructorUsedError;
  String? get dob => throw _privateConstructorUsedError;
  String? get referralCode => throw _privateConstructorUsedError;
  bool get isEmailVerified => throw _privateConstructorUsedError;
  bool get isPhoneNumberVerified => throw _privateConstructorUsedError;
  bool get isBvnVerified => throw _privateConstructorUsedError;
  bool get isBvnSubmitted => throw _privateConstructorUsedError;
  bool get isKycVerified => throw _privateConstructorUsedError;
  bool get isKycSubmitted => throw _privateConstructorUsedError;
  bool get isPinSet => throw _privateConstructorUsedError;
  bool get hasCustomer => throw _privateConstructorUsedError;
  int get tier => throw _privateConstructorUsedError;
  String? get dollarCardCustomerId => throw _privateConstructorUsedError;
  double get conversionRate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String fullName,
      String emailAddress,
      String phoneNumber,
      String? picture,
      String? dob,
      String? referralCode,
      bool isEmailVerified,
      bool isPhoneNumberVerified,
      bool isBvnVerified,
      bool isBvnSubmitted,
      bool isKycVerified,
      bool isKycSubmitted,
      bool isPinSet,
      bool hasCustomer,
      int tier,
      String? dollarCardCustomerId,
      double conversionRate});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = null,
    Object? emailAddress = null,
    Object? phoneNumber = null,
    Object? picture = freezed,
    Object? dob = freezed,
    Object? referralCode = freezed,
    Object? isEmailVerified = null,
    Object? isPhoneNumberVerified = null,
    Object? isBvnVerified = null,
    Object? isBvnSubmitted = null,
    Object? isKycVerified = null,
    Object? isKycSubmitted = null,
    Object? isPinSet = null,
    Object? hasCustomer = null,
    Object? tier = null,
    Object? dollarCardCustomerId = freezed,
    Object? conversionRate = null,
  }) {
    return _then(_value.copyWith(
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      picture: freezed == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      referralCode: freezed == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String?,
      isEmailVerified: null == isEmailVerified
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isPhoneNumberVerified: null == isPhoneNumberVerified
          ? _value.isPhoneNumberVerified
          : isPhoneNumberVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isBvnVerified: null == isBvnVerified
          ? _value.isBvnVerified
          : isBvnVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isBvnSubmitted: null == isBvnSubmitted
          ? _value.isBvnSubmitted
          : isBvnSubmitted // ignore: cast_nullable_to_non_nullable
              as bool,
      isKycVerified: null == isKycVerified
          ? _value.isKycVerified
          : isKycVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isKycSubmitted: null == isKycSubmitted
          ? _value.isKycSubmitted
          : isKycSubmitted // ignore: cast_nullable_to_non_nullable
              as bool,
      isPinSet: null == isPinSet
          ? _value.isPinSet
          : isPinSet // ignore: cast_nullable_to_non_nullable
              as bool,
      hasCustomer: null == hasCustomer
          ? _value.hasCustomer
          : hasCustomer // ignore: cast_nullable_to_non_nullable
              as bool,
      tier: null == tier
          ? _value.tier
          : tier // ignore: cast_nullable_to_non_nullable
              as int,
      dollarCardCustomerId: freezed == dollarCardCustomerId
          ? _value.dollarCardCustomerId
          : dollarCardCustomerId // ignore: cast_nullable_to_non_nullable
              as String?,
      conversionRate: null == conversionRate
          ? _value.conversionRate
          : conversionRate // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String fullName,
      String emailAddress,
      String phoneNumber,
      String? picture,
      String? dob,
      String? referralCode,
      bool isEmailVerified,
      bool isPhoneNumberVerified,
      bool isBvnVerified,
      bool isBvnSubmitted,
      bool isKycVerified,
      bool isKycSubmitted,
      bool isPinSet,
      bool hasCustomer,
      int tier,
      String? dollarCardCustomerId,
      double conversionRate});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = null,
    Object? emailAddress = null,
    Object? phoneNumber = null,
    Object? picture = freezed,
    Object? dob = freezed,
    Object? referralCode = freezed,
    Object? isEmailVerified = null,
    Object? isPhoneNumberVerified = null,
    Object? isBvnVerified = null,
    Object? isBvnSubmitted = null,
    Object? isKycVerified = null,
    Object? isKycSubmitted = null,
    Object? isPinSet = null,
    Object? hasCustomer = null,
    Object? tier = null,
    Object? dollarCardCustomerId = freezed,
    Object? conversionRate = null,
  }) {
    return _then(_$UserModelImpl(
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      picture: freezed == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      referralCode: freezed == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String?,
      isEmailVerified: null == isEmailVerified
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isPhoneNumberVerified: null == isPhoneNumberVerified
          ? _value.isPhoneNumberVerified
          : isPhoneNumberVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isBvnVerified: null == isBvnVerified
          ? _value.isBvnVerified
          : isBvnVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isBvnSubmitted: null == isBvnSubmitted
          ? _value.isBvnSubmitted
          : isBvnSubmitted // ignore: cast_nullable_to_non_nullable
              as bool,
      isKycVerified: null == isKycVerified
          ? _value.isKycVerified
          : isKycVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isKycSubmitted: null == isKycSubmitted
          ? _value.isKycSubmitted
          : isKycSubmitted // ignore: cast_nullable_to_non_nullable
              as bool,
      isPinSet: null == isPinSet
          ? _value.isPinSet
          : isPinSet // ignore: cast_nullable_to_non_nullable
              as bool,
      hasCustomer: null == hasCustomer
          ? _value.hasCustomer
          : hasCustomer // ignore: cast_nullable_to_non_nullable
              as bool,
      tier: null == tier
          ? _value.tier
          : tier // ignore: cast_nullable_to_non_nullable
              as int,
      dollarCardCustomerId: freezed == dollarCardCustomerId
          ? _value.dollarCardCustomerId
          : dollarCardCustomerId // ignore: cast_nullable_to_non_nullable
              as String?,
      conversionRate: null == conversionRate
          ? _value.conversionRate
          : conversionRate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl extends _UserModel {
  const _$UserModelImpl(
      {required this.fullName,
      required this.emailAddress,
      required this.phoneNumber,
      this.picture,
      this.dob,
      this.referralCode,
      required this.isEmailVerified,
      required this.isPhoneNumberVerified,
      required this.isBvnVerified,
      required this.isBvnSubmitted,
      required this.isKycVerified,
      required this.isKycSubmitted,
      required this.isPinSet,
      required this.hasCustomer,
      required this.tier,
      this.dollarCardCustomerId,
      this.conversionRate = 0})
      : super._();

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final String fullName;
  @override
  final String emailAddress;
  @override
  final String phoneNumber;
  @override
  final String? picture;
  @override
  final String? dob;
  @override
  final String? referralCode;
  @override
  final bool isEmailVerified;
  @override
  final bool isPhoneNumberVerified;
  @override
  final bool isBvnVerified;
  @override
  final bool isBvnSubmitted;
  @override
  final bool isKycVerified;
  @override
  final bool isKycSubmitted;
  @override
  final bool isPinSet;
  @override
  final bool hasCustomer;
  @override
  final int tier;
  @override
  final String? dollarCardCustomerId;
  @override
  @JsonKey()
  final double conversionRate;

  @override
  String toString() {
    return 'UserModel(fullName: $fullName, emailAddress: $emailAddress, phoneNumber: $phoneNumber, picture: $picture, dob: $dob, referralCode: $referralCode, isEmailVerified: $isEmailVerified, isPhoneNumberVerified: $isPhoneNumberVerified, isBvnVerified: $isBvnVerified, isBvnSubmitted: $isBvnSubmitted, isKycVerified: $isKycVerified, isKycSubmitted: $isKycSubmitted, isPinSet: $isPinSet, hasCustomer: $hasCustomer, tier: $tier, dollarCardCustomerId: $dollarCardCustomerId, conversionRate: $conversionRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.emailAddress, emailAddress) ||
                other.emailAddress == emailAddress) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.picture, picture) || other.picture == picture) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.referralCode, referralCode) ||
                other.referralCode == referralCode) &&
            (identical(other.isEmailVerified, isEmailVerified) ||
                other.isEmailVerified == isEmailVerified) &&
            (identical(other.isPhoneNumberVerified, isPhoneNumberVerified) ||
                other.isPhoneNumberVerified == isPhoneNumberVerified) &&
            (identical(other.isBvnVerified, isBvnVerified) ||
                other.isBvnVerified == isBvnVerified) &&
            (identical(other.isBvnSubmitted, isBvnSubmitted) ||
                other.isBvnSubmitted == isBvnSubmitted) &&
            (identical(other.isKycVerified, isKycVerified) ||
                other.isKycVerified == isKycVerified) &&
            (identical(other.isKycSubmitted, isKycSubmitted) ||
                other.isKycSubmitted == isKycSubmitted) &&
            (identical(other.isPinSet, isPinSet) ||
                other.isPinSet == isPinSet) &&
            (identical(other.hasCustomer, hasCustomer) ||
                other.hasCustomer == hasCustomer) &&
            (identical(other.tier, tier) || other.tier == tier) &&
            (identical(other.dollarCardCustomerId, dollarCardCustomerId) ||
                other.dollarCardCustomerId == dollarCardCustomerId) &&
            (identical(other.conversionRate, conversionRate) ||
                other.conversionRate == conversionRate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      fullName,
      emailAddress,
      phoneNumber,
      picture,
      dob,
      referralCode,
      isEmailVerified,
      isPhoneNumberVerified,
      isBvnVerified,
      isBvnSubmitted,
      isKycVerified,
      isKycSubmitted,
      isPinSet,
      hasCustomer,
      tier,
      dollarCardCustomerId,
      conversionRate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel extends UserModel {
  const factory _UserModel(
      {required final String fullName,
      required final String emailAddress,
      required final String phoneNumber,
      final String? picture,
      final String? dob,
      final String? referralCode,
      required final bool isEmailVerified,
      required final bool isPhoneNumberVerified,
      required final bool isBvnVerified,
      required final bool isBvnSubmitted,
      required final bool isKycVerified,
      required final bool isKycSubmitted,
      required final bool isPinSet,
      required final bool hasCustomer,
      required final int tier,
      final String? dollarCardCustomerId,
      final double conversionRate}) = _$UserModelImpl;
  const _UserModel._() : super._();

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String get fullName;
  @override
  String get emailAddress;
  @override
  String get phoneNumber;
  @override
  String? get picture;
  @override
  String? get dob;
  @override
  String? get referralCode;
  @override
  bool get isEmailVerified;
  @override
  bool get isPhoneNumberVerified;
  @override
  bool get isBvnVerified;
  @override
  bool get isBvnSubmitted;
  @override
  bool get isKycVerified;
  @override
  bool get isKycSubmitted;
  @override
  bool get isPinSet;
  @override
  bool get hasCustomer;
  @override
  int get tier;
  @override
  String? get dollarCardCustomerId;
  @override
  double get conversionRate;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
