import 'package:dio/dio.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/network/interceptors/user_agent_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'interceptors/auth_interceptor.dart';
import 'interceptors/error_interceptor.dart';
import 'interceptors/network_interceptor.dart';

@module
abstract class DioModule {
  @lazySingleton
  EventBus eventBus() => EventBus();

  @lazySingleton
  Dio dio(
    NetworkInterceptor networkInterceptor,
    AuthInterceptor authInterceptor,
    ErrorInterceptor errorInterceptor,
    UserAgentInterceptor userAgentInterceptor,
  ) {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://app.eldaabank.com',
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
      ),
    );

    dio.interceptors.addAll([
      userAgentInterceptor,
      networkInterceptor,
      authInterceptor,
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
        error: true,
        compact: true,
        enabled: kDebugMode,
      ),
      errorInterceptor,
    ]);

    return dio;
  }
}
