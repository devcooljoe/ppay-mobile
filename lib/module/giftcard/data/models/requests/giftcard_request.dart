import 'package:freezed_annotation/freezed_annotation.dart';

part 'giftcard_request.freezed.dart';
part 'giftcard_request.g.dart';

@freezed
class BuyGiftcardRequest with _$BuyGiftcardRequest {
  const factory BuyGiftcardRequest({
    required String identifier,
    required String fullName,
    required String email,
    required String phoneNumber,
    required double amountInUSD,
    required double amountInNaira,
    required String title,
    required String region,
    required double rate,
  }) = _BuyGiftcardRequest;

  factory BuyGiftcardRequest.fromJson(Map<String, dynamic> json) => _$BuyGiftcardRequestFromJson(json);
}
