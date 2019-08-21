import 'dart:async';

import 'package:optional/optional.dart';
import 'package:persistence_flutter/persistence_flutter.dart';

import 'package:prueba_flutter/domain/home.dart';


class HomeRepository extends Repository<Home> {

  @override
  Stream<Home> findAll() {
    return getQueryManager()
        .createQueryBuilder(new Home())
        .create()
        .getResultStream((row) => new Home.fromJson(row));
  }

  @override
  Future<List<Home>> findAllList() {
    return getQueryManager()
        .createQueryBuilder(new Home())
        .create()
        .getResultList((row) => new Home.fromJson(row));
  }

  @override
  Future<Optional<Home>> findById(int id) {
    return getQueryManager()
        .createQueryBuilder(new Home())
        .addEqualsFilter(id, Home.COLUMN_HOME_ID, FilterConst.NONE)
        .create()
        .getSingleResult((row) => new Home.fromJson(row));
  }

}

