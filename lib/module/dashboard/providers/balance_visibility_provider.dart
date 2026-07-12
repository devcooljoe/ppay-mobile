import 'package:ppay_mobile/core/di/injection.dart';
import 'package:ppay_mobile/core/services/hive_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'balance_visibility_provider.g.dart';

@Riverpod(keepAlive: true)
class BalanceVisibility extends _$BalanceVisibility {
  static const String _key = 'balance_visibility';

  @override
  bool build() {
    _load();
    return true;
  }

  Future<void> _load() async {
    final value = await getIt<HiveService>().get<bool>(_key);
    state = value ?? true;
  }

  Future<void> toggle() async {
    state = !state;
    await getIt<HiveService>().put(_key, state);
  }
}
