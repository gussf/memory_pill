import 'package:memory_pill/models/medicine/medicine_alarm.dart';
import 'package:memory_pill/models/dosage/dosage.dart';

class Medicine {
  String _name;
  Dosage _dosage;
  MedicineAlarm _medicineAlarm;

  Medicine(this._name, this._dosage, this._medicineAlarm);

  String get name => _name;

  int get dosageVal => _dosage.dosage;

  String get scheduledTime => _medicineAlarm.timeScheduled;

  int get frequency => _dosage.frequency;

  MedicineAlarm get medAlarm => _medicineAlarm;

  String getMedicineDescription() {
    return '${this.name}, ${this.dosageVal} unid.';
  }

  String getMedicineFrequencyDescription() {
    String frequencyDescription = this.scheduledTime;
    if (this.frequency != null) {
      frequencyDescription += '  (${this.frequency} em ${this.frequency}h)';
    }

    return frequencyDescription;
  }

  String getMedicineDosageDescription() {
    if (this._dosage.isDaily) return "Diario";

    return 'Faltam ${this._dosage.remainingDoses} doses';
  }

  @override
  String toString() {
    return 'Medicine{_name: $_name, _dosage: $_dosage, _medicineAlarm: $_medicineAlarm}';
  }
}
