import 'dart:developer';
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tzd;

class NotificationSercice {
  static GlobalKey<NavigatorState>? navigatorKey;

  bool isInit = false;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static const AndroidInitializationSettings androidInitializationSettings =
      AndroidInitializationSettings("@mipmap/ic_launcher");
  static const DarwinInitializationSettings darwinInitializationSettings =
      DarwinInitializationSettings();

  static final InitializationSettings initializationSettings =
      const InitializationSettings(
    android: androidInitializationSettings,
    iOS: darwinInitializationSettings,
  );

//initialize notification
  Future<void> initNotification() async {
    tzd.initializeTimeZones();

    try {
      await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: (details) {
          log("Notification tapped: ${details.payload}");
          if (details.payload != null) {
            navigatorKey?.currentState?.pushNamed(details.payload!);
          }
        },
      );
      isInit = true;
    } catch (e) {
      log("Error while initializing notification: $e");
    }
  }

  //ontime notification
  Future<void> onTimeNotification() async {
    if (!isInit) {
      await initNotification();
    }
    flutterLocalNotificationsPlugin.show(
      0,
      "One Time Notification",
      "On Time Notification",
      const NotificationDetails(
        iOS: DarwinNotificationDetails(
            presentAlert: true, presentBadge: true, presentSound: true),
        android: AndroidNotificationDetails(
          "1",
          "first_channel",
          channelDescription: "This is the first notification channel",
          priority: Priority.high,
          importance: Importance.max,
        ),
      ),
      // payload: "second_screen",
    );
  }

  Future<void> scheduledNotification({required int seconds}) async {
    if (!isInit) {
      await initNotification();
    }
    const NotificationDetails notificationDetails = NotificationDetails(
      iOS: DarwinNotificationDetails(
          presentAlert: true, presentBadge: true, presentSound: true),
      android: AndroidNotificationDetails("2", "second_channel",
          channelDescription:
              "This is the second channel for scheduled notification",
          importance: Importance.max,
          priority: Priority.high),
    );

    flutterLocalNotificationsPlugin.zonedSchedule(
      1,
      "Scheduled Notification",
      "Scheduled Notification Example",
      tz.TZDateTime.now(tz.local).add(
        Duration(seconds: seconds),
      ),
      notificationDetails,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      // payload: "second_screen",
    );
  }
}
