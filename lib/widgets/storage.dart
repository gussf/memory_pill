import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:memory_pill/models/medicine/medicine_model.dart';
import 'package:path_provider/path_provider.dart';

class Storage {

  static List<Medicine> _schedulesMedicines = [];

  static Medicine newestMedicine;

  static List<Medicine> get schedulesMedicines =>
      List.unmodifiable(_schedulesMedicines);

  static void addScheduledMedicine(Medicine med) {
    _schedulesMedicines.add(med);
    newestMedicine = med;
  }

  static void removeScheduledMedicine(Medicine med) {
    _schedulesMedicines.remove(med);
    print(
        '_schedulesMedicines after removal: ' + _schedulesMedicines.toString());
  }

  static void removeScheduledMedicineAt(int index) {
    _schedulesMedicines.removeAt(index);
    print(
        '_schedulesMedicines after removal: ' + _schedulesMedicines.toString());
  }

  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  static Future<File> get _getFile async {
    final path = await _localPath;
    return File('$path/memory_pill_schedule.json');
  }

  static Future<String> read() async {
    try {
      final file = await _getFile;

      return file.readAsString();
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<File> save() async {
    print('save: length: ' + _schedulesMedicines.length.toString());
    String data = json.encode(_schedulesMedicines);
    final file = await _getFile;
    return file.writeAsString(data);
  }

  static void resetList() async {
    _schedulesMedicines = [];
  }

  static Future<File> resetFile() async {
    String data = '';
    //print(data);
    final file = await _getFile;
    return file.writeAsString(data);
  }

}
