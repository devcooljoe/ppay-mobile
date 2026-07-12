import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/transaction/data/models/requests/name_enquiry_request.dart';
import 'package:ppay_mobile/module/transaction/data/models/requests/withdraw_request.dart';
import 'package:ppay_mobile/module/transaction/data/sources/wallet_remote_datasource.dart';
import 'package:ppay_mobile/module/transaction/domain/entities/name_enquiry_entity.dart';
import 'package:ppay_mobile/module/transaction/domain/entities/wallet_entity.dart';
import 'package:ppay_mobile/module/transaction/domain/repositories/wallet_repository.dart';

@LazySingleton(as: WalletRepository)
class WalletRepositoryImpl implements WalletRepository {
  final WalletRemoteDataSource _remoteDataSource;

  WalletRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, WalletEntity>> getWallet() async {
    try {
      final result = await _remoteDataSource.getWallet();
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, NameEnquiryEntity>> nameEnquiry({
    required String accountNumber,
    required String bankCode,
  }) async {
    try {
      final result = await _remoteDataSource.nameEnquiry(
        NameEnquiryRequest(accountNumber: accountNumber, bankCode: bankCode),
      );
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, void>> withdraw({
    required double amount,
    required String accountNumber,
    required String accountName,
    required String bankCode,
    required String bankName,
  }) async {
    try {
      await _remoteDataSource.withdraw(
        WithdrawRequest(
          amount: amount,
          accountNumber: accountNumber,
          accountName: accountName,
          bankCode: bankCode,
          bankName: bankName,
        ),
      );
      return const Right(null);
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, double>> calculateFee({
    required String transactionType,
    required double amount,
  }) async {
    try {
      final fee = await _remoteDataSource.calculateFee(
        transactionType: transactionType,
        amount: amount,
      );
      return Right(fee);
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }
}
