import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_kyc_request.freezed.dart';
part 'verify_kyc_request.g.dart';

@freezed
class VerifyKycRequest with _$VerifyKycRequest {
  const factory VerifyKycRequest({
    required String idType,
    required String idNumber,
  }) = _VerifyKycRequest;

  factory VerifyKycRequest.fromJson(Map<String, dynamic> json) => _$VerifyKycRequestFromJson(json);
}
