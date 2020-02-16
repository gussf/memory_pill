import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memory_pill/models/medicine/medicine_model.dart';
import 'package:memory_pill/models/medicine/medicine_alarm.dart';
import 'package:memory_pill/models/dosage/dosage.dart';
import 'package:memory_pill/widgets/action_button.dart';
import 'package:memory_pill/widgets/medicine_schedule.dart';

Widget homeScreen() {
  return Scaffold(
    appBar: _homeAppBar(),
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
        Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              buildActionButton(Icon(FontAwesomeIcons.notesMedical)),
              buildActionButton(Icon(FontAwesomeIcons.calendarAlt)),
            ],
          ),
        ),
        SizedBox(height: 20.0),
        ScheduledMedicines(),
      ],
    ),
  );
}

Widget _homeAppBar() {
  return AppBar(
    title: Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10.0, right: 20.0),
          child: Icon(
            FontAwesomeIcons.diagnoses,
            color: Colors.grey,
            size: 30.0,
          ),
        ),
        Text(
          'MemoryPill',
          style: TextStyle(
              fontSize: 22.00, color: Colors.grey, fontFamily: 'Poppins'),
        ),
      ],
    ),
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.blue),
  );
}

class ScheduledMedicines extends StatefulWidget {
  @override
  _ScheduledMedicinesState createState() => _ScheduledMedicinesState();
}

class _ScheduledMedicinesState extends State<ScheduledMedicines> {
  @override
  Widget build(BuildContext context) {
    Medicine amox = Medicine('Amoxicilina', Dosage(1, 10, 9, false, 8),
        MedicineAlarm(DateTime(2020, 1, 1, 18, 45), true));
    Medicine viral = Medicine('Antiviral', Dosage(2, 8, 0, true, null),
        MedicineAlarm(DateTime(2020, 1, 1, 10, 40), false));

    return Container(
      child: Column(
        children: <Widget>[
          medicineSchedule(amox),
          SizedBox(height: 5),
          medicineSchedule(viral),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
