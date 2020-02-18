import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:memory_pill/models/medicine/medicine_model.dart';

Widget medicineSchedule(Medicine medicine) {
  print('Objeto recebido: ' + medicine.toString());

  return Container(
    decoration: BoxDecoration(
      color: Colors.indigo.withOpacity(0.05),
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
          child: medicineDescription(medicine),
        ),
        Expanded(
          child: medicineRemainingDosesInfo(medicine),
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
              onPressed: () {},
            )
          ],
        ),
      ],
    ),
  );
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
        style: TextStyle(
            fontSize: 14.0, color: Colors.white)),
    backgroundColor: Colors.teal,
  );
}
