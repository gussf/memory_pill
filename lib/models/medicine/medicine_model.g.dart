// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Medicine _$MedicineFromJson(Map<String, dynamic> json) {
  return Medicine(
    json['name'] as String,
    json['dosage'] == null
        ? null
        : Dosage.fromJson(json['dosage'] as Map<String, dynamic>),
    json['medicineSchedule'] == null
        ? null
        : MedicineSchedule.fromJson(
            json['medicineSchedule'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MedicineToJson(Medicine instance) => <String, dynamic>{
      'name': instance.name,
      'dosage': instance.dosage?.toJson(),
      'medicineSchedule': instance.medicineSchedule?.toJson(),
    };
