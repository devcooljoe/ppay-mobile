import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_verification_job_request.freezed.dart';
part 'create_verification_job_request.g.dart';

@freezed
class CreateVerificationJobRequest with _$CreateVerificationJobRequest {
  const factory CreateVerificationJobRequest({
    required String jobType,
    required String idType,
    required String idNumber,
  }) = _CreateVerificationJobRequest;

  factory CreateVerificationJobRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateVerificationJobRequestFromJson(json);
}
