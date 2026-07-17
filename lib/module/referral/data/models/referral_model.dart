import 'package:ppay_mobile/module/referral/domain/entities/referral_entity.dart';

class ReferralItemModel {
  final String id;
  final String name;
  final String email;
  final bool pointsAwarded;
  final String joinedAt;

  const ReferralItemModel({
    required this.id,
    required this.name,
    required this.email,
    required this.pointsAwarded,
    required this.joinedAt,
  });

  factory ReferralItemModel.fromJson(Map<String, dynamic> json) {
    return ReferralItemModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      pointsAwarded: json['pointsAwarded'] as bool? ?? false,
      joinedAt: json['joinedAt'] as String,
    );
  }

  ReferralItemEntity toEntity() => ReferralItemEntity(
        id: id,
        name: name,
        email: email,
        pointsAwarded: pointsAwarded,
        joinedAt: joinedAt,
      );
}

class ReferralInfoModel {
  final String? referralCode;
  final int totalReferrals;
  final int pointsBalance;
  final int pointsPerReferral;
  final int minimumWithdrawalPoints;
  final List<ReferralItemModel> referrals;

  const ReferralInfoModel({
    required this.referralCode,
    required this.totalReferrals,
    required this.pointsBalance,
    required this.pointsPerReferral,
    required this.minimumWithdrawalPoints,
    required this.referrals,
  });

  factory ReferralInfoModel.fromJson(Map<String, dynamic> json) {
    return ReferralInfoModel(
      referralCode: json['referralCode'] as String?,
      totalReferrals: (json['totalReferrals'] as num).toInt(),
      pointsBalance: (json['pointsBalance'] as num?)?.toInt() ?? 0,
      pointsPerReferral: (json['pointsPerReferral'] as num?)?.toInt() ?? 0,
      minimumWithdrawalPoints: (json['minimumWithdrawalPoints'] as num?)?.toInt() ?? 0,
      referrals: (json['referrals'] as List<dynamic>)
          .map((e) => ReferralItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  ReferralInfoEntity toEntity() => ReferralInfoEntity(
        referralCode: referralCode,
        totalReferrals: totalReferrals,
        pointsBalance: pointsBalance,
        pointsPerReferral: pointsPerReferral,
        minimumWithdrawalPoints: minimumWithdrawalPoints,
        referrals: referrals.map((r) => r.toEntity()).toList(),
      );
}
