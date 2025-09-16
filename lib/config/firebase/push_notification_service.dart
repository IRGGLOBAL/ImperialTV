// services/push_notification_service.dart
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';

class PushNotificationService {
  static final _firebaseMessaging = FirebaseMessaging.instance;
  static final _localNotifications = FlutterLocalNotificationsPlugin();

  // static Future<void> initialize() async {
  //   // Request permission
  //   await _firebaseMessaging.requestPermission();
  //
  //   // Get the device token (optional: for sending notifications to this device)
  //   String? token = await _firebaseMessaging.getToken();
  //   print("FCM Token: $token");
  //
  //   // Setup local notifications
  //   const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
  //   const initializationSettings = InitializationSettings(android: androidSettings);
  //   await _localNotifications.initialize(initializationSettings);
  //
  //   // Handle foreground messages
  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //     if (message.notification != null) {
  //       _showLocalNotification(message.notification!);
  //     }
  //   });
  //
  //   // Optional: Handle background and terminated state
  //   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //     print('Message clicked!');
  //   });
  // }

  static void _showLocalNotification(RemoteNotification notification) {
    const androidDetails = AndroidNotificationDetails(
      'default_channel',
      'Default',
      channelDescription: 'Default notification channel',
      importance: Importance.max,
      priority: Priority.high,
    );
    const platformDetails = NotificationDetails(android: androidDetails);
    _localNotifications.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000,
      notification.title,
      notification.body,
      platformDetails,
    );
  }
}
