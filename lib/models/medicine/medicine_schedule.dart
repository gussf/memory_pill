import 'package:json_annotation/json_annotation.dart';

part 'medicine_schedule.g.dart';

@JsonSerializable(explicitToJson: true)
class MedicineSchedule {
  int hourScheduled;
  int minuteScheduled;
  bool isEnabled;

  factory MedicineSchedule.fromJson(Map<String, dynamic> json) => _$MedicineScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$MedicineScheduleToJson(this);

  int get timeSchedulesInSeconds =>
      (hourScheduled * 60 * 60) + (minuteScheduled * 60);

  String get timeScheduled =>
      hourScheduled.toString().padLeft(2, '0') + ':' + minuteScheduled.toString().padLeft(2, '0');

  MedicineSchedule(this.hourScheduled, this.minuteScheduled, this.isEnabled) {
    if (hourScheduled == null)
      hourScheduled = 0;

    if (minuteScheduled == null)
      minuteScheduled = 0;
  }

  @override
  String toString() {
    return 'MedicineAlarm{_hourScheduled: $hourScheduled, _minuteScheduled: $minuteScheduled, _isEnabled: $isEnabled}';
  }
}
