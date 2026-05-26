import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_bank_account_request.freezed.dart';
part 'update_bank_account_request.g.dart';

@freezed
class UpdateBankAccountRequest with _$UpdateBankAccountRequest {
  const factory UpdateBankAccountRequest({
    required String accountName,
    required String accountNumber,
    required String bankName,
    required String bankCode,
  }) = _UpdateBankAccountRequest;

  factory UpdateBankAccountRequest.fromJson(Map<String, dynamic> json) => _$UpdateBankAccountRequestFromJson(json);
}
