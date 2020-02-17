import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MedicineFormScreen extends StatefulWidget {
  @override
  _MedicineFormScreenState createState() => _MedicineFormScreenState();
}

class _MedicineFormScreenState extends State<MedicineFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Novo lembrete',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontFamily: 'Poppins',
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 30.0, right: 0.0, bottom: 20.0),
                child: CupertinoTimerPicker(
                  mode: CupertinoTimerPickerMode.hm,
                  onTimerDurationChanged: (data) {},
                ),
              ),
              MedicineNameInput(),
              SizedBox(height: 10.0),
              FrequencyOptionsInput(),
              SizedBox(height: 10.0),
              DosageInfoInput(),
              SizedBox(height: 20.0),
              RaisedButton(
                child: Text("Submit"),
                onPressed: () {
                  //if (_formKey.currentState.validate()) {
                  //  _formKey.currentState.save();
                  //}
                },
              )
            ],
          ),
        ));
  }
}

class DosageInfoInput extends StatefulWidget {
  @override
  _DosageInfoInputState createState() => _DosageInfoInputState();
}

class _DosageInfoInputState extends State<DosageInfoInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  alignLabelWithHint: true,
                  labelText: 'Dosagem',
                  hintText: 'ex: 1 unid.',
                ),
              ),
            ),
            SizedBox(
              width: 30.0,
            ),
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  alignLabelWithHint: true,
                  labelText: 'Doses totais',
                  hintText: 'ex: 12 doses',
                ),
              ),
            ),
          ],
        ));
  }
}

class MedicineNameInput extends StatefulWidget {
  @override
  _MedicineNameInputState createState() => _MedicineNameInputState();
}

class _MedicineNameInputState extends State<MedicineNameInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
      child: TextFormField(
        decoration: const InputDecoration(
          alignLabelWithHint: true,
          labelText: 'Nome do Remédio',
          hintText: 'ex: Aspirina',
        ),
      ),
    );
  }
}

class FrequencyOptionsInput extends StatefulWidget {
  @override
  _FrequencyOptionsInputState createState() => _FrequencyOptionsInputState();
}

class _FrequencyOptionsInputState extends State<FrequencyOptionsInput> {
  bool _isDaily = false;

  final TextEditingController frequencyValueController =
      new TextEditingController();

  void _isDailyChanged(bool newValue) => setState(() {
        _isDaily = newValue;

        if (_isDaily) frequencyValueController.clear();
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextFormField(
              controller: frequencyValueController,
              enabled: !_isDaily,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                alignLabelWithHint: true,
                labelText: 'Frequência',
                hintText: 'ex: de 3 em 3h',
              ),
            ),
          ),
          Checkbox(
            onChanged: _isDailyChanged,
            value: _isDaily,
          ),
          Text(
            "Diariamente",
            style: TextStyle(fontFamily: 'Poppins', fontSize: 15.0),
          )
        ],
      ),
    );
  }
}
