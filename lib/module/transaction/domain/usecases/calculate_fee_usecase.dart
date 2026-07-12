import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/transaction/domain/repositories/wallet_repository.dart';

@lazySingleton
class CalculateFeeUseCase {
  final WalletRepository _repository;

  CalculateFeeUseCase(this._repository);

  Future<Either<Failure, double>> call({
    required String transactionType,
    required double amount,
  }) => _repository.calculateFee(
        transactionType: transactionType,
        amount: amount,
      );
}
