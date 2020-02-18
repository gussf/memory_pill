// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dosage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dosage _$DosageFromJson(Map<String, dynamic> json) {
  return Dosage(
    json['dosage'] as int,
    json['totalDoses'] as int,
    json['isDaily'] as bool,
    json['frequency'] as int,
  );
}

Map<String, dynamic> _$DosageToJson(Dosage instance) => <String, dynamic>{
      'dosage': instance.dosage,
      'totalDoses': instance.totalDoses,
      'isDaily': instance.isDaily,
      'frequency': instance.frequency,
    };
