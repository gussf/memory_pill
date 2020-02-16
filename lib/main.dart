import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
        iconTheme: IconThemeData(color: Colors.blue),
      ),
      home: Scaffold(
        appBar: AppBar(
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
              Text('MemoryPill',
                  style: TextStyle(fontSize: 22.00, color: Colors.grey)),
            ],
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.blue),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20.0, left: 20.0),
              child: Text(
                'O que deseja fazer hoje?',
                style: TextStyle(fontSize: 28.00),
              ),
            ),
            SizedBox(height: 30.0),
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                        color: Colors.lightBlueAccent.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(30.0)),
                    child: IconButton(
                      icon: Icon(FontAwesomeIcons.capsules),
                      iconSize: 30,
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                        color: Colors.lightBlueAccent.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(30.0)),
                    child: IconButton(
                      icon: Icon(FontAwesomeIcons.calendarAlt),
                      iconSize: 30,
                      onPressed: () {},
                    ),
                  ),
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
                    height: 70.0,
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(FontAwesomeIcons.toggleOn),
                          color: Colors.green,
                          iconSize: 40.0,
                          onPressed: () {},
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text('Amoxicilina, 1 dose'),
                            subtitle: Text('18:45  (8 em 8h)'),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete,
                              size: 30.0, color: Colors.grey),
                          onPressed: () {},
                        )
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
                        Flexible(
                          child: ListTile(
                            title: Text('Antiviral, 2 un.'),
                            subtitle: Text('10:00'),
                          ),
                        ),
                        Flexible(
                          child: ListTile(
                            title: Text('diario'),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete,
                              size: 30.0, color: Colors.grey),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
