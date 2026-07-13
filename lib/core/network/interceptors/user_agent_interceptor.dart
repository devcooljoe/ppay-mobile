import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';

@lazySingleton
class UserAgentInterceptor extends Interceptor {
  String? _userAgent;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    _userAgent ??= await _generateUserAgent();
    options.headers['user-agent'] = _userAgent;
    handler.next(options);
  }

  Future<String> _generateUserAgent() async {
    final deviceInfo = DeviceInfoPlugin();
    final packageInfo = await PackageInfo.fromPlatform();

    String deviceDetails = '';

    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      deviceDetails =
          'Android ${androidInfo.version.release}; ${androidInfo.brand.toUpperCase()} ${androidInfo.model.toUpperCase()}';
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      deviceDetails =
          'iOS ${iosInfo.systemVersion}; ${iosInfo.modelName.toUpperCase()} ${iosInfo.model.toUpperCase()}';
    }

    return 'PPay/${packageInfo.version} ($deviceDetails)';
  }
}
