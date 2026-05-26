// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dollar_card_transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DollarCardTransactionModelImpl _$$DollarCardTransactionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DollarCardTransactionModelImpl(
      id: json['id'] as String,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      description: json['description'] as String,
      status: json['status'] as String,
      entry: json['entry'] as String,
      merchant: DollarCardMerchantModel.fromJson(
          json['merchant'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$DollarCardTransactionModelImplToJson(
        _$DollarCardTransactionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'currency': instance.currency,
      'description': instance.description,
      'status': instance.status,
      'entry': instance.entry,
      'merchant': instance.merchant,
      'createdAt': instance.createdAt,
    };

_$DollarCardMerchantModelImpl _$$DollarCardMerchantModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DollarCardMerchantModelImpl(
      name: json['name'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
    );

Map<String, dynamic> _$$DollarCardMerchantModelImplToJson(
        _$DollarCardMerchantModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'city': instance.city,
      'country': instance.country,
    };
