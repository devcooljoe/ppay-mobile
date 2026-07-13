import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_prefs_provider.g.dart';

class NotificationPrefs {
  final bool pushEnabled;
  final bool emailEnabled;
  final bool smsEnabled;

  const NotificationPrefs({
    this.pushEnabled = true,
    this.emailEnabled = false,
    this.smsEnabled = false,
  });

  NotificationPrefs copyWith({
    bool? pushEnabled,
    bool? emailEnabled,
    bool? smsEnabled,
  }) {
    return NotificationPrefs(
      pushEnabled: pushEnabled ?? this.pushEnabled,
      emailEnabled: emailEnabled ?? this.emailEnabled,
      smsEnabled: smsEnabled ?? this.smsEnabled,
    );
  }
}

@riverpod
class NotificationPrefsState extends _$NotificationPrefsState {
  static const _boxName = 'notification_prefs';
  static const _pushKey = 'push_enabled';
  static const _emailKey = 'email_enabled';
  static const _smsKey = 'sms_enabled';

  @override
  Future<NotificationPrefs> build() async {
    final box = await Hive.openBox(_boxName);
    return NotificationPrefs(
      pushEnabled: box.get(_pushKey, defaultValue: true) as bool,
      emailEnabled: box.get(_emailKey, defaultValue: false) as bool,
      smsEnabled: box.get(_smsKey, defaultValue: false) as bool,
    );
  }

  Future<void> togglePush(bool value) async {
    final box = await Hive.openBox(_boxName);
    await box.put(_pushKey, value);
    state = AsyncValue.data((state.value ?? const NotificationPrefs()).copyWith(pushEnabled: value));
  }

  Future<void> toggleEmail(bool value) async {
    final box = await Hive.openBox(_boxName);
    await box.put(_emailKey, value);
    state = AsyncValue.data((state.value ?? const NotificationPrefs()).copyWith(emailEnabled: value));
  }

  Future<void> toggleSms(bool value) async {
    final box = await Hive.openBox(_boxName);
    await box.put(_smsKey, value);
    state = AsyncValue.data((state.value ?? const NotificationPrefs()).copyWith(smsEnabled: value));
  }
}
