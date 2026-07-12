import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/bills/data/models/requests/bill_request.dart';
import 'package:ppay_mobile/module/bills/data/sources/bill_payment_remote_datasource.dart';
import 'package:ppay_mobile/module/bills/domain/entities/bill_entity.dart';
import 'package:ppay_mobile/module/bills/domain/repositories/bill_payment_repository.dart';

@LazySingleton(as: BillPaymentRepository)
class BillPaymentRepositoryImpl implements BillPaymentRepository {
  final BillPaymentRemoteDataSource _remoteDataSource;

  BillPaymentRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<BillerEntity>>> getAirtimeBillers() async {
    try {
      final result = await _remoteDataSource.getAirtimeBillers();
      return Right(result.map((e) => e.toEntity()).toList());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, List<BillerEntity>>> getDataBillers() async {
    try {
      final result = await _remoteDataSource.getDataBillers();
      return Right(result.map((e) => e.toEntity()).toList());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, List<BillerEntity>>> getElectricityBillers() async {
    try {
      final result = await _remoteDataSource.getElectricityBillers();
      return Right(result.map((e) => e.toEntity()).toList());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, List<BillerEntity>>> getBettingBillers() async {
    try {
      final result = await _remoteDataSource.getBettingBillers();
      return Right(result.map((e) => e.toEntity()).toList());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, List<BillerEntity>>> getTvBillers() async {
    try {
      final result = await _remoteDataSource.getTvBillers();
      return Right(result.map((e) => e.toEntity()).toList());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, CustomerVerificationEntity>> verifyCustomer({
    required String kudaBillItemIdentifier,
    required String customerIdentification,
  }) async {
    try {
      final result = await _remoteDataSource.verifyCustomer(
        VerifyBillCustomerRequest(
          kudaBillItemIdentifier: kudaBillItemIdentifier,
          customerIdentification: customerIdentification,
        ),
      );
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, BillPurchaseEntity>> purchaseBill({
    required String billItemIdentifier,
    required String customerIdentifier,
    required String phoneNumber,
    required double amount,
    required String customerFirstName,
    required String billerName,
    required String billerCategory,
    String? meterNumber,
    String? plan,
    String? provider,
    String? logoUrl,
  }) async {
    try {
      final result = await _remoteDataSource.purchaseBill(
        PurchaseBillRequest(
          billItemIdentifier: billItemIdentifier,
          customerIdentifier: customerIdentifier,
          phoneNumber: phoneNumber,
          amount: amount,
          customerFirstName: customerFirstName,
          billerName: billerName,
          billerCategory: billerCategory,
          meterNumber: meterNumber,
          plan: plan,
          provider: provider,
          logoUrl: logoUrl,
        ),
      );
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }
}
