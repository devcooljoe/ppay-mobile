// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_dollar_card_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateDollarCardRequestImpl _$$CreateDollarCardRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateDollarCardRequestImpl(
      street: json['street'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      country: json['country'] as String,
      postalCode: json['postalCode'] as String,
    );

Map<String, dynamic> _$$CreateDollarCardRequestImplToJson(
        _$CreateDollarCardRequestImpl instance) =>
    <String, dynamic>{
      'street': instance.street,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'postalCode': instance.postalCode,
    };
