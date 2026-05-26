import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PinVerificationService {
  static const _boxName = 'transaction_pin_box';
  static const _verifiedKey = 'pin_verified_once';

  Future<void> markPinAsVerified() async {
    final box = await Hive.openBox(_boxName);
    await box.put(_verifiedKey, true);
  }

  Future<bool> hasPinBeenVerified() async {
    final box = await Hive.openBox(_boxName);
    return box.get(_verifiedKey, defaultValue: false) as bool;
  }
}
