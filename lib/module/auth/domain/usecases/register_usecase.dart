import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/auth/domain/entities/auth_entity.dart';
import 'package:ppay_mobile/module/auth/domain/repositories/user_repository.dart';

@lazySingleton
class RegisterUseCase {
  final UserRepository _repository;

  RegisterUseCase(this._repository);

  Future<Either<Failure, AuthEntity>> call({
    required String fullName,
    required String emailAddress,
    required String phoneNumber,
    required String password,
    required String confirmPassword,
    String? deviceToken,
    String? referralCode,
  }) => _repository.register(
    fullName: fullName,
    emailAddress: emailAddress,
    phoneNumber: phoneNumber,
    password: password,
    confirmPassword: confirmPassword,
    deviceToken: deviceToken,
    referralCode: referralCode,
  );
}
