
import 'package:persistence_flutter/persistence/entity/column.dart';

class EntityContext {

  String _table;
  List<Column> _columns;

  EntityContext() {
    _columns = [];
  }

  List<Column> get columns => _columns;

  void addColumn(Column column) {
    _columns.add(column);
  }

  String get table => _table;

  set table(String value) {
    _table = value;
  }

  Column getFirstColumn() {
    return _columns.first;
  }

}