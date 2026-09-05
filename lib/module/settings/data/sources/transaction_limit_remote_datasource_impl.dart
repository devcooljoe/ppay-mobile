import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/models/base_response.dart';
import 'package:ppay_mobile/module/settings/data/models/transaction_limit_model.dart';
import 'package:ppay_mobile/module/settings/data/sources/transaction_limit_remote_datasource.dart';

@LazySingleton(as: TransactionLimitRemoteDataSource)
class TransactionLimitRemoteDataSourceImpl implements TransactionLimitRemoteDataSource {
  final Dio _dio;
  static const String _baseUrl = '/api/v1';

  TransactionLimitRemoteDataSourceImpl(this._dio);

  @override
  Future<TransactionLimitsModel> getTransactionLimits() async {
    final response = await _dio.get('$_baseUrl/users/transaction-limits');
    final baseResponse = BaseResponse<TransactionLimitsModel>.fromJson(
      response.data,
      (data) => TransactionLimitsModel.fromJson(data as Map<String, dynamic>),
    );
    return baseResponse.data!;
  }
}
