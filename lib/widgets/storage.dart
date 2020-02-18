import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:path_provider/path_provider.dart';

class Storage{
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _getFile async {
    final path = await _localPath;
    return File('$path/memory_pill_schedule.json');
  }

  Future<String> read() async {
    try {
      final file = await _getFile;

      return file.readAsString();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<File> save(List list) async {
    String data = json.encode(list);
    print(data);
    final file = await _getFile;
    return file.writeAsString(data);
  }
}
