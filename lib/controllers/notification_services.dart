// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:schoolapp/models/timetable_model.dart';


import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationService {
  final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    // _configureLocalTimezone();

    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings(
            '@mipmap/ic_launcher'); //If Application crashes at time of notification, comment this line and uncomment below line.
    // const AndroidInitializationSettings('@drawable/ic_launcher');
    var initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {});

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await _notifications.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {
      showNotification();
    });
  }

  Future<void> sheduledNotification(
      { required TimeTable task}) async {
    DateTime? scheduledTime;
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails(
      'Angle',
      'School App',
      importance: Importance.max,
      priority: Priority.high,
            ticker: 'ticker',
            ledColor: Colors.black,
            enableVibration: true,
            ledOffMs: 10,
            ledOnMs: 4,
            channelShowBadge: false,
            color: Colors.black,
            playSound: true,
            icon: '@drawable/ic_launcher',
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );



    final now = DateTime.now();
     scheduledTime = now.copyWith(hour: task.time.hour,minute: task.time.minute);
    if (task.day == now.weekday && scheduledTime.isBefore(now)) {
      scheduledTime = scheduledTime.copyWith(day: now.day+7);
    }else {
      final daysToAdd = (task.day - now.weekday + 7) % 7;
      scheduledTime = scheduledTime.copyWith(day: now.day+daysToAdd);
    }



    final abcd = tz.TZDateTime.fromMillisecondsSinceEpoch(tz.local, scheduledTime.millisecondsSinceEpoch);

    await _notifications.zonedSchedule(
      Random().nextInt(90), 'task.title', 'task.classs',
      abcd,
      notificationDetails,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      // matchDateTimeComponents: DateTimeComponents.time
    );


  }



  notificationsDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'MY App',
            importance: Importance.max,
            ticker: 'ticker',
            ledColor: Colors.black,
            enableVibration: true,
            ledOffMs: 10,
            ledOnMs: 4,
            channelShowBadge: false,
            color: Colors.black,
            playSound: true,
            icon: '@drawable/ic_launcher',
            priority: Priority.high),
        iOS: DarwinNotificationDetails());
  }

  Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async {
    _notifications.show(id, title, body, await notificationsDetails(),
        payload: payload);
  }
}
