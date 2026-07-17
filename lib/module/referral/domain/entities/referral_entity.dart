class ReferralItemEntity {
  final String id;
  final String name;
  final String email;
  final bool pointsAwarded;
  final String joinedAt;

  const ReferralItemEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.pointsAwarded,
    required this.joinedAt,
  });
}

class ReferralInfoEntity {
  final String? referralCode;
  final int totalReferrals;
  final int pointsBalance;
  final int pointsPerReferral;
  final int minimumWithdrawalPoints;
  final List<ReferralItemEntity> referrals;

  const ReferralInfoEntity({
    required this.referralCode,
    required this.totalReferrals,
    required this.pointsBalance,
    required this.pointsPerReferral,
    required this.minimumWithdrawalPoints,
    required this.referrals,
  });
}
