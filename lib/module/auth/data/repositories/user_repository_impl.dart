import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/auth/data/models/requests/change_password_request.dart';
import 'package:ppay_mobile/module/auth/data/models/requests/forgot_password_request.dart';
import 'package:ppay_mobile/module/auth/data/models/requests/login_request.dart';
import 'package:ppay_mobile/module/auth/data/models/requests/register_request.dart';
import 'package:ppay_mobile/module/auth/data/models/requests/reset_password_request.dart';
import 'package:ppay_mobile/module/auth/data/models/requests/reset_pin_request.dart';
import 'package:ppay_mobile/module/auth/data/models/requests/set_pin_request.dart';
import 'package:ppay_mobile/module/auth/data/models/requests/verify_forgot_password_otp_request.dart';
import 'package:ppay_mobile/module/auth/data/models/requests/verify_otp_request.dart';
import 'package:ppay_mobile/module/auth/data/sources/user_remote_datasource.dart';
import 'package:ppay_mobile/module/auth/domain/entities/auth_entity.dart';
import 'package:ppay_mobile/module/auth/domain/entities/user_entity.dart';
import 'package:ppay_mobile/module/auth/domain/repositories/user_repository.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _remoteDataSource;

  UserRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, AuthEntity>> register({
    required String fullName,
    required String emailAddress,
    required String phoneNumber,
    required String password,
    required String confirmPassword,
    String? deviceToken,
    String? referralCode,
  }) async {
    try {
      final result = await _remoteDataSource.register(
        RegisterRequest(
          fullName: fullName,
          emailAddress: emailAddress,
          phoneNumber: phoneNumber,
          password: password,
          confirmPassword: confirmPassword,
          deviceToken: deviceToken,
          referralCode: referralCode,
        ),
      );
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> login({
    required String emailAddress,
    required String password,
    String? deviceToken,
  }) async {
    try {
      final result = await _remoteDataSource.login(
        LoginRequest(
          emailAddress: emailAddress,
          password: password,
          deviceToken: deviceToken,
        ),
      );
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUser() async {
    try {
      final result = await _remoteDataSource.getUser();
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, void>> verifyEmailOtp({required String otpCode}) async {
    try {
      await _remoteDataSource.verifyEmailOtp(VerifyOtpRequest(otpCode: otpCode));
      return const Right(null);
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, void>> verifyPhoneOtp({required String otpCode}) async {
    try {
      await _remoteDataSource.verifyPhoneOtp(VerifyOtpRequest(otpCode: otpCode));
      return const Right(null);
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, void>> resendEmailOtp() async {
    try {
      await _remoteDataSource.resendEmailOtp();
      return const Right(null);
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, void>> resendPhoneOtp() async {
    try {
      await _remoteDataSource.resendPhoneOtp();
      return const Right(null);
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, void>> forgotPassword({required String emailAddress}) async {
    try {
      await _remoteDataSource.forgotPassword(ForgotPasswordRequest(emailAddress: emailAddress));
      return const Right(null);
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, String>> verifyForgotPasswordOtp({
    required String emailAddress,
    required String otpCode,
  }) async {
    try {
      final result = await _remoteDataSource.verifyForgotPasswordOtp(
        VerifyForgotPasswordOtpRequest(emailAddress: emailAddress, otpCode: otpCode),
      );
      return Right(result.resetToken);
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword({
    required String resetToken,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      await _remoteDataSource.resetPassword(
        ResetPasswordRequest(
          resetToken: resetToken,
          password: password,
          confirmPassword: confirmPassword,
        ),
      );
      return const Right(null);
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, void>> setPin({
    required String pin,
    required String confirmPin,
  }) async {
    try {
      await _remoteDataSource.setPin(SetPinRequest(pin: pin, confirmPin: confirmPin));
      return const Right(null);
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, void>> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmNewPassword,
  }) async {
    try {
      await _remoteDataSource.changePassword(
        ChangePasswordRequest(
          currentPassword: currentPassword,
          newPassword: newPassword,
          confirmNewPassword: confirmNewPassword,
        ),
      );
      return const Right(null);
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, void>> forgotPin() async {
    try {
      await _remoteDataSource.forgotPin();
      return const Right(null);
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, String>> verifyForgotPinOtp({required String otpCode}) async {
    try {
      final result = await _remoteDataSource.verifyForgotPinOtp(VerifyOtpRequest(otpCode: otpCode));
      return Right(result.resetToken);
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, void>> resetPin({
    required String resetToken,
    required String pin,
    required String confirmPin,
  }) async {
    try {
      await _remoteDataSource.resetPin(
        ResetPinRequest(resetToken: resetToken, pin: pin, confirmPin: confirmPin),
      );
      return const Right(null);
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, void>> verifyPin({required String pin}) async {
    try {
      await _remoteDataSource.verifyPin(pin);
      return const Right(null);
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, void>> verifyPassword({required String password}) async {
    try {
      await _remoteDataSource.verifyPassword(password);
      return const Right(null);
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }
}
