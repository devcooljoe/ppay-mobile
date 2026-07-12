import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/auth/domain/repositories/user_repository.dart';

@lazySingleton
class VerifyPinUseCase {
  final UserRepository _repository;

  VerifyPinUseCase(this._repository);

  Future<Either<Failure, void>> call({required String pin}) =>
      _repository.verifyPin(pin: pin);
}
