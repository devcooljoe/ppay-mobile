import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/referral/domain/entities/referral_entity.dart';
import 'package:ppay_mobile/module/referral/domain/repositories/referral_repository.dart';

@lazySingleton
class GetMyReferralsUseCase {
  final ReferralRepository _repository;

  GetMyReferralsUseCase(this._repository);

  Future<Either<Failure, ReferralInfoEntity>> call() =>
      _repository.getMyReferrals();
}
