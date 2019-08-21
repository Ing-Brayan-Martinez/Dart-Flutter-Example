
import 'package:optional/optional.dart';
import 'package:persistence_flutter/persistence/query/query_manager.dart';

abstract class Repository<T> {

  QueryManager<T> getQueryManager() {
    return new QueryManager<T>();
  }

  Stream<T> findAll();
  Future<List<T>> findAllList();
  Future<Optional<T>> findById(int id);

}