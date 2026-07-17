
import 'package:ppay_mobile/module/auth/data/models/auth_model.dart';
import 'package:ppay_mobile/module/auth/data/models/requests/change_password_request.dart';
import 'package:ppay_mobile/module/auth/data/models/requests/forgot_password_request.dart';
import 'package:ppay_mobile/module/auth/data/models/requests/login_request.dart';
import 'package:ppay_mobile/module/auth/data/models/requests/register_request.dart';
import 'package:ppay_mobile/module/auth/data/models/requests/reset_password_request.dart';
import 'package:ppay_mobile/module/auth/data/models/requests/reset_pin_request.dart';
import 'package:ppay_mobile/module/auth/data/models/requests/set_pin_request.dart';
import 'package:ppay_mobile/module/auth/data/models/requests/verify_forgot_password_otp_request.dart';
import 'package:ppay_mobile/module/auth/data/models/requests/verify_otp_request.dart';
import 'package:ppay_mobile/module/auth/data/models/reset_token_model.dart';
import 'package:ppay_mobile/module/auth/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<AuthModel> register(RegisterRequest request);
  Future<AuthModel> login(LoginRequest request);
  Future<UserModel> getUser();
  Future<void> verifyEmailOtp(VerifyOtpRequest request);
  Future<void> verifyPhoneOtp(VerifyOtpRequest request);
  Future<void> resendEmailOtp();
  Future<void> resendPhoneOtp();
  Future<void> forgotPassword(ForgotPasswordRequest request);
  Future<ResetTokenModel> verifyForgotPasswordOtp(VerifyForgotPasswordOtpRequest request);
  Future<void> resetPassword(ResetPasswordRequest request);
  Future<void> setPin(SetPinRequest request);
  Future<void> changePassword(ChangePasswordRequest request);
  Future<void> forgotPin();
  Future<ResetTokenModel> verifyForgotPinOtp(VerifyOtpRequest request);
  Future<void> resetPin(ResetPinRequest request);
  Future<void> verifyPin(String pin);
  Future<void> verifyPassword(String password);
}
