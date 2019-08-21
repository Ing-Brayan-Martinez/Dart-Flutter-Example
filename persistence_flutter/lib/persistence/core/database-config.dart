
import 'package:persistence_flutter/persistence/entity/po.dart';

class DataBaseConfig {

  static DataBaseConfig _instance;

  bool _singleInstance;
  String _databaseName;
  int _databaseVersion;
  List<PO> _databaseTables;

  ///Para implementar el patron singlenton usando la
  ///palabra reservada factory
  ///
  factory DataBaseConfig() {
    if (_instance == null) {
      _instance = DataBaseConfig._internal();
    }
    return _instance;
  }

  ///Constructor real
  DataBaseConfig._internal() {
     _databaseTables = new List();
  }

  List<PO> get databaseTables => _databaseTables;

  set databaseTables(List<PO> value) {
    _databaseTables = value;
  }

  int get databaseVersion => _databaseVersion;

  set databaseVersion(int value) {
    _databaseVersion = value;
  }

  String get databaseName => _databaseName;

  set databaseName(String value) {
    _databaseName = value;
  }

  bool get singleInstance => _singleInstance;

  set singleInstance(bool value) {
    _singleInstance = value;
  }


}