import 'package:dartz/dartz.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/settings/domain/entities/bank_account_entity.dart';
import 'package:ppay_mobile/module/settings/domain/entities/bank_entity.dart';

abstract class BankAccountRepository {
  Future<Either<Failure, List<BankEntity>>> getBanks();
  Future<Either<Failure, List<BankAccountEntity>>> getBankAccounts();
  Future<Either<Failure, void>> updateBankAccount({
    required String id,
    required String accountName,
    required String accountNumber,
    required String bankName,
    required String bankCode,
  });
  Future<Either<Failure, void>> deleteBankAccount({required String id});
}
