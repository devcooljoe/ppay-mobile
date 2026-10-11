import 'package:freezed_annotation/freezed_annotation.dart';

part 'verification_job_response.freezed.dart';
part 'verification_job_response.g.dart';

@freezed
class VerificationJobResponse with _$VerificationJobResponse {
  const factory VerificationJobResponse({
    required String jobId,
    required String smileJobId,
    required String smileUserId,
  }) = _VerificationJobResponse;

  factory VerificationJobResponse.fromJson(Map<String, dynamic> json) =>
      _$VerificationJobResponseFromJson(json);
}
