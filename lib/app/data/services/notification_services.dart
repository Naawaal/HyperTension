import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsServices {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings initializationSettingsAndroid =
      const AndroidInitializationSettings('logo');

  void initialiseNotifications() async {
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void scheduleNotification() async {
    NotificationDetails notificationDetails = const NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id',
        'channel name',
        'channel description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
        playSound: true,
        enableVibration: true,
        icon: 'logo',
      ),
    );

    await flutterLocalNotificationsPlugin.periodicallyShow(
      0,
      'Daily Check',
      "It's time to sumbit your Bp and Pr",
      RepeatInterval.daily,
      notificationDetails,
    );
  }

  void cancelNotification() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
