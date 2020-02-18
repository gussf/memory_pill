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
    Storage.read().then((data) {
      setState(() {
        var userMap = jsonDecode(data);
        for (var medicineScheduleJson in userMap) {
          var med = Medicine.fromJson(medicineScheduleJson);
          Storage.addScheduledMedicine(med);
          Storage.save();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Build called');
//    Medicine amox = Medicine(
//        'Aspirina', Dosage(1, 10, false, 8), MedicineSchedule(18, 45, true));
//    Medicine viral = Medicine(
//        'Antiviral', Dosage(2, 8, true, null), MedicineSchedule(13, 23, false));
//    Medicine antialergico = Medicine(
//        'Antialergico', Dosage(2, 8, true, null), MedicineSchedule(13, 23, false));

    return Container(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: Storage.schedulesMedicines.length,
            itemBuilder: buildMedicineSchedule));
  }

  Widget buildMedicineSchedule(context, index) {
    var currentMed = Storage.schedulesMedicines.elementAt(index);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 5, right: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.indigo.withOpacity(0.15),
          borderRadius: BorderRadius.circular(30),
        ),
        height: 120.0,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.toggleOn),
              color: Colors.green,
              iconSize: 40.0,
              onPressed: () {},
            ),
            Expanded(
              child: medicineDescription(currentMed),
            ),
            Expanded(
              child: medicineRemainingDosesInfo(currentMed),
            ),
            Column(
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
                    });
                  },
                )
              ],
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
        children: <Widget>[
          Text(medicine.getMedicineDosage()),
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
