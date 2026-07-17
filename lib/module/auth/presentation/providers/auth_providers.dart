import 'package:ppay_mobile/core/di/injection.dart';
import 'package:ppay_mobile/core/services/token_service.dart';
import 'package:ppay_mobile/module/auth/domain/entities/user_entity.dart';
import 'package:ppay_mobile/module/auth/domain/usecases/change_password_usecase.dart';
import 'package:ppay_mobile/module/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:ppay_mobile/module/auth/domain/usecases/forgot_pin_usecase.dart';
import 'package:ppay_mobile/module/auth/domain/usecases/get_user_usecase.dart';
import 'package:ppay_mobile/module/auth/domain/usecases/login_usecase.dart';
import 'package:ppay_mobile/module/auth/domain/usecases/register_usecase.dart';
import 'package:ppay_mobile/module/auth/domain/usecases/resend_email_otp_usecase.dart';
import 'package:ppay_mobile/module/auth/domain/usecases/resend_phone_otp_usecase.dart';
import 'package:ppay_mobile/module/auth/domain/usecases/reset_password_usecase.dart';
import 'package:ppay_mobile/module/auth/domain/usecases/reset_pin_usecase.dart';
import 'package:ppay_mobile/module/auth/domain/usecases/set_pin_usecase.dart';
import 'package:ppay_mobile/module/auth/domain/usecases/verify_email_otp_usecase.dart';
import 'package:ppay_mobile/module/auth/domain/usecases/verify_forgot_password_otp_usecase.dart';
import 'package:ppay_mobile/module/auth/domain/usecases/verify_forgot_pin_otp_usecase.dart';
import 'package:ppay_mobile/module/auth/domain/usecases/verify_phone_otp_usecase.dart';
import 'package:ppay_mobile/module/auth/domain/usecases/verify_pin_usecase.dart';
import 'package:ppay_mobile/module/auth/domain/usecases/verify_password_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_providers.g.dart';

@riverpod
class Register extends _$Register {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> call({
    required String fullName,
    required String emailAddress,
    required String phoneNumber,
    required String password,
    required String confirmPassword,
    String? deviceToken,
    String? referralCode,
  }) async {
    state = const AsyncValue.loading();
    final result = await getIt<RegisterUseCase>()(
      fullName: fullName,
      emailAddress: emailAddress,
      phoneNumber: phoneNumber,
      password: password,
      confirmPassword: confirmPassword,
      deviceToken: deviceToken,
      referralCode: referralCode,
    );
    result.fold(
      (l) => state = AsyncValue.error(l.message, StackTrace.current),
      (authEntity) async {
        await getIt<TokenService>().saveToken(authEntity.token);
        await ref.read(authenticatedUserProvider.notifier).call();
        state = const AsyncValue.data(null);
      },
    );
  }
}

@riverpod
class Login extends _$Login {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> call({
    required String emailAddress,
    required String password,
    String? deviceToken,
  }) async {
    state = const AsyncValue.loading();
    final tokenService = getIt<TokenService>();

    final result = await getIt<LoginUseCase>()(
      emailAddress: emailAddress,
      password: password,
      deviceToken: deviceToken,
    );
    result.fold(
      (l) => state = AsyncValue.error(l.message, StackTrace.current),
      (authEntity) async {
        await tokenService.saveToken(authEntity.token);
        await tokenService.saveEmail(emailAddress);
        await ref.read(authenticatedUserProvider.notifier).call();
        state = const AsyncValue.data(null);
      },
    );
  }
}

@riverpod
class VerifyPhoneOtp extends _$VerifyPhoneOtp {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> call({required String otpCode}) async {
    state = const AsyncValue.loading();
    final result = await getIt<VerifyPhoneOtpUseCase>()(otpCode: otpCode);
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (_) => const AsyncValue.data(null),
    );
  }
}

@riverpod
class VerifyEmailOtp extends _$VerifyEmailOtp {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> call({required String otpCode}) async {
    state = const AsyncValue.loading();
    final result = await getIt<VerifyEmailOtpUseCase>()(otpCode: otpCode);
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (_) => const AsyncValue.data(null),
    );
  }
}

@riverpod
class ResendPhoneOtp extends _$ResendPhoneOtp {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> call() async {
    state = const AsyncValue.loading();
    final result = await getIt<ResendPhoneOtpUseCase>()();
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (_) => const AsyncValue.data(null),
    );
  }
}

@riverpod
class ResendEmailOtp extends _$ResendEmailOtp {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> call() async {
    state = const AsyncValue.loading();
    final result = await getIt<ResendEmailOtpUseCase>()();
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (_) => const AsyncValue.data(null),
    );
  }
}

@riverpod
class SetPin extends _$SetPin {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> call({required String pin, required String confirmPin}) async {
    state = const AsyncValue.loading();
    final result = await getIt<SetPinUseCase>()(pin: pin, confirmPin: confirmPin);
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (_) => const AsyncValue.data(null),
    );
  }
}

@riverpod
class ForgotPassword extends _$ForgotPassword {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> call({required String emailAddress}) async {
    state = const AsyncValue.loading();
    final result = await getIt<ForgotPasswordUseCase>()(emailAddress: emailAddress);
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (_) => const AsyncValue.data(null),
    );
  }
}

@riverpod
class VerifyForgotPasswordOtp extends _$VerifyForgotPasswordOtp {
  @override
  AsyncValue<String?> build() => const AsyncValue.data(null);

  Future<void> call({required String emailAddress, required String otpCode}) async {
    state = const AsyncValue.loading();
    final result = await getIt<VerifyForgotPasswordOtpUseCase>()(
      emailAddress: emailAddress,
      otpCode: otpCode,
    );
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (resetToken) => AsyncValue.data(resetToken),
    );
  }
}

@riverpod
class ResetPassword extends _$ResetPassword {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> call({
    required String resetToken,
    required String password,
    required String confirmPassword,
  }) async {
    state = const AsyncValue.loading();
    final result = await getIt<ResetPasswordUseCase>()(
      resetToken: resetToken,
      password: password,
      confirmPassword: confirmPassword,
    );
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (_) => const AsyncValue.data(null),
    );
  }
}

@riverpod
class ForgotPin extends _$ForgotPin {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> call() async {
    state = const AsyncValue.loading();
    final result = await getIt<ForgotPinUseCase>()();
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (_) => const AsyncValue.data(null),
    );
  }
}

@riverpod
class VerifyForgotPinOtp extends _$VerifyForgotPinOtp {
  @override
  AsyncValue<String?> build() => const AsyncValue.data(null);

  Future<void> call({required String otpCode}) async {
    state = const AsyncValue.loading();
    final result = await getIt<VerifyForgotPinOtpUseCase>()(
      otpCode: otpCode,
    );
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (resetToken) => AsyncValue.data(resetToken),
    );
  }
}

@riverpod
class ResetPin extends _$ResetPin {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> call({
    required String resetToken,
    required String pin,
    required String confirmPin,
  }) async {
    state = const AsyncValue.loading();
    final result = await getIt<ResetPinUseCase>()(
      resetToken: resetToken,
      pin: pin,
      confirmPin: confirmPin,
    );
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (_) => const AsyncValue.data(null),
    );
  }
}

@riverpod
class ChangePassword extends _$ChangePassword {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> call({
    required String currentPassword,
    required String newPassword,
    required String confirmNewPassword,
  }) async {
    state = const AsyncValue.loading();
    final result = await getIt<ChangePasswordUseCase>()(
      currentPassword: currentPassword,
      newPassword: newPassword,
      confirmNewPassword: confirmNewPassword,
    );
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (_) => const AsyncValue.data(null),
    );
  }
}

@Riverpod(keepAlive: true)
class AuthenticatedUser extends _$AuthenticatedUser {
  @override
  AsyncValue<UserEntity?> build() => const AsyncValue.data(null);

  Future<void> call() async {
    state = const AsyncValue.loading();
    final result = await getIt<GetUserUseCase>()();
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (user) => AsyncValue.data(user),
    );
  }

  Future<void> silentRefresh() async {
    final result = await getIt<GetUserUseCase>()();
    result.fold(
      (l) => null,
      (user) => state = AsyncValue.data(user),
    );
  }

  void updateUser(UserEntity user) {
    state = AsyncValue.data(user);
  }
}

@riverpod
class VerifyPin extends _$VerifyPin {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<bool> call({required String pin}) async {
    state = const AsyncValue.loading();
    final result = await getIt<VerifyPinUseCase>()(pin: pin);
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (_) => const AsyncValue.data(null),
    );
    return result.isRight();
  }
}

@riverpod
class VerifyPassword extends _$VerifyPassword {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<bool> call({required String password}) async {
    state = const AsyncValue.loading();
    final result = await getIt<VerifyPasswordUseCase>()(password: password);
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (_) => const AsyncValue.data(null),
    );
    return result.isRight();
  }
}
