import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@singleton
class HiveService {
  static const String _boxName = 'ppay_box';
  Box? _box;

  static Future<void> init() async {
    await Hive.initFlutter();
  }

  Future<Box> get _openBox async {
    _box ??= await Hive.openBox(_boxName);
    return _box!;
  }

  Future<T?> get<T>(String key) async {
    final box = await _openBox;
    return box.get(key) as T?;
  }

  Future<void> put<T>(String key, T value) async {
    final box = await _openBox;
    await box.put(key, value);
  }

  Future<void> delete(String key) async {
    final box = await _openBox;
    await box.delete(key);
  }
}
