// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicineSchedule _$MedicineScheduleFromJson(Map<String, dynamic> json) {
  return MedicineSchedule(
    json['hourScheduled'] as int,
    json['minuteScheduled'] as int,
    json['isEnabled'] as bool,
  );
}

Map<String, dynamic> _$MedicineScheduleToJson(MedicineSchedule instance) =>
    <String, dynamic>{
      'hourScheduled': instance.hourScheduled,
      'minuteScheduled': instance.minuteScheduled,
      'isEnabled': instance.isEnabled,
    };
