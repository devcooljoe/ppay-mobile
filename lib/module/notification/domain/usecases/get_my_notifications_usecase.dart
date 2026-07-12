import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/notification/domain/entities/notification_entity.dart';
import 'package:ppay_mobile/module/notification/domain/repositories/notification_repository.dart';

@lazySingleton
class GetMyNotificationsUseCase {
  final NotificationRepository _repository;
  GetMyNotificationsUseCase(this._repository);

  Future<Either<Failure, List<NotificationEntity>>> call() =>
      _repository.getMyNotifications();
}
