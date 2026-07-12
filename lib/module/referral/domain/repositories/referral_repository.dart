import 'package:dartz/dartz.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/referral/domain/entities/referral_entity.dart';

abstract class ReferralRepository {
  Future<Either<Failure, ReferralInfoEntity>> getMyReferrals();
}
