// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kyc_document_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KycDocumentTypeModelImpl _$$KycDocumentTypeModelImplFromJson(
        Map<String, dynamic> json) =>
    _$KycDocumentTypeModelImpl(
      idType: json['id_type'] as String,
      name: json['name'] as String,
      country: json['country'] as String,
      requiresDob: json['requires_dob'] as bool,
      requiresName: json['requires_name'] as bool,
    );

Map<String, dynamic> _$$KycDocumentTypeModelImplToJson(
        _$KycDocumentTypeModelImpl instance) =>
    <String, dynamic>{
      'id_type': instance.idType,
      'name': instance.name,
      'country': instance.country,
      'requires_dob': instance.requiresDob,
      'requires_name': instance.requiresName,
    };
