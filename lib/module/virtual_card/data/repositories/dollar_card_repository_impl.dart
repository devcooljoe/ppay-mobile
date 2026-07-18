import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/virtual_card/data/models/requests/fund_dollar_card_request.dart';
import 'package:ppay_mobile/module/virtual_card/data/models/requests/withdraw_dollar_card_request.dart';
import 'package:ppay_mobile/module/virtual_card/data/sources/dollar_card_remote_datasource.dart';
import 'package:ppay_mobile/module/virtual_card/domain/entities/dollar_card_entity.dart';
import 'package:ppay_mobile/module/virtual_card/domain/entities/dollar_card_transaction_entity.dart';
import 'package:ppay_mobile/module/virtual_card/domain/repositories/dollar_card_repository.dart';

@LazySingleton(as: DollarCardRepository)
class DollarCardRepositoryImpl implements DollarCardRepository {
  final DollarCardRemoteDataSource _remoteDataSource;

  DollarCardRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, void>> createDollarCard({
    required String street,
    required String city,
    required String state,
    required String postalCode,
    required File photo,
    required File ninPhoto,
  }) async {
    try {
      await _remoteDataSource.createDollarCard(
        street: street, city: city, state: state,
        postalCode: postalCode, photo: photo, ninPhoto: ninPhoto,
      );
      return const Right(null);
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, void>> addDollarCard({required String brand}) async {
    try {
      await _remoteDataSource.addDollarCard(brand: brand);
      return const Right(null);
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, List<DollarCardEntity>>> getDollarCards() async {
    try {
      final result = await _remoteDataSource.getDollarCards();
      return Right(result.map((m) => m.toEntity()).toList());
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) return const Right([]);
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, DollarCardEntity>> getDollarCard({required String cardId}) async {
    try {
      final result = await _remoteDataSource.getDollarCard(cardId: cardId);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, void>> fundDollarCard({required String cardId, required double amount}) async {
    try {
      await _remoteDataSource.fundDollarCard(cardId: cardId, request: FundDollarCardRequest(amount: amount));
      return const Right(null);
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, void>> withdrawDollarCard({required String cardId, required double amount}) async {
    try {
      await _remoteDataSource.withdrawDollarCard(cardId: cardId, request: WithdrawDollarCardRequest(amount: amount));
      return const Right(null);
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, List<DollarCardTransactionEntity>>> getDollarCardTransactions({required String cardId}) async {
    try {
      final result = await _remoteDataSource.getDollarCardTransactions(cardId: cardId);
      return Right(result.map((e) => e.toEntity()).toList());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, void>> freezeDollarCard({required String cardId}) async {
    try {
      await _remoteDataSource.freezeDollarCard(cardId: cardId);
      return const Right(null);
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, void>> unfreezeDollarCard({required String cardId}) async {
    try {
      await _remoteDataSource.unfreezeDollarCard(cardId: cardId);
      return const Right(null);
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, void>> terminateDollarCard({required String cardId}) async {
    try {
      await _remoteDataSource.terminateDollarCard(cardId: cardId);
      return const Right(null);
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }
}
