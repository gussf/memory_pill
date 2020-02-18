import 'package:flutter/material.dart';
import 'package:memory_pill/screens/app_bar.dart';
import 'package:memory_pill/screens/medicine_form.dart';
import 'package:memory_pill/screens/medicine_schedule_list.dart';
import 'package:memory_pill/widgets/menu_button.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20.0, left: 10.0),
            child: Text(
              'O que deseja fazer hoje?',
              style: TextStyle(fontSize: 28.00, fontFamily: 'Poppins'),
            ),
          ),
          SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              customMenuButton(
                  Icon(Icons.add_alert), () => goToFormScreen(context)),
            ],
          ),
          SizedBox(height: 20.0),
          ScheduledMedicines(),
        ],
      ),
    );
  }
}

void goToFormScreen(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return MedicineFormScreen();
    },
  );
}

