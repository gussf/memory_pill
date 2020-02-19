import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memory_pill/models/medicine/medicine_model.dart';
import 'package:memory_pill/widgets/storage.dart';

// Responsible for showing the list of scheduled medicines
class ScheduledMedicines extends StatefulWidget {
  @override
  _ScheduledMedicinesState createState() => _ScheduledMedicinesState();
}

class _ScheduledMedicinesState extends State<ScheduledMedicines> {
  @override
  void initState() {
    super.initState();

    Storage.newestMedicine = null;
    Storage.read().then((data) {
      Storage.resetList();
      setState(() {
        try {
          var userMap = jsonDecode(data);
          for (var medicineScheduleJson in userMap) {
            var med = Medicine.fromJson(medicineScheduleJson);
            Storage.addScheduledMedicine(med);
          }
        } catch (e) {
          print('Error with JSON: ' + e.toString());
          print('Erasing corrupted json file');
          Storage.resetFile();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
          itemCount: Storage.schedulesMedicines.length,
          itemBuilder: buildMedicineSchedule),
    );
  }

  Widget buildMedicineSchedule(context, index) {
    var currentMed = Storage.schedulesMedicines.elementAt(index);
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.indigo.withOpacity(0.15),
          borderRadius: BorderRadius.circular(30),
        ),
        height: 135.0,
        child: Row(
          children: <Widget>[
            Flexible(
              flex: 2,
              child: IconButton(
                icon: Icon(FontAwesomeIcons.toggleOn),
                color: Colors.green,
                iconSize: 30.0,
                onPressed: () {},
              ),
            ),
            Flexible(
              flex: 5,
              child: medicineDescription(currentMed),
            ),
            Flexible(
              flex: 3,
              child: medicineRemainingDosesInfo(currentMed),
            ),
            Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.edit, size: 30.0, color: Colors.grey),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, size: 30.0, color: Colors.grey),
                    onPressed: () {
                      setState(() {
                        print('Removendo ' +
                            Storage.schedulesMedicines[index].toString());
                        Storage.removeScheduledMedicineAt(index);
                        Storage.save();
                      });
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget medicineDescription(Medicine medicine) {
  return Padding(
    padding: EdgeInsets.only(top: 20.0),
    child: ListTile(
      title: Text(medicine.name,
          textAlign: TextAlign.left,
          style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(medicine.getMedicineDosage()),
          Text(medicine.scheduledTime),
          Text(medicine.getMedicineFrequencyDescription())
        ],
      ),
    ),
  );
}

Widget medicineRemainingDosesInfo(Medicine medicine) {
  return Chip(
    label: Text(medicine.getMedicineDosageDescription(),
        style: TextStyle(fontSize: 14.0, color: Colors.white)),
    backgroundColor: Colors.teal,
  );
}
