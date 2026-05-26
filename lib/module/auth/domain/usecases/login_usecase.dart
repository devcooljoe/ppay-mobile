import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/auth/domain/entities/auth_entity.dart';
import 'package:ppay_mobile/module/auth/domain/repositories/user_repository.dart';

@lazySingleton
class LoginUseCase {
  final UserRepository _repository;

  LoginUseCase(this._repository);

  Future<Either<Failure, AuthEntity>> call({
    required String emailAddress,
    required String password,
    String? deviceToken,
  }) => _repository.login(
    emailAddress: emailAddress,
    password: password,
    deviceToken: deviceToken,
  );
}
