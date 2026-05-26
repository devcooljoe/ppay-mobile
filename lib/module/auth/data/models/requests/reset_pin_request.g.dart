// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_pin_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResetPinRequestImpl _$$ResetPinRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ResetPinRequestImpl(
      resetToken: json['resetToken'] as String,
      pin: json['pin'] as String,
      confirmPin: json['confirmPin'] as String,
    );

Map<String, dynamic> _$$ResetPinRequestImplToJson(
        _$ResetPinRequestImpl instance) =>
    <String, dynamic>{
      'resetToken': instance.resetToken,
      'pin': instance.pin,
      'confirmPin': instance.confirmPin,
    };
