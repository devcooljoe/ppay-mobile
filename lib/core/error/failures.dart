import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.server(String message) = ServerFailure;
  const factory Failure.network(String message) = NetworkFailure;
  const factory Failure.validation(String message) = ValidationFailure;
  const factory Failure.auth(String message) = AuthFailure;
  const factory Failure.cache(String message) = CacheFailure;

  static Failure fromDioException(DioException e) {
    if (e.error is Failure) return e.error as Failure;
    final data = e.response?.data;
    String? message;
    if (data is Map) message = data['message']?.toString();
    return ServerFailure(message ?? e.message ?? 'An unexpected error occurred');
  }
}