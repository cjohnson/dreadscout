import 'scoutingdata.dart';

class DataStore {
  Map<String, ScoutingData> scoutingForms = {};

  DataStore._privateConstructor();

  static final DataStore _instance = DataStore._privateConstructor();
  factory DataStore() => _instance;
}