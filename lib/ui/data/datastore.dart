import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../form/data/scoutingtemplate.dart';

class DataStore {
  Map<String, ScoutingForm> scoutingForms = {};

  DataStore._privateConstructor();

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/savedData.json');
  }

  void writeToDisk() async {
    final file = await _localFile;

    var jsonEncode2 = jsonEncode(scoutingForms);
    print(jsonEncode2);
    file.writeAsString(jsonEncode2);
  }

  void readFromDisk() async {
    try {
      final file = await _localFile;

      final contents = await file.readAsString();

      print(jsonDecode(contents));
    } catch(e) {
      return;
    }
  }

  void saveData(ScoutingForm form) {
    scoutingForms[form.formId!] = form;
  }

  static final DataStore _instance = DataStore._privateConstructor();
  factory DataStore() => _instance;
}