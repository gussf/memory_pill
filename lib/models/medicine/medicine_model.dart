import 'package:memory_pill/models/medicine/medicine_schedule.dart';
import 'package:memory_pill/models/dosage/dosage.dart';
import 'package:json_annotation/json_annotation.dart';

part 'medicine_model.g.dart';


@JsonSerializable(explicitToJson: true)
class Medicine {
  String name;
  Dosage dosage;
  MedicineSchedule medicineSchedule;

  factory Medicine.fromJson(Map<String, dynamic> json) => _$MedicineFromJson(json);

  Map<String, dynamic> toJson() => _$MedicineToJson(this);

  Medicine(this.name, this.dosage, this.medicineSchedule);


  int get dosageVal => dosage.dosage;

  String get scheduledTime => medicineSchedule.timeScheduled;

  int get frequency => dosage.frequency;

  MedicineSchedule get medAlarm => medicineSchedule;

  String getMedicineDosage() {
    return this.dosageVal.toString() + ' unidade' + (dosageVal > 1 ? 's' : '');
  }

  String getMedicineFrequencyDescription() {
    String frequencyDescription = '';
    if (this.frequency != null) {
      frequencyDescription += '${this.frequency} em ${this.frequency}h';
    }

    return frequencyDescription;
  }

  String getMedicineDosageDescription() {
    if (this.dosage.isDaily) return "Diario";

    return '+ ${this.dosage.remainingDoses} doses';
  }

  @override
  String toString() {
    return 'Medicine{_name: $name, _dosage: $dosage, _medicineAlarm: $medicineSchedule}';
  }
}
