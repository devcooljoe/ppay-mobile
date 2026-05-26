import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/bills/domain/entities/bill_entity.dart';
import 'package:ppay_mobile/module/bills/domain/repositories/bill_payment_repository.dart';

@lazySingleton
class GetAirtimeBillersUseCase {
  final BillPaymentRepository _repository;

  GetAirtimeBillersUseCase(this._repository);

  Future<Either<Failure, List<BillerEntity>>> call() => _repository.getAirtimeBillers();
}

@lazySingleton
class GetDataBillersUseCase {
  final BillPaymentRepository _repository;

  GetDataBillersUseCase(this._repository);

  Future<Either<Failure, List<BillerEntity>>> call() => _repository.getDataBillers();
}

@lazySingleton
class GetElectricityBillersUseCase {
  final BillPaymentRepository _repository;

  GetElectricityBillersUseCase(this._repository);

  Future<Either<Failure, List<BillerEntity>>> call() => _repository.getElectricityBillers();
}

@lazySingleton
class GetBettingBillersUseCase {
  final BillPaymentRepository _repository;

  GetBettingBillersUseCase(this._repository);

  Future<Either<Failure, List<BillerEntity>>> call() => _repository.getBettingBillers();
}

@lazySingleton
class GetTvBillersUseCase {
  final BillPaymentRepository _repository;

  GetTvBillersUseCase(this._repository);

  Future<Either<Failure, List<BillerEntity>>> call() => _repository.getTvBillers();
}

@lazySingleton
class VerifyBillCustomerUseCase {
  final BillPaymentRepository _repository;

  VerifyBillCustomerUseCase(this._repository);

  Future<Either<Failure, CustomerVerificationEntity>> call({
    required String kudaBillItemIdentifier,
    required String customerIdentification,
  }) => _repository.verifyCustomer(
    kudaBillItemIdentifier: kudaBillItemIdentifier,
    customerIdentification: customerIdentification,
  );
}

@lazySingleton
class PurchaseBillUseCase {
  final BillPaymentRepository _repository;

  PurchaseBillUseCase(this._repository);

  Future<Either<Failure, BillPurchaseEntity>> call({
    required String billItemIdentifier,
    required String customerIdentifier,
    required String phoneNumber,
    required double amount,
    required String customerFirstName,
  }) => _repository.purchaseBill(
    billItemIdentifier: billItemIdentifier,
    customerIdentifier: customerIdentifier,
    phoneNumber: phoneNumber,
    amount: amount,
    customerFirstName: customerFirstName,
  );
}
