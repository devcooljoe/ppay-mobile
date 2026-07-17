import 'package:dartz/dartz.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/auth/domain/entities/auth_entity.dart';
import 'package:ppay_mobile/module/auth/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, AuthEntity>> register({
    required String fullName,
    required String emailAddress,
    required String phoneNumber,
    required String password,
    required String confirmPassword,
    String? deviceToken,
    String? referralCode,
  });

  Future<Either<Failure, AuthEntity>> login({
    required String emailAddress,
    required String password,
    String? deviceToken,
  });

  Future<Either<Failure, UserEntity>> getUser();
  Future<Either<Failure, void>> verifyEmailOtp({required String otpCode});
  Future<Either<Failure, void>> verifyPhoneOtp({required String otpCode});
  Future<Either<Failure, void>> resendEmailOtp();
  Future<Either<Failure, void>> resendPhoneOtp();
  Future<Either<Failure, void>> forgotPassword({required String emailAddress});
  Future<Either<Failure, String>> verifyForgotPasswordOtp({
    required String emailAddress,
    required String otpCode,
  });
  Future<Either<Failure, void>> resetPassword({
    required String resetToken,
    required String password,
    required String confirmPassword,
  });
  Future<Either<Failure, void>> setPin({
    required String pin,
    required String confirmPin,
  });
  Future<Either<Failure, void>> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmNewPassword,
  });
  Future<Either<Failure, void>> forgotPin();
  Future<Either<Failure, String>> verifyForgotPinOtp({required String otpCode});
  Future<Either<Failure, void>> resetPin({
    required String resetToken,
    required String pin,
    required String confirmPin,
  });
  Future<Either<Failure, void>> verifyPin({required String pin});
  Future<Either<Failure, void>> verifyPassword({required String password});
}
