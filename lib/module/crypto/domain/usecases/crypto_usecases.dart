import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/crypto/domain/entities/crypto_entity.dart';
import 'package:ppay_mobile/module/crypto/domain/repositories/crypto_repository.dart';

@lazySingleton
class GetCryptoRatesUseCase {
  final CryptoRepository _repository;
  GetCryptoRatesUseCase(this._repository);
  Future<Either<Failure, List<CryptoRateEntity>>> call() => _repository.getCryptoRates();
}

@lazySingleton
class GetEstimatedAssetValueUseCase {
  final CryptoRepository _repository;
  GetEstimatedAssetValueUseCase(this._repository);
  Future<Either<Failure, EstimatedAssetValueEntity>> call() => _repository.getEstimatedAssetValue();
}

@lazySingleton
class GetCryptoWalletUseCase {
  final CryptoRepository _repository;
  GetCryptoWalletUseCase(this._repository);
  Future<Either<Failure, CryptoWalletEntity>> call(String currency, {String? network}) =>
      _repository.getCryptoWallet(currency, network: network);
}

@lazySingleton
class BuyCryptoUseCase {
  final CryptoRepository _repository;
  BuyCryptoUseCase(this._repository);
  Future<Either<Failure, void>> call({required double amount, required String walletAddressId}) =>
      _repository.buyCrypto(amount: amount, walletAddressId: walletAddressId);
}

@lazySingleton
class SellCryptoUseCase {
  final CryptoRepository _repository;
  SellCryptoUseCase(this._repository);
  Future<Either<Failure, void>> call({required double amount, required String walletAddressId}) =>
      _repository.sellCrypto(amount: amount, walletAddressId: walletAddressId);
}
