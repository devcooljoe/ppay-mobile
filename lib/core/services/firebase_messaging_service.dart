import 'dart:math';

import 'package:event_bus/event_bus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:ppay_mobile/core/di/injection.dart';

/// Event fired when a verification notification is received
class VerificationNotificationEvent {
  final String verificationType; // 'bvn', 'nin', 'kyc'
  final String status; // 'verified', 'failed'
  final bool isFullyVerified;
  final String? reason;
  final String title;
  final String body;

  const VerificationNotificationEvent({
    required this.verificationType,
    required this.status,
    required this.isFullyVerified,
    this.reason,
    required this.title,
    required this.body,
  });
}

@lazySingleton
class FirebaseMessagingService {
  final FirebaseMessaging _firebaseMessaging;
  final FlutterLocalNotificationsPlugin _localNotifications;

  FirebaseMessagingService(this._firebaseMessaging, this._localNotifications);

  Future<void> initialize() async {
    await _setupLocalNotifications();
    await _setupMessageHandlers();
  }

  Future<void> _setupLocalNotifications() async {
    const androidSettings = AndroidInitializationSettings(
      '@drawable/ic_notification',
    );
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const settings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _localNotifications.initialize(settings);

    const androidChannel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
      playSound: true,
      enableVibration: true,
      showBadge: true,
    );

    await _localNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(androidChannel);

    await _localNotifications
        .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >()
        ?.requestPermissions(alert: true, badge: true, sound: true);
  }

  Future<void> _setupMessageHandlers() async {
    // Handle foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      await _handleMessage(message);
    });

    // Handle background/terminated messages when app is opened from notification
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      await _handleMessage(message, showLocalNotification: false);
    });

    // Check if app was opened from a terminated state via notification
    final initialMessage = await _firebaseMessaging.getInitialMessage();
    if (initialMessage != null) {
      await _handleMessage(initialMessage, showLocalNotification: false);
    }
  }

  Future<void> _handleMessage(
    RemoteMessage message, {
    bool showLocalNotification = true,
  }) async {
    // Check if this is a verification notification
    final data = message.data;
    final notificationType = data['type'];

    if (notificationType == 'verification') {
      _handleVerificationNotification(message);
    }

    // Show local notification for foreground messages
    if (showLocalNotification) {
      await _showLocalNotification(message);
    }
  }

  void _handleVerificationNotification(RemoteMessage message) {
    final data = message.data;
    final notification = message.notification;

    // Parse the verification data
    final verificationType = data['verificationType'] as String? ?? 'kyc';
    final status = data['status'] as String? ?? 'verified';
    final isFullyVerifiedStr = data['isFullyVerified'];
    final isFullyVerified =
        isFullyVerifiedStr == 'true' || isFullyVerifiedStr == true;
    final reason = data['reason'] as String?;

    // Fire event so the app can update state
    final eventBus = getIt<EventBus>();
    eventBus.fire(
      VerificationNotificationEvent(
        verificationType: verificationType,
        status: status,
        isFullyVerified: isFullyVerified,
        reason: reason,
        title: notification?.title ?? 'Verification Update',
        body: notification?.body ?? '',
      ),
    );
  }

  Future<void> _showLocalNotification(RemoteMessage message) async {
    final notification = message.notification;
    if (notification == null) return;

    const androidDetails = AndroidNotificationDetails(
      'high_importance_channel',
      'High Importance Notifications',
      channelDescription: 'This channel is used for important notifications.',
      importance: Importance.high,
      priority: Priority.high,
      showWhen: true,
      enableVibration: true,
      playSound: true,
      ticker: 'ticker',
      fullScreenIntent: true,
      visibility: NotificationVisibility.public,
      icon: '@drawable/ic_notification',
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _localNotifications.show(
      Random().nextInt(100000),
      notification.title,
      notification.body,
      details,
    );
  }

  Future<String?> getDeviceToken() async {
    try {
      final token = await _firebaseMessaging.getToken();
      return token;
    } catch (e) {
      return null;
    }
  }

  Future<void> requestPermission() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
    );
  }
}
