// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_forgot_password_otp_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerifyForgotPasswordOtpRequestImpl
    _$$VerifyForgotPasswordOtpRequestImplFromJson(Map<String, dynamic> json) =>
        _$VerifyForgotPasswordOtpRequestImpl(
          emailAddress: json['emailAddress'] as String,
          otpCode: json['otpCode'] as String,
        );

Map<String, dynamic> _$$VerifyForgotPasswordOtpRequestImplToJson(
        _$VerifyForgotPasswordOtpRequestImpl instance) =>
    <String, dynamic>{
      'emailAddress': instance.emailAddress,
      'otpCode': instance.otpCode,
    };
