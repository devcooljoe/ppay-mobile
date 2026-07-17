import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/referral/data/sources/referral_remote_datasource.dart';
import 'package:ppay_mobile/module/referral/domain/entities/referral_entity.dart';
import 'package:ppay_mobile/module/referral/domain/repositories/referral_repository.dart';

@LazySingleton(as: ReferralRepository)
class ReferralRepositoryImpl implements ReferralRepository {
  final ReferralRemoteDataSource _remoteDataSource;

  ReferralRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, ReferralInfoEntity>> getMyReferrals() async {
    try {
      final result = await _remoteDataSource.getMyReferrals();
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }

  @override
  Future<Either<Failure, void>> withdrawPoints() async {
    try {
      await _remoteDataSource.withdrawPoints();
      return const Right(null);
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }
}
