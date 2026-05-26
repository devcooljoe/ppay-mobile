import 'package:dartz/dartz.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/virtual_card/domain/entities/dollar_card_entity.dart';
import 'package:ppay_mobile/module/virtual_card/domain/entities/dollar_card_transaction_entity.dart';

abstract class DollarCardRepository {
  Future<Either<Failure, void>> createDollarCard({
    required String street,
    required String city,
    required String state,
    required String country,
    required String postalCode,
  });
  Future<Either<Failure, DollarCardEntity>> getDollarCard();
  Future<Either<Failure, void>> fundDollarCard({required double amount});
  Future<Either<Failure, void>> withdrawDollarCard({required double amount});
  Future<Either<Failure, List<DollarCardTransactionEntity>>> getDollarCardTransactions();
  Future<Either<Failure, void>> freezeDollarCard();
  Future<Either<Failure, void>> unfreezeDollarCard();
  Future<Either<Failure, void>> terminateDollarCard();
}
