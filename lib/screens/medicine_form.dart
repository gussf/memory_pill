import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MedicineFormScreen extends StatefulWidget {
  @override
  _MedicineFormScreenState createState() => _MedicineFormScreenState();
}

class _MedicineFormScreenState extends State<MedicineFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: const InputDecoration(
                alignLabelWithHint: true,
                icon: Icon(FontAwesomeIcons.pills, color: Colors.blue,),
                hintText: 'Qual remédio deseja inserir?',
                labelText: 'Nome do Remédio',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              enabled: false,
              decoration: const InputDecoration(
                icon: Icon(FontAwesomeIcons.pills, color: Colors.blue,),
                hintText: 'Qual remédio deseja inserir?',
                labelText: 'Nome do Remédio',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              child: Text("Submit"),
              onPressed: () {
                //if (_formKey.currentState.validate()) {
                //  _formKey.currentState.save();
                //}
              },
            ),
          )
        ],
      ),
    );
  }
}