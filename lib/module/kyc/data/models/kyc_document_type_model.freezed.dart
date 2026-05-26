// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kyc_document_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KycDocumentTypeModel _$KycDocumentTypeModelFromJson(Map<String, dynamic> json) {
  return _KycDocumentTypeModel.fromJson(json);
}

/// @nodoc
mixin _$KycDocumentTypeModel {
  @JsonKey(name: 'id_type')
  String get idType => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  @JsonKey(name: 'requires_dob')
  bool get requiresDob => throw _privateConstructorUsedError;
  @JsonKey(name: 'requires_name')
  bool get requiresName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KycDocumentTypeModelCopyWith<KycDocumentTypeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KycDocumentTypeModelCopyWith<$Res> {
  factory $KycDocumentTypeModelCopyWith(KycDocumentTypeModel value,
          $Res Function(KycDocumentTypeModel) then) =
      _$KycDocumentTypeModelCopyWithImpl<$Res, KycDocumentTypeModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_type') String idType,
      String name,
      String country,
      @JsonKey(name: 'requires_dob') bool requiresDob,
      @JsonKey(name: 'requires_name') bool requiresName});
}

/// @nodoc
class _$KycDocumentTypeModelCopyWithImpl<$Res,
        $Val extends KycDocumentTypeModel>
    implements $KycDocumentTypeModelCopyWith<$Res> {
  _$KycDocumentTypeModelCopyWithImpl(this._value, this._then);

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
abstract class _$$KycDocumentTypeModelImplCopyWith<$Res>
    implements $KycDocumentTypeModelCopyWith<$Res> {
  factory _$$KycDocumentTypeModelImplCopyWith(_$KycDocumentTypeModelImpl value,
          $Res Function(_$KycDocumentTypeModelImpl) then) =
      __$$KycDocumentTypeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_type') String idType,
      String name,
      String country,
      @JsonKey(name: 'requires_dob') bool requiresDob,
      @JsonKey(name: 'requires_name') bool requiresName});
}

/// @nodoc
class __$$KycDocumentTypeModelImplCopyWithImpl<$Res>
    extends _$KycDocumentTypeModelCopyWithImpl<$Res, _$KycDocumentTypeModelImpl>
    implements _$$KycDocumentTypeModelImplCopyWith<$Res> {
  __$$KycDocumentTypeModelImplCopyWithImpl(_$KycDocumentTypeModelImpl _value,
      $Res Function(_$KycDocumentTypeModelImpl) _then)
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
    return _then(_$KycDocumentTypeModelImpl(
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
@JsonSerializable()
class _$KycDocumentTypeModelImpl extends _KycDocumentTypeModel {
  const _$KycDocumentTypeModelImpl(
      {@JsonKey(name: 'id_type') required this.idType,
      required this.name,
      required this.country,
      @JsonKey(name: 'requires_dob') required this.requiresDob,
      @JsonKey(name: 'requires_name') required this.requiresName})
      : super._();

  factory _$KycDocumentTypeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$KycDocumentTypeModelImplFromJson(json);

  @override
  @JsonKey(name: 'id_type')
  final String idType;
  @override
  final String name;
  @override
  final String country;
  @override
  @JsonKey(name: 'requires_dob')
  final bool requiresDob;
  @override
  @JsonKey(name: 'requires_name')
  final bool requiresName;

  @override
  String toString() {
    return 'KycDocumentTypeModel(idType: $idType, name: $name, country: $country, requiresDob: $requiresDob, requiresName: $requiresName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KycDocumentTypeModelImpl &&
            (identical(other.idType, idType) || other.idType == idType) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.requiresDob, requiresDob) ||
                other.requiresDob == requiresDob) &&
            (identical(other.requiresName, requiresName) ||
                other.requiresName == requiresName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, idType, name, country, requiresDob, requiresName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KycDocumentTypeModelImplCopyWith<_$KycDocumentTypeModelImpl>
      get copyWith =>
          __$$KycDocumentTypeModelImplCopyWithImpl<_$KycDocumentTypeModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KycDocumentTypeModelImplToJson(
      this,
    );
  }
}

abstract class _KycDocumentTypeModel extends KycDocumentTypeModel {
  const factory _KycDocumentTypeModel(
          {@JsonKey(name: 'id_type') required final String idType,
          required final String name,
          required final String country,
          @JsonKey(name: 'requires_dob') required final bool requiresDob,
          @JsonKey(name: 'requires_name') required final bool requiresName}) =
      _$KycDocumentTypeModelImpl;
  const _KycDocumentTypeModel._() : super._();

  factory _KycDocumentTypeModel.fromJson(Map<String, dynamic> json) =
      _$KycDocumentTypeModelImpl.fromJson;

  @override
  @JsonKey(name: 'id_type')
  String get idType;
  @override
  String get name;
  @override
  String get country;
  @override
  @JsonKey(name: 'requires_dob')
  bool get requiresDob;
  @override
  @JsonKey(name: 'requires_name')
  bool get requiresName;
  @override
  @JsonKey(ignore: true)
  _$$KycDocumentTypeModelImplCopyWith<_$KycDocumentTypeModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
