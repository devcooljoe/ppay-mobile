import 'package:dartz/dartz.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/bills/domain/entities/bill_entity.dart';

abstract class BillPaymentRepository {
  Future<Either<Failure, List<BillerEntity>>> getAirtimeBillers();
  Future<Either<Failure, List<BillerEntity>>> getDataBillers();
  Future<Either<Failure, List<BillerEntity>>> getElectricityBillers();
  Future<Either<Failure, List<BillerEntity>>> getBettingBillers();
  Future<Either<Failure, List<BillerEntity>>> getTvBillers();
  Future<Either<Failure, CustomerVerificationEntity>> verifyCustomer({
    required String kudaBillItemIdentifier,
    required String customerIdentification,
  });
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
  });
}
