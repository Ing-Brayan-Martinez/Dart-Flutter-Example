import 'dart:async';

import 'package:optional/optional.dart';
import 'package:persistence_flutter/persistence/core/database-config.dart';
import 'package:persistence_flutter/persistence/core/database_hellper.dart';
import 'package:persistence_flutter/persistence/entity/entity_context.dart';
import 'package:persistence_flutter/persistence/query/filter/filter.dart';
import 'package:persistence_flutter/persistence/sql/read_sql_builder.dart';

class QueryExecute<T> {

  DatabaseHelper _helper;
  ReadSqlBuilder _builder;

  QueryExecute(List<Filter> filters, EntityContext context) {
    _helper = new DatabaseHelper(new DataBaseConfig());
    _builder = new ReadSqlBuilder(filters, context);
  }

  Future<Optional<T>> getSingleResult(T Function(Map<String, Object> row) mapper) async {
    final String sql = _builder.select();
    final List<Map<String, Object>> list = await _helper.find(sql);
    return list.isNotEmpty
        ? Future.value(Optional.ofNullable(mapper(list.first)))
        : Future.value(Optional.empty());
  }

  Future<List<T>> getResultList(T Function(Map<String, Object> row) mapper) async {
    final String sql = _builder.select();
    final List<Map<String, Object>> list = await _helper.find(sql);
    final List<T> pos = list.map(mapper).toList();
    return Future.value(pos);
  }

  Stream<T> getResultStream(T Function(Map<String, Object> row) mapper) async* {
    final String sql = _builder.select();
    final List<Map<String, Object>> list = await _helper.find(sql);
    for (Map<String, Object> value in list) {
      yield mapper(value);
    }
  }

}