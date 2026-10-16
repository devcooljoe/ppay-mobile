import 'package:dio/dio.dart';
import 'package:event_bus/event_bus.dart';
import 'package:injectable/injectable.dart';

import '../../error/failures.dart';

class UnauthorizedEvent {
  final String message;
  const UnauthorizedEvent(this.message);
}

@lazySingleton
class ErrorInterceptor extends Interceptor {
  final EventBus _eventBus;

  ErrorInterceptor(this._eventBus);

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final payload = _extractPayload(response.data);
    if (_isErrorPayload(payload)) {
      final failure = _handleResponseError(response, payload);
      handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          error: failure,
          type: DioExceptionType.badResponse,
          response: response,
        ),
      );
      return;
    }

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final failure = _handleError(err);
    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        error: failure,
        type: err.type,
        response: err.response,
      ),
    );
  }

  Failure _handleError(DioException error) {
    // Always try to handle response errors first if we have a response
    if (error.response != null) {
      return _handleResponseError(
        error.response,
        _extractPayload(error.response?.data),
      );
    }

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkFailure('Connection timeout');
      case DioExceptionType.cancel:
        return NetworkFailure('Request cancelled');
      case DioExceptionType.connectionError:
        return NetworkFailure('No internet connection');
      case DioExceptionType.badResponse:
        return _handleResponseError(
          error.response,
          _extractPayload(error.response?.data),
        );
      default:
        return NetworkFailure('Unexpected error occurred');
    }
  }

  // Auth endpoints that should not trigger global logout on 401
  // These handle their own authentication errors (e.g., wrong password)
  static const _authEndpoints = [
    '/users/login',
    '/users/register',
    '/users/forgot-password',
    '/users/reset-password',
  ];

  // Messages that indicate token expiration/invalidity (should always logout)
  static const _tokenExpiredMessages = [
    'invalid or expired token',
    'token expired',
    'token invalid',
    'jwt expired',
    'jwt malformed',
    'session expired',
  ];

  bool _isAuthEndpoint(String? path) {
    if (path == null) return false;
    return _authEndpoints.any((endpoint) => path.contains(endpoint));
  }

  bool _isTokenExpiredError(String? message) {
    if (message == null) return false;
    final lowerMessage = message.toLowerCase();
    return _tokenExpiredMessages.any(
      (expiredMsg) => lowerMessage.contains(expiredMsg),
    );
  }

  Failure _handleResponseError(
    Response? response, [
    Map<String, dynamic>? payload,
  ]) {
    if (response == null) return ServerFailure('No response from server');

    final message = _extractMessage(payload, response.data);
    final hasErrorPayload = _isErrorPayload(payload);
    final requestPath = response.requestOptions.path;

    switch (response.statusCode) {
      case 400:
        return ValidationFailure(message ?? 'Invalid request');
      case 401:
        // Always fire logout event for token expiration errors, regardless of endpoint
        // For other 401s, only fire for non-auth endpoints (auth endpoints handle locally)
        final isTokenExpired = _isTokenExpiredError(message);
        if (isTokenExpired || !_isAuthEndpoint(requestPath)) {
          _eventBus.fire(
            UnauthorizedEvent(
              message ?? 'Session expired. Please log in again.',
            ),
          );
        }
        return AuthFailure(message ?? 'Unauthorized');
      case 404:
        return ServerFailure(message ?? 'Resource not found');
      case 500:
      case 502:
      case 503:
        return ServerFailure(message ?? 'Server error');
      default:
        if (hasErrorPayload) {
          return ValidationFailure(message ?? 'Request failed');
        }
        return ServerFailure(message ?? 'Unknown error');
    }
  }

  Map<String, dynamic>? _extractPayload(dynamic data) {
    if (data is Map<String, dynamic>) {
      return data;
    }
    if (data is Map) {
      final map = <String, dynamic>{};
      data.forEach((key, value) {
        map[key.toString()] = value;
      });
      return map;
    }
    return null;
  }

  bool _isErrorPayload(Map<String, dynamic>? payload) {
    return payload != null &&
        payload['status']?.toString().toLowerCase() == 'error';
  }

  String? _extractMessage(Map<String, dynamic>? payload, dynamic fallbackData) {
    if (payload != null) {
      final message = payload['message'];
      if (message is String && message.isNotEmpty) {
        return message;
      }
      if (message != null) {
        return message.toString();
      }
    }

    final fallbackPayload = _extractPayload(fallbackData);
    final fallbackMessage = fallbackPayload?['message'];
    if (fallbackMessage is String && fallbackMessage.isNotEmpty) {
      return fallbackMessage;
    }
    if (fallbackMessage != null) {
      return fallbackMessage.toString();
    }

    return null;
  }
}
