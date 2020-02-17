import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget homeAppBar() {
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
            fontSize: 22.00,
            color: Colors.grey,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    ),
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.blue),
  );
}
