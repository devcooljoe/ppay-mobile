import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/auth/domain/repositories/user_repository.dart';

@lazySingleton
class VerifyEmailOtpUseCase {
  final UserRepository _repository;

  VerifyEmailOtpUseCase(this._repository);

  Future<Either<Failure, void>> call({required String otpCode}) =>
      _repository.verifyEmailOtp(otpCode: otpCode);
}
