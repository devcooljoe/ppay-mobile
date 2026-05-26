import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/models/base_response.dart';
import 'package:ppay_mobile/module/transaction/data/models/name_enquiry_model.dart';
import 'package:ppay_mobile/module/transaction/data/models/requests/name_enquiry_request.dart';
import 'package:ppay_mobile/module/transaction/data/models/requests/withdraw_request.dart';
import 'package:ppay_mobile/module/transaction/data/models/wallet_model.dart';
import 'package:ppay_mobile/module/transaction/data/sources/wallet_remote_datasource.dart';

@LazySingleton(as: WalletRemoteDataSource)
class WalletRemoteDataSourceImpl implements WalletRemoteDataSource {
  final Dio _dio;
  static const String _baseUrl = '/api/v1';

  WalletRemoteDataSourceImpl(this._dio);

  @override
  Future<WalletModel> getWallet() async {
    final response = await _dio.get('$_baseUrl/wallet');
    final baseResponse = BaseResponse<WalletModel>.fromJson(
      response.data,
      (data) => WalletModel.fromJson(data as Map<String, dynamic>),
    );
    return baseResponse.data!;
  }

  @override
  Future<NameEnquiryModel> nameEnquiry(NameEnquiryRequest request) async {
    final response = await _dio.post('$_baseUrl/wallet/name-enquiry', data: request.toJson());
    final baseResponse = BaseResponse<NameEnquiryModel>.fromJson(
      response.data,
      (data) => NameEnquiryModel.fromJson(data as Map<String, dynamic>),
    );
    return baseResponse.data!;
  }

  @override
  Future<void> withdraw(WithdrawRequest request) async {
    await _dio.post('$_baseUrl/wallet/withdraw', data: request.toJson());
  }
}
