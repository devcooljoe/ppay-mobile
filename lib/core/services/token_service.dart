import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class TokenService {
  static const _boxName = 'auth_box';
  static const _tokenKey = 'auth_token';

  Future<void> saveToken(String token) async {
    final box = await Hive.openBox(_boxName);
    await box.put(_tokenKey, token);
  }

  Future<String?> getToken() async {
    final box = await Hive.openBox(_boxName);
    return box.get(_tokenKey) as String?;
  }

  Future<void> deleteToken() async {
    final box = await Hive.openBox(_boxName);
    await box.delete(_tokenKey);
  }
}
