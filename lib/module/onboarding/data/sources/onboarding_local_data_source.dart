import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@singleton
class OnboardingLocalDataSource {
  static const String _boxName = 'onboarding';
  static const String _hasSeenOnboardingKey = 'has_seen_onboarding';

  Future<bool> hasSeenOnboarding() async {
    final box = await Hive.openBox(_boxName);
    return box.get(_hasSeenOnboardingKey, defaultValue: false);
  }

  Future<void> setOnboardingSeen() async {
    final box = await Hive.openBox(_boxName);
    await box.put(_hasSeenOnboardingKey, true);
  }
}
