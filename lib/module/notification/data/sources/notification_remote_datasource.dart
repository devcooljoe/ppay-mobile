import 'package:ppay_mobile/module/notification/data/models/notification_model.dart';

abstract class NotificationRemoteDataSource {
  Future<List<NotificationModel>> getMyNotifications();
}
