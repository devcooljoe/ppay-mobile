import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/referral/domain/repositories/referral_repository.dart';

@lazySingleton
class WithdrawPointsUseCase {
  final ReferralRepository _repository;

  WithdrawPointsUseCase(this._repository);

  Future<Either<Failure, void>> call() => _repository.withdrawPoints();
}
