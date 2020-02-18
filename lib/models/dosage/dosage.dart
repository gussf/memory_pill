import 'package:json_annotation/json_annotation.dart';

part 'dosage.g.dart';

@JsonSerializable(explicitToJson: true)
class Dosage {
  int dosage;
  int totalDoses;
  int _remainingDoses;
  bool isDaily;
  int frequency;


  factory Dosage.fromJson(Map<String, dynamic> json) => _$DosageFromJson(json);

  Map<String, dynamic> toJson() => _$DosageToJson(this);


  Dosage(this.dosage, this.totalDoses, this.isDaily, this.frequency) {
    this._remainingDoses = totalDoses;
  }


  int get remainingDoses => _remainingDoses;



  @override
  String toString() {
    return 'Dosage{_dosage: $dosage, _totalDoses: $totalDoses, _isDaily: $isDaily, _frequency: $frequency}';
  }
}
