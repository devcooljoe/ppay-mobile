import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';

@lazySingleton
class BiometricService {
  static const _boxName = 'biometric_box';
  static const _enabledKey = 'biometric_enabled';

  final LocalAuthentication _localAuth = LocalAuthentication();

  Future<bool> isBiometricAvailable() async {
    try {
      final isSupported = await _localAuth.isDeviceSupported();
      final canCheck = await _localAuth.canCheckBiometrics;
      return isSupported && canCheck;
    } catch (e) {
      return false;
    }
  }

  Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      return await _localAuth.getAvailableBiometrics();
    } catch (e) {
      return [];
    }
  }

  Future<bool> authenticate({
    required String reason,
    bool biometricOnly = false,
  }) async {
    try {
      final isSupported = await _localAuth.isDeviceSupported();
      if (!isSupported) return false;

      return await _localAuth.authenticate(
        localizedReason: reason,
        options: AuthenticationOptions(
          biometricOnly: biometricOnly,
          stickyAuth: true,
          useErrorDialogs: true,
          sensitiveTransaction: false,
        ),
      );
    } on Exception {
      return false;
    }
  }

  Future<void> setBiometricEnabled(bool enabled) async {
    final box = await Hive.openBox(_boxName);
    await box.put(_enabledKey, enabled);
  }

  Future<bool> isBiometricEnabled() async {
    final box = await Hive.openBox(_boxName);
    return box.get(_enabledKey, defaultValue: false) as bool;
  }

  String getBiometricTypeText(List<BiometricType> types) {
    if (types.contains(BiometricType.face)) {
      return 'Face ID';
    } else if (types.contains(BiometricType.fingerprint)) {
      return 'Biometric';
    } else if (types.contains(BiometricType.iris)) {
      return 'Iris';
    }
    return 'Biometric';
  }

  Future<String> getBiometricTypeForDisplay() async {
    final types = await getAvailableBiometrics();
    return getBiometricTypeText(types);
  }
}
