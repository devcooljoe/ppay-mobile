import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/models/base_response.dart';
import 'package:ppay_mobile/module/notification/data/models/notification_model.dart';
import 'package:ppay_mobile/module/notification/data/sources/notification_remote_datasource.dart';

@LazySingleton(as: NotificationRemoteDataSource)
class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource {
  final Dio _dio;
  static const String _baseUrl = '/api/v1';

  NotificationRemoteDataSourceImpl(this._dio);

  @override
  Future<List<NotificationModel>> getMyNotifications() async {
    final response = await _dio.get('$_baseUrl/notifications');
    final baseResponse = BaseResponse<List<dynamic>>.fromJson(
      response.data,
      (data) => data as List<dynamic>,
    );
    return (baseResponse.data ?? [])
        .map((e) => NotificationModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
