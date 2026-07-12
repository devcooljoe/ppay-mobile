// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BillerModelImpl _$$BillerModelImplFromJson(Map<String, dynamic> json) =>
    _$BillerModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      billerIconUrl: json['billerIconUrl'] as String?,
      billTypeId: json['billTypeId'] as String?,
      billItems: (json['billItems'] as List<dynamic>?)
          ?.map((e) => BillItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BillerModelImplToJson(_$BillerModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'billerIconUrl': instance.billerIconUrl,
      'billTypeId': instance.billTypeId,
      'billItems': instance.billItems,
    };

_$BillItemModelImpl _$$BillItemModelImplFromJson(Map<String, dynamic> json) =>
    _$BillItemModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      kudaIdentifier: json['kudaIdentifier'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      isFixedPrice: json['isFixedPrice'] as bool?,
      billerId: json['billerId'] as String?,
      isActive: json['isActive'] as bool?,
      vendingAggregator: json['vendingAggregator'] as String?,
    );

Map<String, dynamic> _$$BillItemModelImplToJson(_$BillItemModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'kudaIdentifier': instance.kudaIdentifier,
      'amount': instance.amount,
      'isFixedPrice': instance.isFixedPrice,
      'billerId': instance.billerId,
      'isActive': instance.isActive,
      'vendingAggregator': instance.vendingAggregator,
    };

_$CustomerVerificationModelImpl _$$CustomerVerificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerVerificationModelImpl(
      customerName: json['customerName'] as String?,
    );

Map<String, dynamic> _$$CustomerVerificationModelImplToJson(
        _$CustomerVerificationModelImpl instance) =>
    <String, dynamic>{
      'customerName': instance.customerName,
    };

_$BillPurchaseModelImpl _$$BillPurchaseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BillPurchaseModelImpl(
      reference: json['reference'] as String?,
      pin: json['pin'] as String?,
    );

Map<String, dynamic> _$$BillPurchaseModelImplToJson(
        _$BillPurchaseModelImpl instance) =>
    <String, dynamic>{
      'reference': instance.reference,
      'pin': instance.pin,
    };
