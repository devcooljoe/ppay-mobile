// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_picture_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfilePictureEntity {
  String get pictureUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfilePictureEntityCopyWith<ProfilePictureEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfilePictureEntityCopyWith<$Res> {
  factory $ProfilePictureEntityCopyWith(ProfilePictureEntity value,
          $Res Function(ProfilePictureEntity) then) =
      _$ProfilePictureEntityCopyWithImpl<$Res, ProfilePictureEntity>;
  @useResult
  $Res call({String pictureUrl});
}

/// @nodoc
class _$ProfilePictureEntityCopyWithImpl<$Res,
        $Val extends ProfilePictureEntity>
    implements $ProfilePictureEntityCopyWith<$Res> {
  _$ProfilePictureEntityCopyWithImpl(this._value, this._then);

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
abstract class _$$ProfilePictureEntityImplCopyWith<$Res>
    implements $ProfilePictureEntityCopyWith<$Res> {
  factory _$$ProfilePictureEntityImplCopyWith(_$ProfilePictureEntityImpl value,
          $Res Function(_$ProfilePictureEntityImpl) then) =
      __$$ProfilePictureEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String pictureUrl});
}

/// @nodoc
class __$$ProfilePictureEntityImplCopyWithImpl<$Res>
    extends _$ProfilePictureEntityCopyWithImpl<$Res, _$ProfilePictureEntityImpl>
    implements _$$ProfilePictureEntityImplCopyWith<$Res> {
  __$$ProfilePictureEntityImplCopyWithImpl(_$ProfilePictureEntityImpl _value,
      $Res Function(_$ProfilePictureEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pictureUrl = null,
  }) {
    return _then(_$ProfilePictureEntityImpl(
      pictureUrl: null == pictureUrl
          ? _value.pictureUrl
          : pictureUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProfilePictureEntityImpl implements _ProfilePictureEntity {
  const _$ProfilePictureEntityImpl({required this.pictureUrl});

  @override
  final String pictureUrl;

  @override
  String toString() {
    return 'ProfilePictureEntity(pictureUrl: $pictureUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfilePictureEntityImpl &&
            (identical(other.pictureUrl, pictureUrl) ||
                other.pictureUrl == pictureUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pictureUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfilePictureEntityImplCopyWith<_$ProfilePictureEntityImpl>
      get copyWith =>
          __$$ProfilePictureEntityImplCopyWithImpl<_$ProfilePictureEntityImpl>(
              this, _$identity);
}

abstract class _ProfilePictureEntity implements ProfilePictureEntity {
  const factory _ProfilePictureEntity({required final String pictureUrl}) =
      _$ProfilePictureEntityImpl;

  @override
  String get pictureUrl;
  @override
  @JsonKey(ignore: true)
  _$$ProfilePictureEntityImplCopyWith<_$ProfilePictureEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
