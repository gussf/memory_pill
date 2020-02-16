import 'package:memory_pill/models/medicine/medicine_alarm.dart';
import 'package:memory_pill/models/dosage/dosage.dart';

class Medicine {
  String name;
  Dosage dosage;
  MedicineAlarm medAlarm;

  Medicine.create(this.name, this.dosage, this.medAlarm);

  @override
  String toString() {
    return 'Medicine{name: $name, dosage: $dosage, medAlarm: $medAlarm}';
  }
}
