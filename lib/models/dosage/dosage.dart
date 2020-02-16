class Dosage {
  int _dosage;
  int _totalDoses;
  int _remainingDoses;
  bool _isDaily;
  int _frequency;

  Dosage(this._dosage, this._totalDoses, this._remainingDoses, this._isDaily,
      this._frequency);

  int get totalDoses => _totalDoses;

  int get dosage => _dosage;

  int get remainingDoses => _remainingDoses;

  bool get isDaily => _isDaily;

  int get frequency => _frequency;

  @override
  String toString() {
    return 'Dosage{_dosage: $_dosage, _totalDoses: $_totalDoses, _remainingDoses: $_remainingDoses, _isDaily: $_isDaily, _frequency: $_frequency}';
  }


}
