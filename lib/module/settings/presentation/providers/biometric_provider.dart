import 'package:ppay_mobile/core/di/injection.dart';
import 'package:ppay_mobile/core/services/biometric_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'biometric_provider.g.dart';

@riverpod
class BiometricState extends _$BiometricState {
  BiometricService get _biometricService => getIt<BiometricService>();

  @override
  Future<bool> build() async {
    return await _biometricService.isBiometricEnabled();
  }

  Future<bool> toggleBiometric(String reason) async {
    final currentState = state.value ?? false;
    print('[BiometricProvider] toggleBiometric → currentState=$currentState');
    final authenticated = await _biometricService.authenticate(
      reason: reason,
      biometricOnly: true,
    );
    print('[BiometricProvider] toggleBiometric → authenticated=$authenticated');
    if (!authenticated) return false;
    final newState = !currentState;
    await _biometricService.setBiometricEnabled(newState);
    state = AsyncValue.data(newState);
    print('[BiometricProvider] toggleBiometric → newState=$newState saved');
    return true;
  }

  Future<bool> isBiometricAvailable() async {
    return await _biometricService.isBiometricAvailable();
  }

  Future<bool> authenticate(String reason) async {
    return await _biometricService.authenticate(
      reason: reason,
      biometricOnly: true,
    );
  }
}
