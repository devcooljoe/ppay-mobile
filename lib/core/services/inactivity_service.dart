import 'dart:async';
import 'dart:ui';

import 'package:injectable/injectable.dart';

@lazySingleton
class InactivityService {
  Timer? _inactivityTimer;
  static const Duration _inactivityDuration = Duration(minutes: 30);
  bool _dialogShown = false;
  bool _isEnabled = true;
  VoidCallback? _onInactivityDetected;

  void setInactivityCallback(VoidCallback callback) {
    _onInactivityDetected = callback;
  }

  void startTimer() {
    if (_isEnabled) {
      _resetTimer();
    }
  }

  void resetTimer() {
    if (!_dialogShown && _isEnabled) {
      _resetTimer();
    }
  }

  void enable() {
    _isEnabled = true;
    startTimer();
  }

  void disable() {
    _isEnabled = false;
    stopTimer();
  }

  void _resetTimer() {
    _inactivityTimer?.cancel();
    _inactivityTimer = Timer(_inactivityDuration, () {
      if (!_dialogShown && _isEnabled) {
        _dialogShown = true;
        _onInactivityDetected?.call();
      }
    });
  }

  void markDialogShown() {
    _dialogShown = true;
  }

  void markDialogDismissed() {
    _dialogShown = false;
  }

  void stopTimer() {
    _inactivityTimer?.cancel();
    _dialogShown = false;
  }

  void dispose() {
    stopTimer();
  }
}
