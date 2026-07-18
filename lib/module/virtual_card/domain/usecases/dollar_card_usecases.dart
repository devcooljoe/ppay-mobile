import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/virtual_card/domain/entities/dollar_card_entity.dart';
import 'package:ppay_mobile/module/virtual_card/domain/entities/dollar_card_transaction_entity.dart';
import 'package:ppay_mobile/module/virtual_card/domain/repositories/dollar_card_repository.dart';

@lazySingleton
class CreateDollarCardUseCase {
  final DollarCardRepository _repository;
  CreateDollarCardUseCase(this._repository);

  Future<Either<Failure, void>> call({
    required String street,
    required String city,
    required String state,
    required String postalCode,
    required File photo,
    required File ninPhoto,
  }) => _repository.createDollarCard(
    street: street, city: city, state: state,
    postalCode: postalCode, photo: photo, ninPhoto: ninPhoto,
  );
}

@lazySingleton
class AddDollarCardUseCase {
  final DollarCardRepository _repository;
  AddDollarCardUseCase(this._repository);

  Future<Either<Failure, void>> call({required String brand, required double amount}) =>
      _repository.addDollarCard(brand: brand, amount: amount);
}

@lazySingleton
class GetDollarCardsUseCase {
  final DollarCardRepository _repository;
  GetDollarCardsUseCase(this._repository);

  Future<Either<Failure, List<DollarCardEntity>>> call() =>
      _repository.getDollarCards();
}

@lazySingleton
class GetDollarCardUseCase {
  final DollarCardRepository _repository;
  GetDollarCardUseCase(this._repository);

  Future<Either<Failure, DollarCardEntity>> call({required String cardId}) =>
      _repository.getDollarCard(cardId: cardId);
}

@lazySingleton
class FundDollarCardUseCase {
  final DollarCardRepository _repository;
  FundDollarCardUseCase(this._repository);

  Future<Either<Failure, void>> call({required String cardId, required double amount}) =>
      _repository.fundDollarCard(cardId: cardId, amount: amount);
}

@lazySingleton
class WithdrawDollarCardUseCase {
  final DollarCardRepository _repository;
  WithdrawDollarCardUseCase(this._repository);

  Future<Either<Failure, void>> call({required String cardId, required double amount}) =>
      _repository.withdrawDollarCard(cardId: cardId, amount: amount);
}

@lazySingleton
class GetDollarCardTransactionsUseCase {
  final DollarCardRepository _repository;
  GetDollarCardTransactionsUseCase(this._repository);

  Future<Either<Failure, List<DollarCardTransactionEntity>>> call({required String cardId}) =>
      _repository.getDollarCardTransactions(cardId: cardId);
}

@lazySingleton
class FreezeDollarCardUseCase {
  final DollarCardRepository _repository;
  FreezeDollarCardUseCase(this._repository);

  Future<Either<Failure, void>> call({required String cardId}) =>
      _repository.freezeDollarCard(cardId: cardId);
}

@lazySingleton
class UnfreezeDollarCardUseCase {
  final DollarCardRepository _repository;
  UnfreezeDollarCardUseCase(this._repository);

  Future<Either<Failure, void>> call({required String cardId}) =>
      _repository.unfreezeDollarCard(cardId: cardId);
}

@lazySingleton
class TerminateDollarCardUseCase {
  final DollarCardRepository _repository;
  TerminateDollarCardUseCase(this._repository);

  Future<Either<Failure, void>> call({required String cardId}) =>
      _repository.terminateDollarCard(cardId: cardId);
}
