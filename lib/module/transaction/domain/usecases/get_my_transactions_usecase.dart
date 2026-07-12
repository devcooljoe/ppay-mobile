import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/transaction/domain/entities/transaction_entity.dart';
import 'package:ppay_mobile/module/transaction/domain/repositories/transaction_repository.dart';

@lazySingleton
class GetMyTransactionsUseCase {
  final TransactionRepository _repository;

  GetMyTransactionsUseCase(this._repository);

  Future<Either<Failure, PaginatedTransactionsEntity>> call({
    int pageNumber = 1,
    int pageSize = 20,
  }) =>
      _repository.getMyTransactions(pageNumber: pageNumber, pageSize: pageSize);
}
