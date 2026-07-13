import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_entity.freezed.dart';

@freezed
class CryptoRateEntity with _$CryptoRateEntity {
  const factory CryptoRateEntity({
    required String id,
    required String name,
    required String currency,
    required String slug,
    required String price,
    required String rate,
    required String percentChangePerHour,
    required String logoUrl,
    required String buyRatePerDollar,
    required String sellRatePerDollar,
    required String value,
  }) = _CryptoRateEntity;
}

@freezed
class EstimatedAssetValueEntity with _$EstimatedAssetValueEntity {
  const factory EstimatedAssetValueEntity({
    required String totalValueUSD,
  }) = _EstimatedAssetValueEntity;
}

@freezed
class CryptoWalletEntity with _$CryptoWalletEntity {
  const factory CryptoWalletEntity({
    required String id,
    String? reference,
    required String currency,
    required String address,
    required String network,
    required String balance,
  }) = _CryptoWalletEntity;
}
