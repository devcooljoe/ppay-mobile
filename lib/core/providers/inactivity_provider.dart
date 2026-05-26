import 'package:ppay_mobile/core/di/injection.dart';
import 'package:ppay_mobile/core/services/biometric_service.dart';
import 'package:ppay_mobile/core/services/inactivity_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'inactivity_provider.g.dart';

@Riverpod(keepAlive: true)
class InactivityNotifier extends _$InactivityNotifier {
  late InactivityService _inactivityService;
  late BiometricService _biometricService;

  @override
  int build() {
    _inactivityService = getIt<InactivityService>();
    _biometricService = getIt<BiometricService>();
    _inactivityService.setInactivityCallback(_handleInactivity);
    return 0;
  }

  void _handleInactivity() {
    state = state + 1;
  }

  void startTimer() {
    _inactivityService.startTimer();
  }

  void resetTimer() {
    _inactivityService.resetTimer();
  }

  void enable() {
    _inactivityService.enable();
  }

  void disable() {
    _inactivityService.disable();
  }

  void stopTimer() {
    _inactivityService.stopTimer();
  }

  void markDialogShown() {
    _inactivityService.markDialogShown();
  }

  void markDialogDismissed() {
    _inactivityService.markDialogDismissed();
  }

  Future<bool> checkBiometricAvailability() async {
    final isAvailable = await _biometricService.isBiometricAvailable();
    final isEnabled = await _biometricService.isBiometricEnabled();
    return isAvailable && isEnabled;
  }

  Future<bool> authenticateWithBiometric(String reason) async {
    return await _biometricService.authenticate(reason: reason);
  }
}
