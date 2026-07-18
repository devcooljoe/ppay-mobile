import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../core/error/failures.dart';

class MessageHandler {
  static void showErrorSnackBar(BuildContext context, String message) {
    final overlay = Overlay.maybeOf(context);
    if (overlay != null) {
      showTopSnackBar(
        overlay,
        CustomSnackBar.error(message: message),
        displayDuration: const Duration(seconds: 3),
      );
    }
  }

  static void showSuccessSnackBar(BuildContext context, String message) {
    final overlay = Overlay.maybeOf(context);
    if (overlay != null) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.success(message: message),
        displayDuration: const Duration(seconds: 3),
      );
    }
  }

  static void showInfoSnackBar(BuildContext context, String message) {
    final overlay = Overlay.maybeOf(context);
    if (overlay != null) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.info(message: message),
        displayDuration: const Duration(seconds: 3),
      );
    }
  }

  static String getErrorMessage(dynamic error) {
    if (error is Failure) return error.message;
    if (error is String && error.isNotEmpty) return error;
    return 'An unexpected error occurred';
  }
}
