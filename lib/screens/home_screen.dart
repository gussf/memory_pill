import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget BuildActionButton(Icon iconParam) {
  return Container(
    height: 60.0,
    width: 60.0,
    decoration: BoxDecoration(
        color: Colors.lightBlueAccent.withOpacity(0.25),
        borderRadius: BorderRadius.circular(30.0)),
    child: IconButton(
      icon: iconParam,
      iconSize: 30,
      onPressed: () {},
    ),
  );
}

Widget _HomeAppBar() {
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

Widget HomeScreen() {
  return Scaffold(
    appBar: _HomeAppBar(),
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
              BuildActionButton(Icon(FontAwesomeIcons.notesMedical)),
              BuildActionButton(Icon(FontAwesomeIcons.calendarAlt)),
            ],
          ),
        ),
        SizedBox(height: 20.0),
        Container(
          child: Column(
            children: <Widget>[
              Container(
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
                        child: ListTile(
                          title: Text('Amoxicilina, 1 unid.'),
                          subtitle: Text('18:45  (8 em 8h)'),
                        ),
                      ),
                    ),
                    Chip(
                      label: Text('Faltam 2 doses',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.0)),
                    ),
                    Column(
                      children: <Widget>[
                        IconButton(
                          icon:
                              Icon(Icons.edit, size: 30.0, color: Colors.grey),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.delete,
                              size: 30.0, color: Colors.grey),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(30),
                ),
                height: 100.0,
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(FontAwesomeIcons.toggleOff),
                      color: Colors.grey.withOpacity(0.9),
                      iconSize: 40.0,
                      onPressed: () {},
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('Antiviral, 2 unid.'),
                        subtitle: Text('10:00'),
                      ),
                    ),
                    Expanded(
                      child: Chip(
                        label: Text('Diario',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15.0)),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        IconButton(
                          icon:
                              Icon(Icons.edit, size: 30.0, color: Colors.grey),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.delete,
                              size: 30.0, color: Colors.grey),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
      ],
    ),
  );
}
