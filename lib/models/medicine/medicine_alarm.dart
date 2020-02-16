class MedicineAlarm {
  DateTime timeScheduled;
  int medicineFrequency;
  bool isEnabled;

  MedicineAlarm(this.timeScheduled, this.medicineFrequency, this.isEnabled);

  @override
  String toString() {
    return 'MedicineAlarm{timeScheduled: $timeScheduled, medicineFrequency: $medicineFrequency, isEnabled: $isEnabled}';
  }
}
