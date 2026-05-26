// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_pin_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SetPinRequestImpl _$$SetPinRequestImplFromJson(Map<String, dynamic> json) =>
    _$SetPinRequestImpl(
      pin: json['pin'] as String,
      confirmPin: json['confirmPin'] as String,
    );

Map<String, dynamic> _$$SetPinRequestImplToJson(_$SetPinRequestImpl instance) =>
    <String, dynamic>{
      'pin': instance.pin,
      'confirmPin': instance.confirmPin,
    };
