import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class TokenService {
  static const _boxName = 'auth_box';
  static const _tokenKey = 'auth_token';
  static const _savedEmailKey = 'saved_email';

  String? _tokenInMemory;

  // Called once at app startup. Loads the persisted token into memory.
  Future<String?> loadToken() async {
    final box = await Hive.openBox(_boxName);
    _tokenInMemory = box.get(_tokenKey) as String?;
    return _tokenInMemory;
  }

  // The live in-memory token — what all network calls use.
  String? get token => _tokenInMemory;

  // Saves the token both in memory and persisted to Hive.
  Future<void> saveToken(String token) async {
    _tokenInMemory = token;
    final box = await Hive.openBox(_boxName);
    await box.put(_tokenKey, token);
  }

  // Saves the email for pre-fill on next login.
  Future<void> saveEmail(String email) async {
    final box = await Hive.openBox(_boxName);
    await box.put(_savedEmailKey, email);
  }

  Future<String?> getSavedEmail() async {
    final box = await Hive.openBox(_boxName);
    return box.get(_savedEmailKey) as String?;
  }

  Future<bool> hasSavedSession() async {
    final box = await Hive.openBox(_boxName);
    final token = box.get(_tokenKey) as String?;
    return token != null && token.isNotEmpty;
  }

  // Full logout — clears memory and Hive.
  Future<void> clearToken() async {
    _tokenInMemory = null;
    final box = await Hive.openBox(_boxName);
    await box.delete(_tokenKey);
    await box.delete(_savedEmailKey);
  }

  // Kept for compatibility with existing call sites.
  Future<String?> getToken() async {
    if (_tokenInMemory != null) return _tokenInMemory;
    return await loadToken();
  }

  Future<void> deleteToken() async => clearToken();
}
