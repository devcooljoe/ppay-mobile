import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/giftcard/domain/entities/giftcard_entity.dart';
import 'package:ppay_mobile/module/giftcard/domain/repositories/giftcard_repository.dart';

@lazySingleton
class GetBuyGiftcardRatesUseCase {
  final GiftcardRepository _repository;
  GetBuyGiftcardRatesUseCase(this._repository);
  Future<Either<Failure, List<BuyGiftcardRateEntity>>> call() => _repository.getBuyGiftcardRates();
}

@lazySingleton
class GetSellGiftcardRatesUseCase {
  final GiftcardRepository _repository;
  GetSellGiftcardRatesUseCase(this._repository);
  Future<Either<Failure, List<SellGiftcardRateEntity>>> call() => _repository.getSellGiftcardRates();
}

@lazySingleton
class BuyGiftcardUseCase {
  final GiftcardRepository _repository;
  BuyGiftcardUseCase(this._repository);
  Future<Either<Failure, void>> call({
    required String identifier,
    required String fullName,
    required String email,
    required String phoneNumber,
    required double amountInUSD,
    required double amountInNaira,
    required String title,
    required String region,
    required double rate,
  }) => _repository.buyGiftcard(
    identifier: identifier,
    fullName: fullName,
    email: email,
    phoneNumber: phoneNumber,
    amountInUSD: amountInUSD,
    amountInNaira: amountInNaira,
    title: title,
    region: region,
    rate: rate,
  );
}

@lazySingleton
class SellGiftcardUseCase {
  final GiftcardRepository _repository;
  SellGiftcardUseCase(this._repository);
  Future<Either<Failure, void>> call({
    required String type,
    required String country,
    String? subcategoryId,
    required double amount,
    String? ecode,
    List<String>? cardImagePaths,
  }) => _repository.sellGiftcard(
    type: type,
    country: country,
    subcategoryId: subcategoryId,
    amount: amount,
    ecode: ecode,
    cardImagePaths: cardImagePaths,
  );
}
