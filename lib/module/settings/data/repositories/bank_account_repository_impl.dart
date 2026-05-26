import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/settings/data/models/requests/update_bank_account_request.dart';
import 'package:ppay_mobile/module/settings/data/sources/bank_account_remote_datasource.dart';
import 'package:ppay_mobile/module/settings/domain/entities/bank_account_entity.dart';
import 'package:ppay_mobile/module/settings/domain/entities/bank_entity.dart';
import 'package:ppay_mobile/module/settings/domain/repositories/bank_account_repository.dart';

@LazySingleton(as: BankAccountRepository)
class BankAccountRepositoryImpl implements BankAccountRepository {
  final BankAccountRemoteDataSource _remoteDataSource;

  BankAccountRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<BankEntity>>> getBanks() async {
    try {
      final result = await _remoteDataSource.getBanks();
      return Right(result.map((e) => e.toEntity()).toList());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, List<BankAccountEntity>>> getBankAccounts() async {
    try {
      final result = await _remoteDataSource.getBankAccounts();
      return Right(result.map((e) => e.toEntity()).toList());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, void>> updateBankAccount({
    required String id,
    required String accountName,
    required String accountNumber,
    required String bankName,
    required String bankCode,
  }) async {
    try {
      await _remoteDataSource.updateBankAccount(
        id,
        UpdateBankAccountRequest(
          accountName: accountName,
          accountNumber: accountNumber,
          bankName: bankName,
          bankCode: bankCode,
        ),
      );
      return const Right(null);
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, void>> deleteBankAccount({required String id}) async {
    try {
      await _remoteDataSource.deleteBankAccount(id);
      return const Right(null);
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }
}
