// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'name_enquiry_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NameEnquiryModel _$NameEnquiryModelFromJson(Map<String, dynamic> json) {
  return _NameEnquiryModel.fromJson(json);
}

/// @nodoc
mixin _$NameEnquiryModel {
  String get accountName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NameEnquiryModelCopyWith<NameEnquiryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NameEnquiryModelCopyWith<$Res> {
  factory $NameEnquiryModelCopyWith(
          NameEnquiryModel value, $Res Function(NameEnquiryModel) then) =
      _$NameEnquiryModelCopyWithImpl<$Res, NameEnquiryModel>;
  @useResult
  $Res call({String accountName});
}

/// @nodoc
class _$NameEnquiryModelCopyWithImpl<$Res, $Val extends NameEnquiryModel>
    implements $NameEnquiryModelCopyWith<$Res> {
  _$NameEnquiryModelCopyWithImpl(this._value, this._then);

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
abstract class _$$NameEnquiryModelImplCopyWith<$Res>
    implements $NameEnquiryModelCopyWith<$Res> {
  factory _$$NameEnquiryModelImplCopyWith(_$NameEnquiryModelImpl value,
          $Res Function(_$NameEnquiryModelImpl) then) =
      __$$NameEnquiryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String accountName});
}

/// @nodoc
class __$$NameEnquiryModelImplCopyWithImpl<$Res>
    extends _$NameEnquiryModelCopyWithImpl<$Res, _$NameEnquiryModelImpl>
    implements _$$NameEnquiryModelImplCopyWith<$Res> {
  __$$NameEnquiryModelImplCopyWithImpl(_$NameEnquiryModelImpl _value,
      $Res Function(_$NameEnquiryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountName = null,
  }) {
    return _then(_$NameEnquiryModelImpl(
      accountName: null == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NameEnquiryModelImpl extends _NameEnquiryModel {
  const _$NameEnquiryModelImpl({required this.accountName}) : super._();

  factory _$NameEnquiryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NameEnquiryModelImplFromJson(json);

  @override
  final String accountName;

  @override
  String toString() {
    return 'NameEnquiryModel(accountName: $accountName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NameEnquiryModelImpl &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, accountName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NameEnquiryModelImplCopyWith<_$NameEnquiryModelImpl> get copyWith =>
      __$$NameEnquiryModelImplCopyWithImpl<_$NameEnquiryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NameEnquiryModelImplToJson(
      this,
    );
  }
}

abstract class _NameEnquiryModel extends NameEnquiryModel {
  const factory _NameEnquiryModel({required final String accountName}) =
      _$NameEnquiryModelImpl;
  const _NameEnquiryModel._() : super._();

  factory _NameEnquiryModel.fromJson(Map<String, dynamic> json) =
      _$NameEnquiryModelImpl.fromJson;

  @override
  String get accountName;
  @override
  @JsonKey(ignore: true)
  _$$NameEnquiryModelImplCopyWith<_$NameEnquiryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
