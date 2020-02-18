import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:memory_pill/models/medicine/medicine_model.dart';
import 'package:android_alarm_manager/android_alarm_manager.dart';

class NotificationManager
{
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  AndroidInitializationSettings initializationSettingsAndroid;
  IOSInitializationSettings initializationSettingsIOS;
  InitializationSettings initializationSettings;

  void initNotificationManager()
  {
    initializationSettingsAndroid = new AndroidInitializationSettings('@mipmap/ic_launcher');
    initializationSettingsIOS = new IOSInitializationSettings();
    initializationSettings = new InitializationSettings(initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void showNotificationWithDefaultSound(Medicine medicine)
  {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails('your channel id', 'your channel name', 'your channel description', importance: Importance.Max, priority: Priority.High);
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    flutterLocalNotificationsPlugin.show(0, medicine.name, 'Tomar ' + medicine.dosageVal.toString() + ' agora!', platformChannelSpecifics);
  }

  void showDailyNotificationWithDefaultSound(Medicine medicine)
  {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails('your channel id', 'your channel name', 'your channel description', importance: Importance.Max, priority: Priority.High);
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    flutterLocalNotificationsPlugin.show(0, medicine.name, 'Tomar ' + medicine.dosageVal.toString() + ' agora!', platformChannelSpecifics);
  }
}

void alarmCallback(Medicine medicine)
{
  NotificationManager n = new NotificationManager();
  n.initNotificationManager();
  n.showNotificationWithDefaultSound(medicine);
  print("[*] Called from AlarmManager");
  return;
}
