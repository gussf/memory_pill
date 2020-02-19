import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memory_pill/models/dosage/dosage.dart';
import 'package:memory_pill/models/medicine/medicine_model.dart';
import 'package:memory_pill/models/medicine/medicine_schedule.dart';
import 'package:memory_pill/widgets/alarm_manager.dart';
import 'package:memory_pill/widgets/custom_form_field.dart';
import 'package:memory_pill/widgets/storage.dart';

class MedicineFormScreen extends StatefulWidget {
  @override
  _MedicineFormScreenState createState() => _MedicineFormScreenState();
}

class _MedicineFormScreenState extends State<MedicineFormScreen> {
  TextEditingController _medicineNameController = TextEditingController();
  TextEditingController _medicineFrequencyController = TextEditingController();
  TextEditingController _medicineDosageController = TextEditingController();
  TextEditingController _medicineTotalDosesController = TextEditingController();
  int chosenHour, chosenMinutes = 0;
  bool _isDaily = false;

  final _formKey = GlobalKey<FormState>();

  Medicine newMedicine;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FormHeader(),
                _displayTimePicker(),
                _showNameInput(),
                SizedBox(height: 10.0),
                _showFrequencyInput(),
                SizedBox(height: 10.0),
                _showDosageInfoInput(),
                SizedBox(height: 20.0),
                _showSubmitButtons(_formKey),
                SizedBox(
                  height: 20.0,
                )
              ]),
        ),
      ),
    );
  }

  // Displays and allows user to choose the time he wishes to schedule his medicine to
  Widget _displayTimePicker() {
    return Container(
      padding: const EdgeInsets.only(left: 30.0, right: 0.0, bottom: 20.0),
      child: CupertinoTimerPicker(
        mode: CupertinoTimerPickerMode.hm,
        onTimerDurationChanged: (data) {
          // Avoiding null value on hour
          if (data.inMinutes < 60) {
            chosenMinutes = data.inMinutes;
            chosenHour = 0;
          }
          chosenMinutes = (data.inMinutes % 60);
          chosenHour = (data.inMinutes ~/ 60);
        },
      ),
    );
  }

  // Displays a text form field for the medicine's name
  Widget _showNameInput() {
    return Container(
      padding: EdgeInsets.only(left: 30.0, right: 30.0),
      child: customTextFormField(
        TextInputType.text,
        'Nome do Remédio',
        'ex: Aspirina',
        _medicineNameController,
        true,
      ),
    );
  }

  // Displays a row with fields for the medicine's frequency (
  //      frequency (ex: 1 per 3 hours
  //        or
  //      daily
  Widget _showFrequencyInput() {
    // If a medicine is of daily intake, the frequency text field should be disabled
    bool isFrequencyDisabled = (!_isDaily);

    return Container(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: customTextFormField(
                TextInputType.number,
                'Frequência',
                'ex: 3 em 3h',
                _medicineFrequencyController,
                isFrequencyDisabled),
          ),
          _createIsDailyCheckBox(),
        ],
      ),
    );
  }

  Widget _createIsDailyCheckBox() {
    return Row(
      children: <Widget>[
        Checkbox(
          onChanged: _isDailyChanged,
          value: _isDaily,
        ),
        Text(
          "Diariamente",
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
              color: Colors.indigo),
        ),
      ],
    );
  }

  void _isDailyChanged(bool newValue) => setState(
        () {
          _isDaily = newValue;

          if (_isDaily)
            _medicineFrequencyController.text = 'Diário';
          else
            _medicineFrequencyController.text = '';
        },
      );

  // Displays a row with fields for the medicine's dosage
  //    total doses (ex: must take 10 pills in a period)
  //    dosage      (ex: must take 1 pill per day)
  Widget _showDosageInfoInput() {
    return Container(
        padding: const EdgeInsets.only(left: 30.0, right: 30.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: customTextFormField(
                TextInputType.number,
                'Dosagem',
                'ex: 1 unid.',
                _medicineDosageController,
                true,
              ),
            ),
            SizedBox(
              width: 5.0,
            ),
            Expanded(
              child: customTextFormField(
                TextInputType.number,
                'Doses totais',
                'ex: 12 doses.',
                _medicineTotalDosesController,
                true,
              ),
            ),
          ],
        ));
  }

  Widget _showSubmitButtons(_formKey) {
    return Container(
      padding: EdgeInsets.only(left: 30.0, right: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RaisedButton(
            child: Text(
              "Cancelar",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.red,
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          ButtonTheme(
            height: 50.0,
            minWidth: 130.0,
            child: RaisedButton(
              child: Text(
                "Criar ",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0)),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  newMedicine = new Medicine(
                      _medicineNameController.text,
                      new Dosage(
                          int.parse(_medicineDosageController.text),
                          int.parse(_medicineTotalDosesController.text),
                          _isDaily,
                          (_isDaily
                              ? null
                              : int.parse(_medicineFrequencyController.text))),
                      MedicineSchedule(chosenHour, chosenMinutes, true));

                  setState(() {
                    Storage.addScheduledMedicine(newMedicine);
                    Storage.save();
                    print(newMedicine);
                    alarmCallback();
                    Navigator.pop(context);
                  });
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class FormHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        'Novo lembrete',
        style: TextStyle(
          fontSize: 28.0,
          fontFamily: 'Poppins',
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}
