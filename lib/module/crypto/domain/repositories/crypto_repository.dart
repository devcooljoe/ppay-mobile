import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/core/models/base_response.dart';
import 'package:ppay_mobile/module/crypto/data/models/crypto_model.dart';
import 'package:ppay_mobile/module/crypto/data/models/requests/crypto_request.dart';
import 'package:ppay_mobile/module/crypto/domain/entities/crypto_entity.dart';

abstract class CryptoRemoteDataSource {
  Future<List<CryptoRateModel>> getCryptoRates();
  Future<EstimatedAssetValueModel> getEstimatedAssetValue();
  Future<CryptoWalletModel> getCryptoWallet(String currency, {String? network});
  Future<void> buyCrypto(BuyCryptoRequest request);
  Future<void> sellCrypto(SellCryptoRequest request);
}

@LazySingleton(as: CryptoRemoteDataSource)
class CryptoRemoteDataSourceImpl implements CryptoRemoteDataSource {
  final Dio _dio;
  static const String _baseUrl = '/api/v1';

  CryptoRemoteDataSourceImpl(this._dio);

  @override
  Future<List<CryptoRateModel>> getCryptoRates() async {
    final response = await _dio.get('$_baseUrl/crypto/rates');
    final baseResponse = BaseResponse<List<dynamic>>.fromJson(
      response.data,
      (data) => data as List<dynamic>,
    );
    return baseResponse.data!
        .map((e) => CryptoRateModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<EstimatedAssetValueModel> getEstimatedAssetValue() async {
    final response = await _dio.get('$_baseUrl/crypto/estimated-asset-value');
    final baseResponse = BaseResponse<EstimatedAssetValueModel>.fromJson(
      response.data,
      (data) => EstimatedAssetValueModel.fromJson(data as Map<String, dynamic>),
    );
    return baseResponse.data!;
  }

  @override
  Future<CryptoWalletModel> getCryptoWallet(String currency, {String? network}) async {
    final queryParams = <String, dynamic>{};
    if (network != null) queryParams['network'] = network;

    final response = await _dio.get('$_baseUrl/crypto/wallet/$currency', queryParameters: queryParams);
    final baseResponse = BaseResponse<CryptoWalletModel>.fromJson(
      response.data,
      (data) => CryptoWalletModel.fromJson(data as Map<String, dynamic>),
    );
    return baseResponse.data!;
  }

  @override
  Future<void> buyCrypto(BuyCryptoRequest request) async {
    await _dio.post('$_baseUrl/crypto/buy', data: request.toJson());
  }

  @override
  Future<void> sellCrypto(SellCryptoRequest request) async {
    await _dio.post('$_baseUrl/crypto/sell', data: request.toJson());
  }
}

abstract class CryptoRepository {
  Future<Either<Failure, List<CryptoRateEntity>>> getCryptoRates();
  Future<Either<Failure, EstimatedAssetValueEntity>> getEstimatedAssetValue();
  Future<Either<Failure, CryptoWalletEntity>> getCryptoWallet(String currency, {String? network});
  Future<Either<Failure, void>> buyCrypto({required double amount, required String walletAddressId});
  Future<Either<Failure, void>> sellCrypto({required double amount, required String walletAddressId});
}

@LazySingleton(as: CryptoRepository)
class CryptoRepositoryImpl implements CryptoRepository {
  final CryptoRemoteDataSource _remoteDataSource;

  CryptoRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<CryptoRateEntity>>> getCryptoRates() async {
    try {
      final result = await _remoteDataSource.getCryptoRates();
      return Right(result.map((e) => e.toEntity()).toList());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, EstimatedAssetValueEntity>> getEstimatedAssetValue() async {
    try {
      final result = await _remoteDataSource.getEstimatedAssetValue();
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, CryptoWalletEntity>> getCryptoWallet(String currency, {String? network}) async {
    try {
      final result = await _remoteDataSource.getCryptoWallet(currency, network: network);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, void>> buyCrypto({required double amount, required String walletAddressId}) async {
    try {
      await _remoteDataSource.buyCrypto(BuyCryptoRequest(amount: amount, walletAddressId: walletAddressId));
      return const Right(null);
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, void>> sellCrypto({required double amount, required String walletAddressId}) async {
    try {
      await _remoteDataSource.sellCrypto(SellCryptoRequest(amount: amount, walletAddressId: walletAddressId));
      return const Right(null);
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }
}
