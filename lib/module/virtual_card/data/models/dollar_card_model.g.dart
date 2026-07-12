// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dollar_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DollarCardModelImpl _$$DollarCardModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DollarCardModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      cardNumber: json['cardNumber'] as String,
      maskedPan: json['maskedPan'] as String,
      expiry: json['expiry'] as String,
      cvv: json['cvv'] as String,
      status: json['status'] as String,
      type: json['type'] as String,
      issuer: json['issuer'] as String,
      currency: json['currency'] as String,
      balance: (json['balance'] as num).toDouble(),
      address: DollarCardAddressModel.fromJson(
          json['address'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      rate: (json['rate'] as num).toDouble(),
    );

Map<String, dynamic> _$$DollarCardModelImplToJson(
        _$DollarCardModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cardNumber': instance.cardNumber,
      'maskedPan': instance.maskedPan,
      'expiry': instance.expiry,
      'cvv': instance.cvv,
      'status': instance.status,
      'type': instance.type,
      'issuer': instance.issuer,
      'currency': instance.currency,
      'balance': instance.balance,
      'address': instance.address,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'rate': instance.rate,
    };

_$DollarCardAddressModelImpl _$$DollarCardAddressModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DollarCardAddressModelImpl(
      street: json['street'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      postalCode: json['postalCode'] as String,
      country: json['country'] as String,
    );

Map<String, dynamic> _$$DollarCardAddressModelImplToJson(
        _$DollarCardAddressModelImpl instance) =>
    <String, dynamic>{
      'street': instance.street,
      'city': instance.city,
      'state': instance.state,
      'postalCode': instance.postalCode,
      'country': instance.country,
    };
