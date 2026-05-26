// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdraw_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WithdrawRequestImpl _$$WithdrawRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$WithdrawRequestImpl(
      amount: (json['amount'] as num).toDouble(),
      accountNumber: json['accountNumber'] as String,
      accountName: json['accountName'] as String,
      bankCode: json['bankCode'] as String,
      bankName: json['bankName'] as String,
    );

Map<String, dynamic> _$$WithdrawRequestImplToJson(
        _$WithdrawRequestImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'accountNumber': instance.accountNumber,
      'accountName': instance.accountName,
      'bankCode': instance.bankCode,
      'bankName': instance.bankName,
    };
