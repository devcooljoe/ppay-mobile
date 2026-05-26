import 'package:freezed_annotation/freezed_annotation.dart';

part 'name_enquiry_request.freezed.dart';
part 'name_enquiry_request.g.dart';

@freezed
class NameEnquiryRequest with _$NameEnquiryRequest {
  const factory NameEnquiryRequest({
    required String accountNumber,
    required String bankCode,
  }) = _NameEnquiryRequest;

  factory NameEnquiryRequest.fromJson(Map<String, dynamic> json) => _$NameEnquiryRequestFromJson(json);
}
