import 'package:dartz/dartz.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/transaction/domain/entities/name_enquiry_entity.dart';
import 'package:ppay_mobile/module/transaction/domain/entities/wallet_entity.dart';

abstract class WalletRepository {
  Future<Either<Failure, WalletEntity>> getWallet();
  Future<Either<Failure, NameEnquiryEntity>> nameEnquiry({
    required String accountNumber,
    required String bankCode,
  });
  Future<Either<Failure, void>> withdraw({
    required double amount,
    required String accountNumber,
    required String accountName,
    required String bankCode,
    required String bankName,
  });
}
