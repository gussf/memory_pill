class Dosage {
  int totalDosesNumber;
  int remainingDoses;
  bool isDaily;

  Dosage(this.totalDosesNumber, this.remainingDoses, this.isDaily);

  @override
  String toString() {
    return 'Dosage{totalDosesNumber: $totalDosesNumber, remainingDoses: $remainingDoses, isDaily: $isDaily}';
  }
}
