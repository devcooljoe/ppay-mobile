import 'package:ppay_mobile/core/di/injection.dart';
import 'package:ppay_mobile/module/notification/domain/entities/notification_entity.dart';
import 'package:ppay_mobile/module/notification/domain/usecases/clear_notifications_usecase.dart';
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

  /// Clears the user's notifications on the server, then empties the list.
  /// Returns null on success, or an error message on failure.
  Future<String?> clear() async {
    final result = await getIt<ClearNotificationsUseCase>()();
    return result.fold((l) => l.message, (_) {
      state = const AsyncValue.data([]);
      return null;
    });
  }
}
