import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_todo_app/repository/notifications_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationsRepositoryImpl implements NotificationsRepository {
  NotificationsRepositoryImpl(this.flutterLocalNotificationsPlugin, this.read) {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Asia/Tokyo'));
  }

  final Reader read;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  Future<bool> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
    return true;
  }

  @override
  Future<bool> setNotification(
      int id, String title, String body, DateTime scheduleAt) async {
    final scheduledTzDt = tz.TZDateTime.from(scheduleAt, tz.local);

    print("setDt:${scheduledTzDt.toString()}");

    await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        scheduledTzDt,
        const NotificationDetails(
            android: AndroidNotificationDetails(
                'your channel id', 'your channel name',
                channelDescription: 'your channel description')),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);

    return true;
  }
}
