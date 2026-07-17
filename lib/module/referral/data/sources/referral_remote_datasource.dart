import 'package:ppay_mobile/module/referral/data/models/referral_model.dart';

abstract class ReferralRemoteDataSource {
  Future<ReferralInfoModel> getMyReferrals();
  Future<void> withdrawPoints();
}
