import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/models/base_response.dart';
import 'package:ppay_mobile/module/bills/data/models/bill_model.dart';
import 'package:ppay_mobile/module/bills/data/models/requests/bill_request.dart';
import 'package:ppay_mobile/module/bills/data/sources/bill_payment_remote_datasource.dart';

@LazySingleton(as: BillPaymentRemoteDataSource)
class BillPaymentRemoteDataSourceImpl implements BillPaymentRemoteDataSource {
  final Dio _dio;
  static const String _baseUrl = '/api/v1';

  BillPaymentRemoteDataSourceImpl(this._dio);

  @override
  Future<List<BillerModel>> getAirtimeBillers() async {
    final response = await _dio.get('$_baseUrl/bill-payment/airtime');
    final baseResponse = BaseResponse<List<dynamic>>.fromJson(
      response.data,
      (data) => data as List<dynamic>,
    );
    return baseResponse.data!
        .map((e) => BillerModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<BillerModel>> getDataBillers() async {
    final response = await _dio.get('$_baseUrl/bill-payment/data');
    final baseResponse = BaseResponse<List<dynamic>>.fromJson(
      response.data,
      (data) => data as List<dynamic>,
    );
    return baseResponse.data!
        .map((e) => BillerModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<BillerModel>> getElectricityBillers() async {
    final response = await _dio.get('$_baseUrl/bill-payment/electricity');
    final baseResponse = BaseResponse<List<dynamic>>.fromJson(
      response.data,
      (data) => data as List<dynamic>,
    );
    return baseResponse.data!
        .map((e) => BillerModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<BillerModel>> getBettingBillers() async {
    final response = await _dio.get('$_baseUrl/bill-payment/betting');
    final baseResponse = BaseResponse<List<dynamic>>.fromJson(
      response.data,
      (data) => data as List<dynamic>,
    );
    return baseResponse.data!
        .map((e) => BillerModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<BillerModel>> getTvBillers() async {
    final response = await _dio.get('$_baseUrl/bill-payment/tv');
    final baseResponse = BaseResponse<List<dynamic>>.fromJson(
      response.data,
      (data) => data as List<dynamic>,
    );
    return baseResponse.data!
        .map((e) => BillerModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<CustomerVerificationModel> verifyCustomer(VerifyBillCustomerRequest request) async {
    final response = await _dio.post('$_baseUrl/bill-payment/verify', data: request.toJson());
    final baseResponse = BaseResponse<CustomerVerificationModel>.fromJson(
      response.data,
      (data) => CustomerVerificationModel.fromJson(data as Map<String, dynamic>),
    );
    return baseResponse.data!;
  }

  @override
  Future<BillPurchaseModel> purchaseBill(PurchaseBillRequest request) async {
    final response = await _dio.post('$_baseUrl/bill-payment/purchase', data: request.toJson());
    final baseResponse = BaseResponse<BillPurchaseModel>.fromJson(
      response.data,
      (data) => BillPurchaseModel.fromJson(data as Map<String, dynamic>),
    );
    return baseResponse.data!;
  }
}
