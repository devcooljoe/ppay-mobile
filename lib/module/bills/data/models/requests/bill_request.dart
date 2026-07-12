import 'package:freezed_annotation/freezed_annotation.dart';

part 'bill_request.freezed.dart';
part 'bill_request.g.dart';

@freezed
class VerifyBillCustomerRequest with _$VerifyBillCustomerRequest {
  const factory VerifyBillCustomerRequest({
    required String kudaBillItemIdentifier,
    required String customerIdentification,
  }) = _VerifyBillCustomerRequest;

  factory VerifyBillCustomerRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyBillCustomerRequestFromJson(json);
}

@freezed
class PurchaseBillRequest with _$PurchaseBillRequest {
  const factory PurchaseBillRequest({
    required String billItemIdentifier,
    required String customerIdentifier,
    required String phoneNumber,
    required double amount,
    required String customerFirstName,
    required String billerName,
    required String billerCategory,
    String? meterNumber,
    String? plan,
    String? provider,
    String? logoUrl,
  }) = _PurchaseBillRequest;

  factory PurchaseBillRequest.fromJson(Map<String, dynamic> json) =>
      _$PurchaseBillRequestFromJson(json);
}
