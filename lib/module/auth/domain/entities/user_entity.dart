import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String fullName,
    required String emailAddress,
    required String phoneNumber,
    String? picture,
    String? dob,
    String? referralCode,
    required bool isEmailVerified,
    required bool isPhoneNumberVerified,
    required bool isBvnVerified,
    required bool isBvnSubmitted,
    required bool isKycVerified,
    required bool isKycSubmitted,
    required bool isPinSet,
    required bool hasCustomer,
    required int tier,
    String? dollarCardCustomerId,
    @Default(0) double conversionRate,
  }) = _UserEntity;
}
