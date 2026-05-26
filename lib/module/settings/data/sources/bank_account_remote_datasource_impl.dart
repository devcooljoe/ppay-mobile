import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/models/base_response.dart';
import 'package:ppay_mobile/module/settings/data/models/bank_account_model.dart';
import 'package:ppay_mobile/module/settings/data/models/bank_model.dart';
import 'package:ppay_mobile/module/settings/data/models/requests/update_bank_account_request.dart';
import 'package:ppay_mobile/module/settings/data/sources/bank_account_remote_datasource.dart';

@LazySingleton(as: BankAccountRemoteDataSource)
class BankAccountRemoteDataSourceImpl implements BankAccountRemoteDataSource {
  final Dio _dio;
  static const String _baseUrl = '/api/v1';

  BankAccountRemoteDataSourceImpl(this._dio);

  @override
  Future<List<BankModel>> getBanks() async {
    final response = await _dio.get('$_baseUrl/bank-accounts/banks');
    final baseResponse = BaseResponse<List<dynamic>>.fromJson(
      response.data,
      (data) => data as List<dynamic>,
    );
    return baseResponse.data!
        .map((e) => BankModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<BankAccountModel>> getBankAccounts() async {
    final response = await _dio.get('$_baseUrl/bank-accounts');
    final baseResponse = BaseResponse<List<dynamic>>.fromJson(
      response.data,
      (data) => data as List<dynamic>,
    );
    return baseResponse.data!
        .map((e) => BankAccountModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<void> updateBankAccount(String id, UpdateBankAccountRequest request) async {
    await _dio.put('$_baseUrl/bank-accounts/$id', data: request.toJson());
  }

  @override
  Future<void> deleteBankAccount(String id) async {
    await _dio.delete('$_baseUrl/bank-accounts/$id');
  }
}
