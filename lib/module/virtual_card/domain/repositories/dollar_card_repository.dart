import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/virtual_card/domain/entities/dollar_card_entity.dart';
import 'package:ppay_mobile/module/virtual_card/domain/entities/dollar_card_transaction_entity.dart';

abstract class DollarCardRepository {
  Future<Either<Failure, void>> createDollarCard({
    required String street,
    required String city,
    required String state,
    required String postalCode,
    required File photo,
    required File ninPhoto,
  });
  Future<Either<Failure, void>> addDollarCard({required String brand, required double amount});
  Future<Either<Failure, List<DollarCardEntity>>> getDollarCards();
  Future<Either<Failure, DollarCardEntity>> getDollarCard({required String cardId});
  Future<Either<Failure, void>> fundDollarCard({required String cardId, required double amount});
  Future<Either<Failure, void>> withdrawDollarCard({required String cardId, required double amount});
  Future<Either<Failure, List<DollarCardTransactionEntity>>> getDollarCardTransactions({required String cardId});
  Future<Either<Failure, void>> freezeDollarCard({required String cardId});
  Future<Either<Failure, void>> unfreezeDollarCard({required String cardId});
  Future<Either<Failure, void>> terminateDollarCard({required String cardId});
}
