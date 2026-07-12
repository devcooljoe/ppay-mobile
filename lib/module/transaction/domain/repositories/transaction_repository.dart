import 'package:dartz/dartz.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/transaction/domain/entities/transaction_entity.dart';

abstract class TransactionRepository {
  Future<Either<Failure, PaginatedTransactionsEntity>> getMyTransactions({
    int pageNumber,
    int pageSize,
  });
}
