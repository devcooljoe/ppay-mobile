import 'package:freezed_annotation/freezed_annotation.dart';

part 'fund_dollar_card_request.freezed.dart';
part 'fund_dollar_card_request.g.dart';

@freezed
class FundDollarCardRequest with _$FundDollarCardRequest {
  const factory FundDollarCardRequest({
    required double amount,
  }) = _FundDollarCardRequest;

  factory FundDollarCardRequest.fromJson(Map<String, dynamic> json) => _$FundDollarCardRequestFromJson(json);
}
