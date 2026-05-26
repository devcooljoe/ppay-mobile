import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/auth/domain/repositories/user_repository.dart';

@lazySingleton
class VerifyPhoneOtpUseCase {
  final UserRepository _repository;

  VerifyPhoneOtpUseCase(this._repository);

  Future<Either<Failure, void>> call({required String otpCode}) =>
      _repository.verifyPhoneOtp(otpCode: otpCode);
}
