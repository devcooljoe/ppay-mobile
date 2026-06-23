// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterRequestImpl _$$RegisterRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$RegisterRequestImpl(
      fullName: json['fullName'] as String,
      emailAddress: json['emailAddress'] as String,
      phoneNumber: json['phoneNumber'] as String,
      password: json['password'] as String,
      confirmPassword: json['confirmPassword'] as String,
      deviceToken: json['deviceToken'] as String?,
    );

Map<String, dynamic> _$$RegisterRequestImplToJson(
        _$RegisterRequestImpl instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'emailAddress': instance.emailAddress,
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
      'deviceToken': instance.deviceToken,
    };
