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
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkFailure('Connection timeout');
      case DioExceptionType.badResponse:
        return _handleResponseError(error.response);
      case DioExceptionType.cancel:
        return NetworkFailure('Request cancelled');
      case DioExceptionType.connectionError:
        return NetworkFailure('No internet connection');
      default:
        return NetworkFailure('Unexpected error occurred');
    }
  }

  Failure _handleResponseError(Response? response) {
    if (response == null) return ServerFailure('No response from server');

    final data = response.data;
    final message = data is Map<String, dynamic> ? data['message'] as String? : null;

    switch (response.statusCode) {
      case 400:
        return ValidationFailure(message ?? 'Invalid request');
      case 401:
        _eventBus.fire(UnauthorizedEvent(message ?? 'Session expired. Please log in again.'));
        return AuthFailure(message ?? 'Unauthorized');
      case 404:
        return ServerFailure(message ?? 'Resource not found');
      case 500:
      case 502:
      case 503:
        return ServerFailure(message ?? 'Server error');
      default:
        return ServerFailure(message ?? 'Unknown error');
    }
  }
}
