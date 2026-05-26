// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kyc_document_type_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$KycDocumentTypeEntity {
  String get idType => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  bool get requiresDob => throw _privateConstructorUsedError;
  bool get requiresName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $KycDocumentTypeEntityCopyWith<KycDocumentTypeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KycDocumentTypeEntityCopyWith<$Res> {
  factory $KycDocumentTypeEntityCopyWith(KycDocumentTypeEntity value,
          $Res Function(KycDocumentTypeEntity) then) =
      _$KycDocumentTypeEntityCopyWithImpl<$Res, KycDocumentTypeEntity>;
  @useResult
  $Res call(
      {String idType,
      String name,
      String country,
      bool requiresDob,
      bool requiresName});
}

/// @nodoc
class _$KycDocumentTypeEntityCopyWithImpl<$Res,
        $Val extends KycDocumentTypeEntity>
    implements $KycDocumentTypeEntityCopyWith<$Res> {
  _$KycDocumentTypeEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idType = null,
    Object? name = null,
    Object? country = null,
    Object? requiresDob = null,
    Object? requiresName = null,
  }) {
    return _then(_value.copyWith(
      idType: null == idType
          ? _value.idType
          : idType // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      requiresDob: null == requiresDob
          ? _value.requiresDob
          : requiresDob // ignore: cast_nullable_to_non_nullable
              as bool,
      requiresName: null == requiresName
          ? _value.requiresName
          : requiresName // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KycDocumentTypeEntityImplCopyWith<$Res>
    implements $KycDocumentTypeEntityCopyWith<$Res> {
  factory _$$KycDocumentTypeEntityImplCopyWith(
          _$KycDocumentTypeEntityImpl value,
          $Res Function(_$KycDocumentTypeEntityImpl) then) =
      __$$KycDocumentTypeEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String idType,
      String name,
      String country,
      bool requiresDob,
      bool requiresName});
}

/// @nodoc
class __$$KycDocumentTypeEntityImplCopyWithImpl<$Res>
    extends _$KycDocumentTypeEntityCopyWithImpl<$Res,
        _$KycDocumentTypeEntityImpl>
    implements _$$KycDocumentTypeEntityImplCopyWith<$Res> {
  __$$KycDocumentTypeEntityImplCopyWithImpl(_$KycDocumentTypeEntityImpl _value,
      $Res Function(_$KycDocumentTypeEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idType = null,
    Object? name = null,
    Object? country = null,
    Object? requiresDob = null,
    Object? requiresName = null,
  }) {
    return _then(_$KycDocumentTypeEntityImpl(
      idType: null == idType
          ? _value.idType
          : idType // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      requiresDob: null == requiresDob
          ? _value.requiresDob
          : requiresDob // ignore: cast_nullable_to_non_nullable
              as bool,
      requiresName: null == requiresName
          ? _value.requiresName
          : requiresName // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$KycDocumentTypeEntityImpl implements _KycDocumentTypeEntity {
  const _$KycDocumentTypeEntityImpl(
      {required this.idType,
      required this.name,
      required this.country,
      required this.requiresDob,
      required this.requiresName});

  @override
  final String idType;
  @override
  final String name;
  @override
  final String country;
  @override
  final bool requiresDob;
  @override
  final bool requiresName;

  @override
  String toString() {
    return 'KycDocumentTypeEntity(idType: $idType, name: $name, country: $country, requiresDob: $requiresDob, requiresName: $requiresName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KycDocumentTypeEntityImpl &&
            (identical(other.idType, idType) || other.idType == idType) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.requiresDob, requiresDob) ||
                other.requiresDob == requiresDob) &&
            (identical(other.requiresName, requiresName) ||
                other.requiresName == requiresName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, idType, name, country, requiresDob, requiresName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KycDocumentTypeEntityImplCopyWith<_$KycDocumentTypeEntityImpl>
      get copyWith => __$$KycDocumentTypeEntityImplCopyWithImpl<
          _$KycDocumentTypeEntityImpl>(this, _$identity);
}

abstract class _KycDocumentTypeEntity implements KycDocumentTypeEntity {
  const factory _KycDocumentTypeEntity(
      {required final String idType,
      required final String name,
      required final String country,
      required final bool requiresDob,
      required final bool requiresName}) = _$KycDocumentTypeEntityImpl;

  @override
  String get idType;
  @override
  String get name;
  @override
  String get country;
  @override
  bool get requiresDob;
  @override
  bool get requiresName;
  @override
  @JsonKey(ignore: true)
  _$$KycDocumentTypeEntityImplCopyWith<_$KycDocumentTypeEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
