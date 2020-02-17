class MedicineAlarm {
  int _hourScheduled;
  int _minuteScheduled;
  bool _isEnabled;

  String get timeScheduled =>
      _hourScheduled.toString().padLeft(2, '0') + ':' + _minuteScheduled.toString().padLeft(2, '0');

  bool get isEnabled => _isEnabled;

  MedicineAlarm(this._hourScheduled, this._minuteScheduled, this._isEnabled) {

  }

  @override
  String toString() {
    return 'MedicineAlarm{_hourScheduled: $_hourScheduled, _minuteScheduled: $_minuteScheduled, _isEnabled: $_isEnabled}';
  }
}
