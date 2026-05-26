import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/models/base_response.dart';
import 'package:ppay_mobile/module/kyc/data/models/kyc_document_type_model.dart';
import 'package:ppay_mobile/module/kyc/data/models/profile_picture_model.dart';
import 'package:ppay_mobile/module/kyc/data/models/requests/update_profile_request.dart';
import 'package:ppay_mobile/module/kyc/data/models/requests/verify_bvn_request.dart';
import 'package:ppay_mobile/module/kyc/data/models/requests/verify_kyc_request.dart';
import 'package:ppay_mobile/module/kyc/data/models/user_model.dart';
import 'package:ppay_mobile/module/kyc/data/sources/kyc_remote_datasource.dart';

@LazySingleton(as: KycRemoteDataSource)
class KycRemoteDataSourceImpl implements KycRemoteDataSource {
  final Dio _dio;
  static const String _baseUrl = '/api/v1';

  KycRemoteDataSourceImpl(this._dio);

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
  Future<List<KycDocumentTypeModel>> getKycDocumentTypes() async {
    final response = await _dio.get('$_baseUrl/users/kyc-document-types');
    final baseResponse = BaseResponse<List<dynamic>>.fromJson(
      response.data,
      (data) => data as List<dynamic>,
    );
    return baseResponse.data!
        .map((e) => KycDocumentTypeModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<void> verifyBvn(VerifyBvnRequest request) async {
    await _dio.post('$_baseUrl/users/verify-bvn', data: request.toJson());
  }

  @override
  Future<void> verifyKyc(VerifyKycRequest request) async {
    await _dio.post('$_baseUrl/users/verify-kyc', data: request.toJson());
  }

  @override
  Future<ProfilePictureModel> uploadProfilePicture(String filePath) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(filePath),
    });
    final response = await _dio.post('$_baseUrl/users/profile-picture', data: formData);
    final baseResponse = BaseResponse<ProfilePictureModel>.fromJson(
      response.data,
      (data) => ProfilePictureModel.fromJson(data as Map<String, dynamic>),
    );
    return baseResponse.data!;
  }

  @override
  Future<void> updateProfile(UpdateProfileRequest request) async {
    await _dio.patch('$_baseUrl/users/profile', data: request.toJson());
  }
}
