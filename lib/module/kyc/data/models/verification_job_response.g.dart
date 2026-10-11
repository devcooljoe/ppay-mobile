// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_job_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerificationJobResponseImpl _$$VerificationJobResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$VerificationJobResponseImpl(
      jobId: json['jobId'] as String,
      smileJobId: json['smileJobId'] as String,
      smileUserId: json['smileUserId'] as String,
    );

Map<String, dynamic> _$$VerificationJobResponseImplToJson(
        _$VerificationJobResponseImpl instance) =>
    <String, dynamic>{
      'jobId': instance.jobId,
      'smileJobId': instance.smileJobId,
      'smileUserId': instance.smileUserId,
    };
