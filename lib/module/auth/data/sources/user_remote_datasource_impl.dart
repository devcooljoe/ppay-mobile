import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/models/base_response.dart';
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
import 'package:ppay_mobile/module/auth/data/sources/user_remote_datasource.dart';

@LazySingleton(as: UserRemoteDataSource)
class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio _dio;
  static const String _baseUrl = '/api/v1';

  UserRemoteDataSourceImpl(this._dio);

  @override
  Future<AuthModel> register(RegisterRequest request) async {
    final response = await _dio.post('$_baseUrl/users/register', data: request.toJson());
    final baseResponse = BaseResponse<AuthModel>.fromJson(
      response.data,
      (data) => AuthModel.fromJson(data as Map<String, dynamic>),
    );
    return baseResponse.data!;
  }

  @override
  Future<AuthModel> login(LoginRequest request) async {
    final response = await _dio.post('$_baseUrl/users/login', data: request.toJson());
    final baseResponse = BaseResponse<AuthModel>.fromJson(
      response.data,
      (data) => AuthModel.fromJson(data as Map<String, dynamic>),
    );
    return baseResponse.data!;
  }

  @override
  Future<UserModel> getUser() async {
    final response = await _dio.get('$_baseUrl/users/user');
    final baseResponse = BaseResponse<UserModel>.fromJson(
      response.data,
      (data) => UserModel.fromJson(data as Map<String, dynamic>),
    );
    return baseResponse.data!;
  }

  @override
  Future<void> verifyEmailOtp(VerifyOtpRequest request) async {
    await _dio.post('$_baseUrl/users/verify-email-otp', data: request.toJson());
  }

  @override
  Future<void> verifyPhoneOtp(VerifyOtpRequest request) async {
    await _dio.post('$_baseUrl/users/verify-phone-otp', data: request.toJson());
  }

  @override
  Future<void> resendEmailOtp() async {
    await _dio.post('$_baseUrl/users/resend-email-otp');
  }

  @override
  Future<void> resendPhoneOtp() async {
    await _dio.post('$_baseUrl/users/resend-phone-otp');
  }

  @override
  Future<void> forgotPassword(ForgotPasswordRequest request) async {
    await _dio.post('$_baseUrl/users/forgot-password', data: request.toJson());
  }

  @override
  Future<ResetTokenModel> verifyForgotPasswordOtp(VerifyForgotPasswordOtpRequest request) async {
    final response = await _dio.post('$_baseUrl/users/verify-forgot-password-otp', data: request.toJson());
    final baseResponse = BaseResponse<ResetTokenModel>.fromJson(
      response.data,
      (data) => ResetTokenModel.fromJson(data as Map<String, dynamic>),
    );
    return baseResponse.data!;
  }

  @override
  Future<void> resetPassword(ResetPasswordRequest request) async {
    await _dio.post('$_baseUrl/users/reset-password', data: request.toJson());
  }

  @override
  Future<void> setPin(SetPinRequest request) async {
    await _dio.post('$_baseUrl/users/set-pin', data: request.toJson());
  }

  @override
  Future<void> changePassword(ChangePasswordRequest request) async {
    await _dio.post('$_baseUrl/users/change-password', data: request.toJson());
  }

  @override
  Future<void> forgotPin() async {
    await _dio.post('$_baseUrl/users/forgot-pin');
  }

  @override
  Future<ResetTokenModel> verifyForgotPinOtp(VerifyOtpRequest request) async {
    final response = await _dio.post('$_baseUrl/users/verify-forgot-pin-otp', data: request.toJson());
    final baseResponse = BaseResponse<ResetTokenModel>.fromJson(
      response.data,
      (data) => ResetTokenModel.fromJson(data as Map<String, dynamic>),
    );
    return baseResponse.data!;
  }

  @override
  Future<void> resetPin(ResetPinRequest request) async {
    await _dio.post('$_baseUrl/users/reset-pin', data: request.toJson());
  }
}
