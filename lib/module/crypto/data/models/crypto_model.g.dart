// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CryptoRateModelImpl _$$CryptoRateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CryptoRateModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      currency: json['currency'] as String,
      slug: json['slug'] as String,
      price: json['price'] as String,
      rate: json['rate'] as String,
      percentChangePerHour: json['percentChangePerHour'] as String,
      logoUrl: json['logoUrl'] as String,
      buyRatePerDollar: json['buyRatePerDollar'] as String,
      sellRatePerDollar: json['sellRatePerDollar'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$$CryptoRateModelImplToJson(
        _$CryptoRateModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'currency': instance.currency,
      'slug': instance.slug,
      'price': instance.price,
      'rate': instance.rate,
      'percentChangePerHour': instance.percentChangePerHour,
      'logoUrl': instance.logoUrl,
      'buyRatePerDollar': instance.buyRatePerDollar,
      'sellRatePerDollar': instance.sellRatePerDollar,
      'value': instance.value,
    };

_$EstimatedAssetValueModelImpl _$$EstimatedAssetValueModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EstimatedAssetValueModelImpl(
      totalValueUSD: json['totalValueUSD'] as String,
    );

Map<String, dynamic> _$$EstimatedAssetValueModelImplToJson(
        _$EstimatedAssetValueModelImpl instance) =>
    <String, dynamic>{
      'totalValueUSD': instance.totalValueUSD,
    };

_$CryptoWalletModelImpl _$$CryptoWalletModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CryptoWalletModelImpl(
      id: json['id'] as String,
      reference: json['reference'] as String,
      currency: json['currency'] as String,
      address: json['address'] as String,
      network: json['network'] as String,
      balance: json['balance'] as String,
    );

Map<String, dynamic> _$$CryptoWalletModelImplToJson(
        _$CryptoWalletModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reference': instance.reference,
      'currency': instance.currency,
      'address': instance.address,
      'network': instance.network,
      'balance': instance.balance,
    };
