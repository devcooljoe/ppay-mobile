import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/virtual_card/data/models/requests/create_dollar_card_request.dart';
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
    required String country,
    required String postalCode,
  }) async {
    try {
      await _remoteDataSource.createDollarCard(
        CreateDollarCardRequest(
          street: street,
          city: city,
          state: state,
          country: country,
          postalCode: postalCode,
        ),
      );
      return const Right(null);
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, DollarCardEntity>> getDollarCard() async {
    try {
      final result = await _remoteDataSource.getDollarCard();
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, void>> fundDollarCard({required double amount}) async {
    try {
      await _remoteDataSource.fundDollarCard(FundDollarCardRequest(amount: amount));
      return const Right(null);
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, void>> withdrawDollarCard({required double amount}) async {
    try {
      await _remoteDataSource.withdrawDollarCard(WithdrawDollarCardRequest(amount: amount));
      return const Right(null);
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, List<DollarCardTransactionEntity>>> getDollarCardTransactions() async {
    try {
      final result = await _remoteDataSource.getDollarCardTransactions();
      return Right(result.map((e) => e.toEntity()).toList());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, void>> freezeDollarCard() async {
    try {
      await _remoteDataSource.freezeDollarCard();
      return const Right(null);
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, void>> unfreezeDollarCard() async {
    try {
      await _remoteDataSource.unfreezeDollarCard();
      return const Right(null);
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, void>> terminateDollarCard() async {
    try {
      await _remoteDataSource.terminateDollarCard();
      return const Right(null);
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }
}
