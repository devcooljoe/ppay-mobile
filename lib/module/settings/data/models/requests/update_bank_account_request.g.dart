// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_bank_account_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateBankAccountRequestImpl _$$UpdateBankAccountRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateBankAccountRequestImpl(
      accountName: json['accountName'] as String,
      accountNumber: json['accountNumber'] as String,
      bankName: json['bankName'] as String,
      bankCode: json['bankCode'] as String,
    );

Map<String, dynamic> _$$UpdateBankAccountRequestImplToJson(
        _$UpdateBankAccountRequestImpl instance) =>
    <String, dynamic>{
      'accountName': instance.accountName,
      'accountNumber': instance.accountNumber,
      'bankName': instance.bankName,
      'bankCode': instance.bankCode,
    };
