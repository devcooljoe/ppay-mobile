// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_picture_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProfilePictureModel _$ProfilePictureModelFromJson(Map<String, dynamic> json) {
  return _ProfilePictureModel.fromJson(json);
}

/// @nodoc
mixin _$ProfilePictureModel {
  String get pictureUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfilePictureModelCopyWith<ProfilePictureModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfilePictureModelCopyWith<$Res> {
  factory $ProfilePictureModelCopyWith(
          ProfilePictureModel value, $Res Function(ProfilePictureModel) then) =
      _$ProfilePictureModelCopyWithImpl<$Res, ProfilePictureModel>;
  @useResult
  $Res call({String pictureUrl});
}

/// @nodoc
class _$ProfilePictureModelCopyWithImpl<$Res, $Val extends ProfilePictureModel>
    implements $ProfilePictureModelCopyWith<$Res> {
  _$ProfilePictureModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pictureUrl = null,
  }) {
    return _then(_value.copyWith(
      pictureUrl: null == pictureUrl
          ? _value.pictureUrl
          : pictureUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfilePictureModelImplCopyWith<$Res>
    implements $ProfilePictureModelCopyWith<$Res> {
  factory _$$ProfilePictureModelImplCopyWith(_$ProfilePictureModelImpl value,
          $Res Function(_$ProfilePictureModelImpl) then) =
      __$$ProfilePictureModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String pictureUrl});
}

/// @nodoc
class __$$ProfilePictureModelImplCopyWithImpl<$Res>
    extends _$ProfilePictureModelCopyWithImpl<$Res, _$ProfilePictureModelImpl>
    implements _$$ProfilePictureModelImplCopyWith<$Res> {
  __$$ProfilePictureModelImplCopyWithImpl(_$ProfilePictureModelImpl _value,
      $Res Function(_$ProfilePictureModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pictureUrl = null,
  }) {
    return _then(_$ProfilePictureModelImpl(
      pictureUrl: null == pictureUrl
          ? _value.pictureUrl
          : pictureUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfilePictureModelImpl extends _ProfilePictureModel {
  const _$ProfilePictureModelImpl({required this.pictureUrl}) : super._();

  factory _$ProfilePictureModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfilePictureModelImplFromJson(json);

  @override
  final String pictureUrl;

  @override
  String toString() {
    return 'ProfilePictureModel(pictureUrl: $pictureUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfilePictureModelImpl &&
            (identical(other.pictureUrl, pictureUrl) ||
                other.pictureUrl == pictureUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pictureUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfilePictureModelImplCopyWith<_$ProfilePictureModelImpl> get copyWith =>
      __$$ProfilePictureModelImplCopyWithImpl<_$ProfilePictureModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfilePictureModelImplToJson(
      this,
    );
  }
}

abstract class _ProfilePictureModel extends ProfilePictureModel {
  const factory _ProfilePictureModel({required final String pictureUrl}) =
      _$ProfilePictureModelImpl;
  const _ProfilePictureModel._() : super._();

  factory _ProfilePictureModel.fromJson(Map<String, dynamic> json) =
      _$ProfilePictureModelImpl.fromJson;

  @override
  String get pictureUrl;
  @override
  @JsonKey(ignore: true)
  _$$ProfilePictureModelImplCopyWith<_$ProfilePictureModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
