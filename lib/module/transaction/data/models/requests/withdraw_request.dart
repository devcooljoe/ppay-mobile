import 'package:freezed_annotation/freezed_annotation.dart';

part 'withdraw_request.freezed.dart';
part 'withdraw_request.g.dart';

@freezed
class WithdrawRequest with _$WithdrawRequest {
  const factory WithdrawRequest({
    required double amount,
    required String accountNumber,
    required String accountName,
    required String bankCode,
    required String bankName,
  }) = _WithdrawRequest;

  factory WithdrawRequest.fromJson(Map<String, dynamic> json) => _$WithdrawRequestFromJson(json);
}
