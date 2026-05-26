import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_bvn_request.freezed.dart';
part 'verify_bvn_request.g.dart';

@freezed
class VerifyBvnRequest with _$VerifyBvnRequest {
  const factory VerifyBvnRequest({
    required String bvnNumber,
    required String dob,
  }) = _VerifyBvnRequest;

  factory VerifyBvnRequest.fromJson(Map<String, dynamic> json) => _$VerifyBvnRequestFromJson(json);
}
