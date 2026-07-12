import 'package:ppay_mobile/core/di/injection.dart';
import 'package:ppay_mobile/module/notification/domain/entities/notification_entity.dart';
import 'package:ppay_mobile/module/notification/domain/usecases/get_my_notifications_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_providers.g.dart';

@riverpod
class GetMyNotifications extends _$GetMyNotifications {
  @override
  AsyncValue<List<NotificationEntity>> build() => const AsyncValue.data([]);

  Future<void> call() async {
    state = const AsyncValue.loading();
    final result = await getIt<GetMyNotificationsUseCase>()();
    state = result.fold(
      (l) => AsyncValue.error(l.message, StackTrace.current),
      (data) => AsyncValue.data(data),
    );
  }
}
