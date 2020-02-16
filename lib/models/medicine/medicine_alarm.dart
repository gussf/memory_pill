import 'package:memory_pill/models/medicine/medicine_model.dart';

class MedicineAlarm {
  DateTime _timeScheduled;
  bool _isEnabled;

  String get timeScheduled => _timeScheduled.hour.toString() + ':' + _timeScheduled.minute.toString();


  bool get isEnabled => _isEnabled;

  MedicineAlarm(this._timeScheduled, this._isEnabled);



  @override
  String toString() {
    return 'MedicineAlarm{timeScheduled: $_timeScheduled, isEnabled: $_isEnabled}';
  }
}
