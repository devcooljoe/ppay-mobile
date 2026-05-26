// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_token_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResetTokenModel _$ResetTokenModelFromJson(Map<String, dynamic> json) {
  return _ResetTokenModel.fromJson(json);
}

/// @nodoc
mixin _$ResetTokenModel {
  String get resetToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResetTokenModelCopyWith<ResetTokenModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetTokenModelCopyWith<$Res> {
  factory $ResetTokenModelCopyWith(
          ResetTokenModel value, $Res Function(ResetTokenModel) then) =
      _$ResetTokenModelCopyWithImpl<$Res, ResetTokenModel>;
  @useResult
  $Res call({String resetToken});
}

/// @nodoc
class _$ResetTokenModelCopyWithImpl<$Res, $Val extends ResetTokenModel>
    implements $ResetTokenModelCopyWith<$Res> {
  _$ResetTokenModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resetToken = null,
  }) {
    return _then(_value.copyWith(
      resetToken: null == resetToken
          ? _value.resetToken
          : resetToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResetTokenModelImplCopyWith<$Res>
    implements $ResetTokenModelCopyWith<$Res> {
  factory _$$ResetTokenModelImplCopyWith(_$ResetTokenModelImpl value,
          $Res Function(_$ResetTokenModelImpl) then) =
      __$$ResetTokenModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String resetToken});
}

/// @nodoc
class __$$ResetTokenModelImplCopyWithImpl<$Res>
    extends _$ResetTokenModelCopyWithImpl<$Res, _$ResetTokenModelImpl>
    implements _$$ResetTokenModelImplCopyWith<$Res> {
  __$$ResetTokenModelImplCopyWithImpl(
      _$ResetTokenModelImpl _value, $Res Function(_$ResetTokenModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resetToken = null,
  }) {
    return _then(_$ResetTokenModelImpl(
      resetToken: null == resetToken
          ? _value.resetToken
          : resetToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResetTokenModelImpl implements _ResetTokenModel {
  const _$ResetTokenModelImpl({required this.resetToken});

  factory _$ResetTokenModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResetTokenModelImplFromJson(json);

  @override
  final String resetToken;

  @override
  String toString() {
    return 'ResetTokenModel(resetToken: $resetToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetTokenModelImpl &&
            (identical(other.resetToken, resetToken) ||
                other.resetToken == resetToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, resetToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetTokenModelImplCopyWith<_$ResetTokenModelImpl> get copyWith =>
      __$$ResetTokenModelImplCopyWithImpl<_$ResetTokenModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResetTokenModelImplToJson(
      this,
    );
  }
}

abstract class _ResetTokenModel implements ResetTokenModel {
  const factory _ResetTokenModel({required final String resetToken}) =
      _$ResetTokenModelImpl;

  factory _ResetTokenModel.fromJson(Map<String, dynamic> json) =
      _$ResetTokenModelImpl.fromJson;

  @override
  String get resetToken;
  @override
  @JsonKey(ignore: true)
  _$$ResetTokenModelImplCopyWith<_$ResetTokenModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
