// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_verification_job_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateVerificationJobRequestImpl _$$CreateVerificationJobRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateVerificationJobRequestImpl(
      jobType: json['jobType'] as String,
      idType: json['idType'] as String,
      idNumber: json['idNumber'] as String,
    );

Map<String, dynamic> _$$CreateVerificationJobRequestImplToJson(
        _$CreateVerificationJobRequestImpl instance) =>
    <String, dynamic>{
      'jobType': instance.jobType,
      'idType': instance.idType,
      'idNumber': instance.idNumber,
    };
