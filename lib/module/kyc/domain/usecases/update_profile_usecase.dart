import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/kyc/domain/repositories/kyc_repository.dart';

@lazySingleton
class UpdateProfileUseCase {
  final KycRepository _repository;

  UpdateProfileUseCase(this._repository);

  Future<Either<Failure, void>> call({
    String? fullName,
    String? dob,
  }) => _repository.updateProfile(fullName: fullName, dob: dob);
}
