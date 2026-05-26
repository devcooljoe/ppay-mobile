import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ppay_mobile/module/kyc/domain/entities/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String fullName,
    required String emailAddress,
    required String phoneNumber,
    String? picture,
    required bool isEmailVerified,
    required bool isPhoneNumberVerified,
    required bool isBvnVerified,
    required bool isBvnSubmitted,
    required bool isKycVerified,
    required bool isKycSubmitted,
    required bool isPinSet,
    required bool hasCustomer,
    required int tier,
  }) = _UserModel;

  const UserModel._();

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  UserEntity toEntity() => UserEntity(
    fullName: fullName,
    emailAddress: emailAddress,
    phoneNumber: phoneNumber,
    picture: picture,
    isEmailVerified: isEmailVerified,
    isPhoneNumberVerified: isPhoneNumberVerified,
    isBvnVerified: isBvnVerified,
    isBvnSubmitted: isBvnSubmitted,
    isKycVerified: isKycVerified,
    isKycSubmitted: isKycSubmitted,
    isPinSet: isPinSet,
    hasCustomer: hasCustomer,
    tier: tier,
  );
}
