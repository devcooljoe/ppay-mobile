import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/auth/domain/repositories/user_repository.dart';

@lazySingleton
class ResetPinUseCase {
  final UserRepository _repository;

  ResetPinUseCase(this._repository);

  Future<Either<Failure, void>> call({
    required String resetToken,
    required String pin,
    required String confirmPin,
  }) => _repository.resetPin(
    resetToken: resetToken,
    pin: pin,
    confirmPin: confirmPin,
  );
}
