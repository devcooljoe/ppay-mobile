import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/settings/domain/entities/transaction_limits_entity.dart';
import 'package:ppay_mobile/module/settings/domain/repositories/transaction_limit_repository.dart';

@lazySingleton
class GetTransactionLimitsUseCase {
  final TransactionLimitRepository _repository;

  GetTransactionLimitsUseCase(this._repository);

  Future<Either<Failure, TransactionLimitsEntity>> call() =>
      _repository.getTransactionLimits();
}
