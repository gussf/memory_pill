import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:memory_pill/models/dosage/dosage.dart';
import 'package:memory_pill/models/medicine/medicine_schedule.dart';
import 'package:memory_pill/models/medicine/medicine_model.dart';
import 'package:memory_pill/screens/medicine_schedule_list.dart';
import 'package:memory_pill/widgets/menu_button.dart';
import 'package:memory_pill/screens/medicine_form.dart';
import 'package:memory_pill/screens/app_bar.dart';
import 'package:memory_pill/widgets/storage.dart';

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

// Responsible for showing the list of scheduled medicines
class ScheduledMedicines extends StatefulWidget {
  @override
  _ScheduledMedicinesState createState() => _ScheduledMedicinesState();
}

class _ScheduledMedicinesState extends State<ScheduledMedicines> {
  List medSchedules = [];

  @override
  void initState() {
    super.initState();
    var storage = Storage();
    storage.read().then((data) {
      setState(() {
        var userMap = jsonDecode(data);
        for (var medicineSchedule in userMap) {
          medSchedules.add((medicineSchedule));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Medicine amox = Medicine(
        'Aspirina', Dosage(1, 10, false, 8), MedicineSchedule(18, 45, true));
    Medicine viral = Medicine(
        'Antiviral', Dosage(2, 8, true, null), MedicineSchedule(13, 23, false));

 /*   List<Medicine> meds = [amox, viral];

    String json = jsonEncode(meds);
    print('meds: ' + json);
    var storage = Storage();
    storage.save(meds);
 */
    print('@@ ' + medSchedules.toString());
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
