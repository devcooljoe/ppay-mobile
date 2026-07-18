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
    required String country,
    required String postalCode,
    required File photo,
  }) => _repository.createDollarCard(
    street: street,
    city: city,
    state: state,
    country: country,
    postalCode: postalCode,
    photo: photo,
  );
}

@lazySingleton
class GetDollarCardUseCase {
  final DollarCardRepository _repository;

  GetDollarCardUseCase(this._repository);

  Future<Either<Failure, DollarCardEntity>> call() => _repository.getDollarCard();
}

@lazySingleton
class FundDollarCardUseCase {
  final DollarCardRepository _repository;

  FundDollarCardUseCase(this._repository);

  Future<Either<Failure, void>> call({required double amount}) =>
      _repository.fundDollarCard(amount: amount);
}

@lazySingleton
class WithdrawDollarCardUseCase {
  final DollarCardRepository _repository;

  WithdrawDollarCardUseCase(this._repository);

  Future<Either<Failure, void>> call({required double amount}) =>
      _repository.withdrawDollarCard(amount: amount);
}

@lazySingleton
class GetDollarCardTransactionsUseCase {
  final DollarCardRepository _repository;

  GetDollarCardTransactionsUseCase(this._repository);

  Future<Either<Failure, List<DollarCardTransactionEntity>>> call() =>
      _repository.getDollarCardTransactions();
}

@lazySingleton
class FreezeDollarCardUseCase {
  final DollarCardRepository _repository;

  FreezeDollarCardUseCase(this._repository);

  Future<Either<Failure, void>> call() => _repository.freezeDollarCard();
}

@lazySingleton
class UnfreezeDollarCardUseCase {
  final DollarCardRepository _repository;

  UnfreezeDollarCardUseCase(this._repository);

  Future<Either<Failure, void>> call() => _repository.unfreezeDollarCard();
}

@lazySingleton
class TerminateDollarCardUseCase {
  final DollarCardRepository _repository;

  TerminateDollarCardUseCase(this._repository);

  Future<Either<Failure, void>> call() => _repository.terminateDollarCard();
}
