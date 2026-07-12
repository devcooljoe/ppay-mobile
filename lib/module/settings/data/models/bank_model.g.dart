// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BankModelImpl _$$BankModelImplFromJson(Map<String, dynamic> json) =>
    _$BankModelImpl(
      bankName: json['bankName'] as String? ?? '',
      bankCode: json['bankCode'] as String? ?? '',
      bankAvailability: json['bankAvailability'] as String? ?? '',
      bankStatus: json['bankStatus'] as String? ?? '',
      bankLogo: json['bankLogo'] as String? ?? '',
    );

Map<String, dynamic> _$$BankModelImplToJson(_$BankModelImpl instance) =>
    <String, dynamic>{
      'bankName': instance.bankName,
      'bankCode': instance.bankCode,
      'bankAvailability': instance.bankAvailability,
      'bankStatus': instance.bankStatus,
      'bankLogo': instance.bankLogo,
    };
