// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      fullName: json['fullName'] as String,
      emailAddress: json['emailAddress'] as String,
      phoneNumber: json['phoneNumber'] as String,
      picture: json['picture'] as String?,
      isEmailVerified: json['isEmailVerified'] as bool,
      isPhoneNumberVerified: json['isPhoneNumberVerified'] as bool,
      isBvnVerified: json['isBvnVerified'] as bool,
      isBvnSubmitted: json['isBvnSubmitted'] as bool,
      isKycVerified: json['isKycVerified'] as bool,
      isKycSubmitted: json['isKycSubmitted'] as bool,
      isPinSet: json['isPinSet'] as bool,
      hasCustomer: json['hasCustomer'] as bool,
      tier: (json['tier'] as num).toInt(),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'emailAddress': instance.emailAddress,
      'phoneNumber': instance.phoneNumber,
      'picture': instance.picture,
      'isEmailVerified': instance.isEmailVerified,
      'isPhoneNumberVerified': instance.isPhoneNumberVerified,
      'isBvnVerified': instance.isBvnVerified,
      'isBvnSubmitted': instance.isBvnSubmitted,
      'isKycVerified': instance.isKycVerified,
      'isKycSubmitted': instance.isKycSubmitted,
      'isPinSet': instance.isPinSet,
      'hasCustomer': instance.hasCustomer,
      'tier': instance.tier,
    };
