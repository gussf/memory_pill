import 'package:json_annotation/json_annotation.dart';

part 'medicine_schedule.g.dart';

@JsonSerializable(explicitToJson: true)
class MedicineSchedule {
  int hourScheduled;
  int minuteScheduled;
  bool isEnabled;

  factory MedicineSchedule.fromJson(Map<String, dynamic> json) => _$MedicineScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$MedicineScheduleToJson(this);


  String get timeScheduled =>
      hourScheduled.toString().padLeft(2, '0') + ':' + minuteScheduled.toString().padLeft(2, '0');

  MedicineSchedule(this.hourScheduled, this.minuteScheduled, this.isEnabled);

  @override
  String toString() {
    return 'MedicineAlarm{_hourScheduled: $hourScheduled, _minuteScheduled: $minuteScheduled, _isEnabled: $isEnabled}';
  }
}
