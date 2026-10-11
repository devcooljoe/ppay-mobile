// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smile_id_token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SmileIdTokenResponseImpl _$$SmileIdTokenResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SmileIdTokenResponseImpl(
      token: json['token'] as String,
      partnerId: json['partnerId'] as String,
      callbackUrl: json['callbackUrl'] as String,
      useSandbox: json['useSandbox'] as bool,
    );

Map<String, dynamic> _$$SmileIdTokenResponseImplToJson(
        _$SmileIdTokenResponseImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'partnerId': instance.partnerId,
      'callbackUrl': instance.callbackUrl,
      'useSandbox': instance.useSandbox,
    };
