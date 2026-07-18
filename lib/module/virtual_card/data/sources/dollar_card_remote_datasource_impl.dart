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
  static const String _base = '/api/v1/wallet';

  DollarCardRemoteDataSourceImpl(this._dio);

  @override
  Future<void> createDollarCard({
    required String street,
    required String city,
    required String state,
    required String postalCode,
    required File photo,
    required File ninPhoto,
  }) async {
    final mimeType = lookupMimeType(photo.path) ?? 'image/jpeg';
    final mp = mimeType.split('/');
    final ninMimeType = lookupMimeType(ninPhoto.path) ?? 'image/jpeg';
    final nmp = ninMimeType.split('/');
    final formData = FormData.fromMap({
      'street': street,
      'city': city,
      'state': state,
      'postalCode': postalCode,
      'photo': await MultipartFile.fromFile(photo.path, filename: photo.path.split('/').last, contentType: MediaType(mp[0], mp[1])),
      'ninPhoto': await MultipartFile.fromFile(ninPhoto.path, filename: ninPhoto.path.split('/').last, contentType: MediaType(nmp[0], nmp[1])),
    });
    await _dio.post('$_base/dollar-card', data: formData);
  }

  @override
  Future<void> addDollarCard({required String brand}) async {
    await _dio.post('$_base/dollar-card/add', data: {'brand': brand});
  }

  @override
  Future<List<DollarCardModel>> getDollarCards() async {
    final response = await _dio.get('$_base/dollar-cards');
    final baseResponse = BaseResponse<List<dynamic>>.fromJson(
      response.data,
      (data) => data as List<dynamic>,
    );
    return baseResponse.data!
        .map((e) => DollarCardModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<DollarCardModel> getDollarCard({required String cardId}) async {
    final response = await _dio.get('$_base/dollar-card/$cardId');
    final baseResponse = BaseResponse<DollarCardModel>.fromJson(
      response.data,
      (data) => DollarCardModel.fromJson(data as Map<String, dynamic>),
    );
    return baseResponse.data!;
  }

  @override
  Future<void> fundDollarCard({required String cardId, required FundDollarCardRequest request}) async {
    await _dio.post('$_base/dollar-card/$cardId/fund', data: request.toJson());
  }

  @override
  Future<void> withdrawDollarCard({required String cardId, required WithdrawDollarCardRequest request}) async {
    await _dio.post('$_base/dollar-card/$cardId/withdraw', data: request.toJson());
  }

  @override
  Future<List<DollarCardTransactionModel>> getDollarCardTransactions({required String cardId}) async {
    final response = await _dio.get('$_base/dollar-card/$cardId/transactions');
    final baseResponse = BaseResponse<List<dynamic>>.fromJson(
      response.data,
      (data) => data as List<dynamic>,
    );
    return baseResponse.data!
        .map((e) => DollarCardTransactionModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<void> freezeDollarCard({required String cardId}) async {
    await _dio.patch('$_base/dollar-card/$cardId/freeze');
  }

  @override
  Future<void> unfreezeDollarCard({required String cardId}) async {
    await _dio.patch('$_base/dollar-card/$cardId/unfreeze');
  }

  @override
  Future<void> terminateDollarCard({required String cardId}) async {
    await _dio.put('$_base/dollar-card/$cardId/terminate');
  }
}
