import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/error/failures.dart';
import 'package:ppay_mobile/module/notification/domain/repositories/notification_repository.dart';

@lazySingleton
class ClearNotificationsUseCase {
  final NotificationRepository _repository;
  ClearNotificationsUseCase(this._repository);

  Future<Either<Failure, void>> call() => _repository.clearNotifications();
}
