import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/notification/data/sources/notification_remote_datasource.dart';
import 'package:ppay_mobile/module/notification/domain/entities/notification_entity.dart';
import 'package:ppay_mobile/module/notification/domain/repositories/notification_repository.dart';

@LazySingleton(as: NotificationRepository)
class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteDataSource _remoteDataSource;

  NotificationRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<NotificationEntity>>> getMyNotifications() async {
    try {
      final result = await _remoteDataSource.getMyNotifications();
      return Right(result.map((m) => m.toEntity()).toList());
    } on DioException catch (e) {
      return Left(e.error as Failure);
    }
  }
}
