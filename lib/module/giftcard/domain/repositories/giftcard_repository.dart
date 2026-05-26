import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/core/models/base_response.dart';
import 'package:ppay_mobile/module/giftcard/data/models/giftcard_model.dart';
import 'package:ppay_mobile/module/giftcard/data/models/requests/giftcard_request.dart';
import 'package:ppay_mobile/module/giftcard/domain/entities/giftcard_entity.dart';

abstract class GiftcardRemoteDataSource {
  Future<List<BuyGiftcardRateModel>> getBuyGiftcardRates();
  Future<List<SellGiftcardRateModel>> getSellGiftcardRates();
  Future<void> buyGiftcard(BuyGiftcardRequest request);
  Future<void> sellGiftcard({
    required String type,
    required String country,
    required String subcategoryId,
    required double amount,
    String? ecode,
    List<String>? cardImagePaths,
  });
}

@LazySingleton(as: GiftcardRemoteDataSource)
class GiftcardRemoteDataSourceImpl implements GiftcardRemoteDataSource {
  final Dio _dio;
  static const String _baseUrl = '/api/v1';

  GiftcardRemoteDataSourceImpl(this._dio);

  @override
  Future<List<BuyGiftcardRateModel>> getBuyGiftcardRates() async {
    final response = await _dio.get('$_baseUrl/giftcard/buy/rates');
    final baseResponse = BaseResponse<List<dynamic>>.fromJson(
      response.data,
      (data) => data as List<dynamic>,
    );
    return baseResponse.data!
        .map((e) => BuyGiftcardRateModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<SellGiftcardRateModel>> getSellGiftcardRates() async {
    final response = await _dio.get('$_baseUrl/giftcard/sell/rates');
    final baseResponse = BaseResponse<List<dynamic>>.fromJson(
      response.data,
      (data) => data as List<dynamic>,
    );
    return baseResponse.data!
        .map((e) => SellGiftcardRateModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<void> buyGiftcard(BuyGiftcardRequest request) async {
    await _dio.post('$_baseUrl/giftcard/buy', data: request.toJson());
  }

  @override
  Future<void> sellGiftcard({
    required String type,
    required String country,
    required String subcategoryId,
    required double amount,
    String? ecode,
    List<String>? cardImagePaths,
  }) async {
    final formData = FormData.fromMap({
      'type': type,
      'country': country,
      'subcategoryId': subcategoryId,
      'amount': amount,
      if (ecode != null) 'ecode': ecode,
    });

    if (cardImagePaths != null && cardImagePaths.isNotEmpty) {
      for (var i = 0; i < cardImagePaths.length; i++) {
        formData.files.add(MapEntry(
          'cardImages',
          await MultipartFile.fromFile(cardImagePaths[i]),
        ));
      }
    }

    await _dio.post('$_baseUrl/giftcard/sell', data: formData);
  }
}

abstract class GiftcardRepository {
  Future<Either<Failure, List<BuyGiftcardRateEntity>>> getBuyGiftcardRates();
  Future<Either<Failure, List<SellGiftcardRateEntity>>> getSellGiftcardRates();
  Future<Either<Failure, void>> buyGiftcard({
    required String identifier,
    required String fullName,
    required String email,
    required String phoneNumber,
    required double amountInUSD,
    required double amountInNaira,
    required String title,
    required String region,
    required double rate,
  });
  Future<Either<Failure, void>> sellGiftcard({
    required String type,
    required String country,
    required String subcategoryId,
    required double amount,
    String? ecode,
    List<String>? cardImagePaths,
  });
}

@LazySingleton(as: GiftcardRepository)
class GiftcardRepositoryImpl implements GiftcardRepository {
  final GiftcardRemoteDataSource _remoteDataSource;

  GiftcardRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<BuyGiftcardRateEntity>>> getBuyGiftcardRates() async {
    try {
      final result = await _remoteDataSource.getBuyGiftcardRates();
      return Right(result.map((e) => e.toEntity()).toList());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, List<SellGiftcardRateEntity>>> getSellGiftcardRates() async {
    try {
      final result = await _remoteDataSource.getSellGiftcardRates();
      return Right(result.map((e) => e.toEntity()).toList());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, void>> buyGiftcard({
    required String identifier,
    required String fullName,
    required String email,
    required String phoneNumber,
    required double amountInUSD,
    required double amountInNaira,
    required String title,
    required String region,
    required double rate,
  }) async {
    try {
      await _remoteDataSource.buyGiftcard(
        BuyGiftcardRequest(
          identifier: identifier,
          fullName: fullName,
          email: email,
          phoneNumber: phoneNumber,
          amountInUSD: amountInUSD,
          amountInNaira: amountInNaira,
          title: title,
          region: region,
          rate: rate,
        ),
      );
      return const Right(null);
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, void>> sellGiftcard({
    required String type,
    required String country,
    required String subcategoryId,
    required double amount,
    String? ecode,
    List<String>? cardImagePaths,
  }) async {
    try {
      await _remoteDataSource.sellGiftcard(
        type: type,
        country: country,
        subcategoryId: subcategoryId,
        amount: amount,
        ecode: ecode,
        cardImagePaths: cardImagePaths,
      );
      return const Right(null);
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }
}
