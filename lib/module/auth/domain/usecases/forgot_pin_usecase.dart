import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/auth/domain/repositories/user_repository.dart';

@lazySingleton
class ForgotPinUseCase {
  final UserRepository _repository;

  ForgotPinUseCase(this._repository);

  Future<Either<Failure, void>> call() => _repository.forgotPin();
}
