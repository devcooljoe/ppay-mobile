import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/auth/domain/repositories/user_repository.dart';

@lazySingleton
class ResetPasswordUseCase {
  final UserRepository _repository;

  ResetPasswordUseCase(this._repository);

  Future<Either<Failure, void>> call({
    required String resetToken,
    required String password,
    required String confirmPassword,
  }) => _repository.resetPassword(
    resetToken: resetToken,
    password: password,
    confirmPassword: confirmPassword,
  );
}
