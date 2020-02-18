import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:memory_pill/screens/home_screen.dart';


import 'dart:async';

import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/widgets.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager.initialize();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        theme: ThemeData(
          fontFamily: 'Poppins',
          iconTheme: IconThemeData(color: Colors.blue),
          hintColor: Colors.indigo,
          primaryColor: Colors.indigo,

        ),
        home: HomeScreen());
  }
}
