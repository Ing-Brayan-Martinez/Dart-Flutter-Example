
import 'package:persistence_flutter/persistence/core/database-config.dart';
import 'package:persistence_flutter/persistence/core/database_hellper.dart';
import 'package:persistence_flutter/persistence/entity/entity_context.dart';
import 'package:persistence_flutter/persistence/sql/writer_sql_builder.dart';

class EntityExecute {

  DatabaseHelper _helper;
  WriterSqlBuilder _builder;

  EntityExecute() {
    _helper = new DatabaseHelper(new DataBaseConfig());
    _builder = new WriterSqlBuilder();
  }

  void insert(EntityContext context, Map<String, Object> values) {
    final String sql = _builder.insert(context, values);
    this._helper.insert(sql);
  }

  void update(EntityContext context, Map<String, Object> values) {
    final String sql = _builder.updated(context, values);
    this._helper.update(sql);
  }

  void delete(EntityContext context, Map<String, Object> values) {
    final String sql = _builder.delete(context, values);
    this._helper.delete(sql);
  }
}