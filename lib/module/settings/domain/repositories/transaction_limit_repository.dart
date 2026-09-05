import 'package:dartz/dartz.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/settings/domain/entities/transaction_limits_entity.dart';

abstract class TransactionLimitRepository {
  Future<Either<Failure, TransactionLimitsEntity>> getTransactionLimits();
}
