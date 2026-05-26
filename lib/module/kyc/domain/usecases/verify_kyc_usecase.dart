import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/kyc/domain/repositories/kyc_repository.dart';

@lazySingleton
class VerifyKycUseCase {
  final KycRepository _repository;

  VerifyKycUseCase(this._repository);

  Future<Either<Failure, void>> call({
    required String idType,
    required String idNumber,
  }) => _repository.verifyKyc(idType: idType, idNumber: idNumber);
}
