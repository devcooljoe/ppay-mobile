import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';
import 'package:mime/mime.dart';
import 'package:ppay_mobile/core/models/base_response.dart';
import 'package:ppay_mobile/module/virtual_card/data/models/dollar_card_model.dart';
import 'package:ppay_mobile/module/virtual_card/data/models/dollar_card_transaction_model.dart';
import 'package:ppay_mobile/module/virtual_card/data/models/requests/fund_dollar_card_request.dart';
import 'package:ppay_mobile/module/virtual_card/data/models/requests/withdraw_dollar_card_request.dart';
import 'package:ppay_mobile/module/virtual_card/data/sources/dollar_card_remote_datasource.dart';

@LazySingleton(as: DollarCardRemoteDataSource)
class DollarCardRemoteDataSourceImpl implements DollarCardRemoteDataSource {
  final Dio _dio;
  static const String _baseUrl = '/api/v1';

  DollarCardRemoteDataSourceImpl(this._dio);

  @override
  Future<void> createDollarCard({
    required String street,
    required String city,
    required String state,
    required String country,
    required String postalCode,
    required File photo,
  }) async {
    final mimeType = lookupMimeType(photo.path) ?? 'image/jpeg';
    final mimeParts = mimeType.split('/');
    final formData = FormData.fromMap({
      'street': street,
      'city': city,
      'state': state,
      'country': country,
      'postalCode': postalCode,
      'file': await MultipartFile.fromFile(
        photo.path,
        filename: photo.path.split('/').last,
        contentType: MediaType(mimeParts[0], mimeParts[1]),
      ),
    });
    await _dio.post('$_baseUrl/wallet/dollar-card', data: formData);
  }

  @override
  Future<DollarCardModel> getDollarCard() async {
    final response = await _dio.get('$_baseUrl/wallet/dollar-card');
    final baseResponse = BaseResponse<DollarCardModel>.fromJson(
      response.data,
      (data) => DollarCardModel.fromJson(data as Map<String, dynamic>),
    );
    return baseResponse.data!;
  }

  @override
  Future<void> fundDollarCard(FundDollarCardRequest request) async {
    await _dio.post('$_baseUrl/wallet/dollar-card/fund', data: request.toJson());
  }

  @override
  Future<void> withdrawDollarCard(WithdrawDollarCardRequest request) async {
    await _dio.post('$_baseUrl/wallet/dollar-card/withdraw', data: request.toJson());
  }

  @override
  Future<List<DollarCardTransactionModel>> getDollarCardTransactions() async {
    final response = await _dio.get('$_baseUrl/wallet/dollar-card/transactions');
    final baseResponse = BaseResponse<List<dynamic>>.fromJson(
      response.data,
      (data) => data as List<dynamic>,
    );
    return baseResponse.data!
        .map((e) => DollarCardTransactionModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<void> freezeDollarCard() async {
    await _dio.patch('$_baseUrl/wallet/dollar-card/freeze');
  }

  @override
  Future<void> unfreezeDollarCard() async {
    await _dio.patch('$_baseUrl/wallet/dollar-card/unfreeze');
  }

  @override
  Future<void> terminateDollarCard() async {
    await _dio.put('$_baseUrl/wallet/dollar-card/terminate');
  }
}
