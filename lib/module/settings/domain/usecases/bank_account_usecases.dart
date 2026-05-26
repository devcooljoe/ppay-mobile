import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/settings/domain/entities/bank_account_entity.dart';
import 'package:ppay_mobile/module/settings/domain/entities/bank_entity.dart';
import 'package:ppay_mobile/module/settings/domain/repositories/bank_account_repository.dart';

@lazySingleton
class GetBanksUseCase {
  final BankAccountRepository _repository;

  GetBanksUseCase(this._repository);

  Future<Either<Failure, List<BankEntity>>> call() => _repository.getBanks();
}

@lazySingleton
class GetBankAccountsUseCase {
  final BankAccountRepository _repository;

  GetBankAccountsUseCase(this._repository);

  Future<Either<Failure, List<BankAccountEntity>>> call() => _repository.getBankAccounts();
}

@lazySingleton
class UpdateBankAccountUseCase {
  final BankAccountRepository _repository;

  UpdateBankAccountUseCase(this._repository);

  Future<Either<Failure, void>> call({
    required String id,
    required String accountName,
    required String accountNumber,
    required String bankName,
    required String bankCode,
  }) => _repository.updateBankAccount(
    id: id,
    accountName: accountName,
    accountNumber: accountNumber,
    bankName: bankName,
    bankCode: bankCode,
  );
}

@lazySingleton
class DeleteBankAccountUseCase {
  final BankAccountRepository _repository;

  DeleteBankAccountUseCase(this._repository);

  Future<Either<Failure, void>> call({required String id}) =>
      _repository.deleteBankAccount(id: id);
}
