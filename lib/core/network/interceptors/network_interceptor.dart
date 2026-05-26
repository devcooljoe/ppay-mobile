import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../error/failures.dart';
import '../network_info.dart';

@lazySingleton
class NetworkInterceptor extends Interceptor {
  final NetworkInfo _networkInfo;

  NetworkInterceptor(this._networkInfo);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (!await _networkInfo.isConnected) {
      handler.reject(
        DioException(
          requestOptions: options,
          error: const NetworkFailure('No internet connection'),
          type: DioExceptionType.connectionError,
        ),
      );
      return;
    }
    handler.next(options);
  }
}
