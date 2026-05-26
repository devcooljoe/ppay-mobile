import 'package:freezed_annotation/freezed_annotation.dart';

part 'withdraw_dollar_card_request.freezed.dart';
part 'withdraw_dollar_card_request.g.dart';

@freezed
class WithdrawDollarCardRequest with _$WithdrawDollarCardRequest {
  const factory WithdrawDollarCardRequest({
    required double amount,
  }) = _WithdrawDollarCardRequest;

  factory WithdrawDollarCardRequest.fromJson(Map<String, dynamic> json) => _$WithdrawDollarCardRequestFromJson(json);
}
