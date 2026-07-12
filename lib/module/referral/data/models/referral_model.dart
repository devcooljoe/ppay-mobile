import 'package:ppay_mobile/module/referral/domain/entities/referral_entity.dart';

class ReferralItemModel {
  final String id;
  final String name;
  final String email;
  final String joinedAt;

  const ReferralItemModel({
    required this.id,
    required this.name,
    required this.email,
    required this.joinedAt,
  });

  factory ReferralItemModel.fromJson(Map<String, dynamic> json) {
    return ReferralItemModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      joinedAt: json['joinedAt'] as String,
    );
  }

  ReferralItemEntity toEntity() => ReferralItemEntity(
        id: id,
        name: name,
        email: email,
        joinedAt: joinedAt,
      );
}

class ReferralInfoModel {
  final String? referralCode;
  final String? referralLink;
  final int totalReferrals;
  final List<ReferralItemModel> referrals;

  const ReferralInfoModel({
    required this.referralCode,
    required this.referralLink,
    required this.totalReferrals,
    required this.referrals,
  });

  factory ReferralInfoModel.fromJson(Map<String, dynamic> json) {
    return ReferralInfoModel(
      referralCode: json['referralCode'] as String?,
      referralLink: json['referralLink'] as String?,
      totalReferrals: (json['totalReferrals'] as num).toInt(),
      referrals: (json['referrals'] as List<dynamic>)
          .map((e) => ReferralItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  ReferralInfoEntity toEntity() => ReferralInfoEntity(
        referralCode: referralCode,
        referralLink: referralLink,
        totalReferrals: totalReferrals,
        referrals: referrals.map((r) => r.toEntity()).toList(),
      );
}
