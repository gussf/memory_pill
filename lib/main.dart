import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:memory_pill/screens/home_screen.dart';

void main(){

  WidgetsFlutterBinding.ensureInitialized();
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
