import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/transaction/domain/repositories/wallet_repository.dart';

@lazySingleton
class WithdrawUseCase {
  final WalletRepository _repository;

  WithdrawUseCase(this._repository);

  Future<Either<Failure, void>> call({
    required double amount,
    required String accountNumber,
    required String accountName,
    required String bankCode,
    required String bankName,
  }) => _repository.withdraw(
    amount: amount,
    accountNumber: accountNumber,
    accountName: accountName,
    bankCode: bankCode,
    bankName: bankName,
  );
}
