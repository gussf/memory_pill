import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memory_pill/models/medicine/medicine_model.dart';

Widget medicineRemainingDosesInfo(Medicine medicine) {
  return Chip(
    label: Text(medicine.getMedicineDosageDescription(),
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)),
  );
}

Widget medicineDescription(Medicine medicine) {
  return ListTile(
    title: Text(medicine.getMedicineDescription()),
    subtitle: Text(medicine.getMedicineFrequencyDescription()),
  );
}

Widget medicineSchedule(Medicine medicine) {
  print('Objeto recebido: ' + medicine.toString());

  return Container(
    decoration: BoxDecoration(
      color: Colors.grey.withOpacity(0.15),
      borderRadius: BorderRadius.circular(30),
    ),
    height: 100.0,
    child: Row(
      children: <Widget>[
        IconButton(
          icon: Icon(FontAwesomeIcons.toggleOn),
          color: Colors.green,
          iconSize: 40.0,
          onPressed: () {},
        ),
        Expanded(
          child: Container(
            child: medicineDescription(medicine),
          ),
        ),
        Expanded(child: medicineRemainingDosesInfo(medicine)),
        Column(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit, size: 30.0, color: Colors.grey),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.delete, size: 30.0, color: Colors.grey),
              onPressed: () {},
            )
          ],
        ),
      ],
    ),
  );
}
