import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/auth/domain/repositories/user_repository.dart';

@lazySingleton
class VerifyForgotPasswordOtpUseCase {
  final UserRepository _repository;

  VerifyForgotPasswordOtpUseCase(this._repository);

  Future<Either<Failure, String>> call({
    required String emailAddress,
    required String otpCode,
  }) => _repository.verifyForgotPasswordOtp(
    emailAddress: emailAddress,
    otpCode: otpCode,
  );
}
