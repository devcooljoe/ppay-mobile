// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BankAccountModelImpl _$$BankAccountModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BankAccountModelImpl(
      id: json['id'] as String? ?? '',
      accountName: json['accountName'] as String? ?? '',
      accountNumber: json['accountNumber'] as String? ?? '',
      bankName: json['bankName'] as String? ?? '',
      bankCode: json['bankCode'] as String? ?? '',
      bankLogo: json['bankLogo'] as String? ?? '',
      date: json['date'] as String? ?? '',
    );

Map<String, dynamic> _$$BankAccountModelImplToJson(
        _$BankAccountModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accountName': instance.accountName,
      'accountNumber': instance.accountNumber,
      'bankName': instance.bankName,
      'bankCode': instance.bankCode,
      'bankLogo': instance.bankLogo,
      'date': instance.date,
    };
