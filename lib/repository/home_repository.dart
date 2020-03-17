import 'package:optional/optional_internal.dart';
import 'package:prueba_flutter/domain/home.dart';

abstract class HomeRepository  {

  void add(Home entity);

  void update(Home entity);

  void delete(List<Home> entitys);

  Future<List<Home>> findAll();

  Future<Optional<Home>> findById(int id);

}
