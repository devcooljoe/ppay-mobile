import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/models/base_response.dart';
import 'package:ppay_mobile/module/referral/data/models/referral_model.dart';
import 'package:ppay_mobile/module/referral/data/sources/referral_remote_datasource.dart';

@LazySingleton(as: ReferralRemoteDataSource)
class ReferralRemoteDataSourceImpl implements ReferralRemoteDataSource {
  final Dio _dio;
  static const String _baseUrl = '/api/v1';

  ReferralRemoteDataSourceImpl(this._dio);

  @override
  Future<ReferralInfoModel> getMyReferrals() async {
    final response = await _dio.get('$_baseUrl/referrals/my-referrals');
    final baseResponse = BaseResponse<ReferralInfoModel>.fromJson(
      response.data,
      (data) => ReferralInfoModel.fromJson(data as Map<String, dynamic>),
    );
    return baseResponse.data!;
  }
}
