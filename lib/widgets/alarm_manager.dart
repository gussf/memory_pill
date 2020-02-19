
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:memory_pill/models/medicine/medicine_model.dart';
import 'package:memory_pill/widgets/storage.dart';

class NotificationManager {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  AndroidInitializationSettings initializationSettingsAndroid;
  IOSInitializationSettings initializationSettingsIOS;
  InitializationSettings initializationSettings;

  void initNotificationManager() {
    initializationSettingsAndroid =
        new AndroidInitializationSettings('@mipmap/ic_launcher');
    initializationSettingsIOS = new IOSInitializationSettings();
    initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }


  void showNotification(Medicine medicine) async {
    if (medicine == null) {
      print('showNotification - Medicine is null    ');
      return;
    }
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.Max, priority: Priority.High);
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
      androidPlatformChannelSpecifics,
      iOSPlatformChannelSpecifics,
    );

    if (medicine == null)
      return;

    flutterLocalNotificationsPlugin.show(
        0,
        medicine.name,
        'Tomar ' + medicine.dosageVal.toString() + ' agora!',
        platformChannelSpecifics);
  }

}

void alarmCallback() {
  var medicine = Storage.newestMedicine;
  if (medicine == null)
    return;
  NotificationManager n = new NotificationManager();
  n.initNotificationManager();
  n.showNotification(medicine);
  print("[*] Called from AlarmManager");
  return;
}
