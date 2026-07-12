// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getMyNotificationsHash() => r'notification_get_my_notifications_hash';

/// See also [GetMyNotifications].
@ProviderFor(GetMyNotifications)
final getMyNotificationsProvider =
    AutoDisposeNotifierProvider<GetMyNotifications, AsyncValue<List<NotificationEntity>>>.internal(
  GetMyNotifications.new,
  name: r'getMyNotificationsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getMyNotificationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GetMyNotifications = AutoDisposeNotifier<AsyncValue<List<NotificationEntity>>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
