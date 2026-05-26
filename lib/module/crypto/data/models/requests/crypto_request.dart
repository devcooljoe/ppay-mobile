import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_request.freezed.dart';
part 'crypto_request.g.dart';

@freezed
class BuyCryptoRequest with _$BuyCryptoRequest {
  const factory BuyCryptoRequest({
    required double amount,
    required String walletAddressId,
  }) = _BuyCryptoRequest;

  factory BuyCryptoRequest.fromJson(Map<String, dynamic> json) => _$BuyCryptoRequestFromJson(json);
}

@freezed
class SellCryptoRequest with _$SellCryptoRequest {
  const factory SellCryptoRequest({
    required double amount,
    required String walletAddressId,
  }) = _SellCryptoRequest;

  factory SellCryptoRequest.fromJson(Map<String, dynamic> json) => _$SellCryptoRequestFromJson(json);
}
