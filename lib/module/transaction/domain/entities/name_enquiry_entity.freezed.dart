// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'name_enquiry_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NameEnquiryEntity {
  String get accountName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NameEnquiryEntityCopyWith<NameEnquiryEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NameEnquiryEntityCopyWith<$Res> {
  factory $NameEnquiryEntityCopyWith(
          NameEnquiryEntity value, $Res Function(NameEnquiryEntity) then) =
      _$NameEnquiryEntityCopyWithImpl<$Res, NameEnquiryEntity>;
  @useResult
  $Res call({String accountName});
}

/// @nodoc
class _$NameEnquiryEntityCopyWithImpl<$Res, $Val extends NameEnquiryEntity>
    implements $NameEnquiryEntityCopyWith<$Res> {
  _$NameEnquiryEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountName = null,
  }) {
    return _then(_value.copyWith(
      accountName: null == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NameEnquiryEntityImplCopyWith<$Res>
    implements $NameEnquiryEntityCopyWith<$Res> {
  factory _$$NameEnquiryEntityImplCopyWith(_$NameEnquiryEntityImpl value,
          $Res Function(_$NameEnquiryEntityImpl) then) =
      __$$NameEnquiryEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String accountName});
}

/// @nodoc
class __$$NameEnquiryEntityImplCopyWithImpl<$Res>
    extends _$NameEnquiryEntityCopyWithImpl<$Res, _$NameEnquiryEntityImpl>
    implements _$$NameEnquiryEntityImplCopyWith<$Res> {
  __$$NameEnquiryEntityImplCopyWithImpl(_$NameEnquiryEntityImpl _value,
      $Res Function(_$NameEnquiryEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountName = null,
  }) {
    return _then(_$NameEnquiryEntityImpl(
      accountName: null == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NameEnquiryEntityImpl implements _NameEnquiryEntity {
  const _$NameEnquiryEntityImpl({required this.accountName});

  @override
  final String accountName;

  @override
  String toString() {
    return 'NameEnquiryEntity(accountName: $accountName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NameEnquiryEntityImpl &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accountName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NameEnquiryEntityImplCopyWith<_$NameEnquiryEntityImpl> get copyWith =>
      __$$NameEnquiryEntityImplCopyWithImpl<_$NameEnquiryEntityImpl>(
          this, _$identity);
}

abstract class _NameEnquiryEntity implements NameEnquiryEntity {
  const factory _NameEnquiryEntity({required final String accountName}) =
      _$NameEnquiryEntityImpl;

  @override
  String get accountName;
  @override
  @JsonKey(ignore: true)
  _$$NameEnquiryEntityImplCopyWith<_$NameEnquiryEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
