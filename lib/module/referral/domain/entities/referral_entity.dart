class ReferralItemEntity {
  final String id;
  final String name;
  final String email;
  final String joinedAt;

  const ReferralItemEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.joinedAt,
  });
}

class ReferralInfoEntity {
  final String? referralCode;
  final String? referralLink;
  final int totalReferrals;
  final List<ReferralItemEntity> referrals;

  const ReferralInfoEntity({
    required this.referralCode,
    required this.referralLink,
    required this.totalReferrals,
    required this.referrals,
  });
}
