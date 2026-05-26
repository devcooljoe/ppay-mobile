import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/kyc/domain/repositories/kyc_repository.dart';

@lazySingleton
class VerifyBvnUseCase {
  final KycRepository _repository;

  VerifyBvnUseCase(this._repository);

  Future<Either<Failure, void>> call({
    required String bvnNumber,
    required String dob,
  }) => _repository.verifyBvn(bvnNumber: bvnNumber, dob: dob);
}
