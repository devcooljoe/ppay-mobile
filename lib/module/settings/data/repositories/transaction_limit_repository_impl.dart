import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/settings/data/sources/transaction_limit_remote_datasource.dart';
import 'package:ppay_mobile/module/settings/domain/entities/transaction_limits_entity.dart';
import 'package:ppay_mobile/module/settings/domain/repositories/transaction_limit_repository.dart';

@LazySingleton(as: TransactionLimitRepository)
class TransactionLimitRepositoryImpl implements TransactionLimitRepository {
  final TransactionLimitRemoteDataSource _remoteDataSource;

  TransactionLimitRepositoryImpl(this._remoteDataSource);

  Failure _toFailure(DioException e) {
    if (e.error is Failure) return Failure.fromDioException(e);
    final message = e.response?.data is Map
        ? (e.response!.data as Map)['message'] as String? ?? e.message ?? 'Something went wrong'
        : e.message ?? 'Something went wrong';
    return ServerFailure(message);
  }

  @override
  Future<Either<Failure, TransactionLimitsEntity>> getTransactionLimits() async {
    try {
      final result = await _remoteDataSource.getTransactionLimits();
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(_toFailure(e));
    }
  }
}
