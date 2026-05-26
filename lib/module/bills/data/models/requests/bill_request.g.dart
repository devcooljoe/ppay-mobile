// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerifyBillCustomerRequestImpl _$$VerifyBillCustomerRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$VerifyBillCustomerRequestImpl(
      kudaBillItemIdentifier: json['kudaBillItemIdentifier'] as String,
      customerIdentification: json['customerIdentification'] as String,
    );

Map<String, dynamic> _$$VerifyBillCustomerRequestImplToJson(
        _$VerifyBillCustomerRequestImpl instance) =>
    <String, dynamic>{
      'kudaBillItemIdentifier': instance.kudaBillItemIdentifier,
      'customerIdentification': instance.customerIdentification,
    };

_$PurchaseBillRequestImpl _$$PurchaseBillRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$PurchaseBillRequestImpl(
      billItemIdentifier: json['billItemIdentifier'] as String,
      customerIdentifier: json['customerIdentifier'] as String,
      phoneNumber: json['phoneNumber'] as String,
      amount: (json['amount'] as num).toDouble(),
      customerFirstName: json['customerFirstName'] as String,
    );

Map<String, dynamic> _$$PurchaseBillRequestImplToJson(
        _$PurchaseBillRequestImpl instance) =>
    <String, dynamic>{
      'billItemIdentifier': instance.billItemIdentifier,
      'customerIdentifier': instance.customerIdentifier,
      'phoneNumber': instance.phoneNumber,
      'amount': instance.amount,
      'customerFirstName': instance.customerFirstName,
    };
