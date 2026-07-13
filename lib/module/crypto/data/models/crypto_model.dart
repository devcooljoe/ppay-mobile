import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ppay_mobile/module/crypto/domain/entities/crypto_entity.dart';

part 'crypto_model.freezed.dart';
part 'crypto_model.g.dart';

@freezed
class CryptoRateModel with _$CryptoRateModel {
  const factory CryptoRateModel({
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
  }) = _CryptoRateModel;

  const CryptoRateModel._();

  factory CryptoRateModel.fromJson(Map<String, dynamic> json) => _$CryptoRateModelFromJson(json);

  CryptoRateEntity toEntity() => CryptoRateEntity(
    id: id,
    name: name,
    currency: currency,
    slug: slug,
    price: price,
    rate: rate,
    percentChangePerHour: percentChangePerHour,
    logoUrl: logoUrl,
    buyRatePerDollar: buyRatePerDollar,
    sellRatePerDollar: sellRatePerDollar,
    value: value,
  );
}

@freezed
class EstimatedAssetValueModel with _$EstimatedAssetValueModel {
  const factory EstimatedAssetValueModel({
    required String totalValueUSD,
  }) = _EstimatedAssetValueModel;

  const EstimatedAssetValueModel._();

  factory EstimatedAssetValueModel.fromJson(Map<String, dynamic> json) => _$EstimatedAssetValueModelFromJson(json);

  EstimatedAssetValueEntity toEntity() => EstimatedAssetValueEntity(totalValueUSD: totalValueUSD);
}

@freezed
class CryptoWalletModel with _$CryptoWalletModel {
  const factory CryptoWalletModel({
    required String id,
    String? reference,
    required String currency,
    required String address,
    required String network,
    required String balance,
  }) = _CryptoWalletModel;

  const CryptoWalletModel._();

  factory CryptoWalletModel.fromJson(Map<String, dynamic> json) => _$CryptoWalletModelFromJson(json);

  CryptoWalletEntity toEntity() => CryptoWalletEntity(
    id: id,
    reference: reference,
    currency: currency,
    address: address,
    network: network,
    balance: balance,
  );
}
