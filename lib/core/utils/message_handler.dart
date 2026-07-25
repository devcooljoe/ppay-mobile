import 'dart:async';

import 'package:dio/dio.dart';
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
    if (error == null) return 'An unexpected error occurred';
    if (error is Failure) return error.message;
    if (error is String && error.isNotEmpty) return error;
    if (error is AsyncError) return getErrorMessage(error.error);
    if (error is DioException) {
      final responseMessage = _extractMessageFromPayload(error.response?.data);
      if (responseMessage != null && responseMessage.isNotEmpty) {
        return responseMessage;
      }
      if (error.error is Failure) return (error.error as Failure).message;
      if (error.error is String && (error.error as String).isNotEmpty) {
        return error.error as String;
      }
      if (error.message != null && error.message!.isNotEmpty) {
        return error.message!;
      }
    }
    if (error is Map<String, dynamic> || error is Map) {
      final message = _extractMessageFromPayload(error);
      if (message != null && message.isNotEmpty) return message;
    }
    if (error is Exception) {
      final text = error.toString().replaceAll('Exception: ', '');
      if (text.isNotEmpty && text != 'Exception') return text;
    }
    return 'An unexpected error occurred';
  }

  static String? _extractMessageFromPayload(dynamic payload) {
    if (payload is Map<String, dynamic>) {
      final message = payload['message'];
      if (message is String && message.isNotEmpty) return message;
      if (message != null) return message.toString();
      return null;
    }
    if (payload is Map) {
      final message = payload['message'];
      if (message is String && message.isNotEmpty) return message;
      if (message != null) return message.toString();
    }
    return null;
  }
}
