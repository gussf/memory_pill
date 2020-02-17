import 'package:flutter/material.dart';


Widget menuButton(Icon iconParam, VoidCallback onButtonPress) {
  return Padding(
    padding: const EdgeInsets.only(left: 5.0, right: 5.0),
    child: Container(
      height: 60.0,
      width: 60.0,
      decoration: BoxDecoration(
          color: Colors.lightBlueAccent.withOpacity(0.25),
          borderRadius: BorderRadius.circular(30.0)),
      child: IconButton(

        icon: iconParam,
        iconSize: 30,
        onPressed: () { onButtonPress();},
      ),
    ),
  );
}


