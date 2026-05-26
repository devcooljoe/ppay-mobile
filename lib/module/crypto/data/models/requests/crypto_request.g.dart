// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BuyCryptoRequestImpl _$$BuyCryptoRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$BuyCryptoRequestImpl(
      amount: (json['amount'] as num).toDouble(),
      walletAddressId: json['walletAddressId'] as String,
    );

Map<String, dynamic> _$$BuyCryptoRequestImplToJson(
        _$BuyCryptoRequestImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'walletAddressId': instance.walletAddressId,
    };

_$SellCryptoRequestImpl _$$SellCryptoRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$SellCryptoRequestImpl(
      amount: (json['amount'] as num).toDouble(),
      walletAddressId: json['walletAddressId'] as String,
    );

Map<String, dynamic> _$$SellCryptoRequestImplToJson(
        _$SellCryptoRequestImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'walletAddressId': instance.walletAddressId,
    };
