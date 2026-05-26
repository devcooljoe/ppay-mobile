// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'giftcard_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BuyGiftcardRequestImpl _$$BuyGiftcardRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$BuyGiftcardRequestImpl(
      identifier: json['identifier'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      amountInUSD: (json['amountInUSD'] as num).toDouble(),
      amountInNaira: (json['amountInNaira'] as num).toDouble(),
      title: json['title'] as String,
      region: json['region'] as String,
      rate: (json['rate'] as num).toDouble(),
    );

Map<String, dynamic> _$$BuyGiftcardRequestImplToJson(
        _$BuyGiftcardRequestImpl instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'fullName': instance.fullName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'amountInUSD': instance.amountInUSD,
      'amountInNaira': instance.amountInNaira,
      'title': instance.title,
      'region': instance.region,
      'rate': instance.rate,
    };
