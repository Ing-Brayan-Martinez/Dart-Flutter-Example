
import 'package:dio/dio.dart';
import 'package:optional/optional.dart';

abstract class Http<T> {

  Dio getHttpManager() {
    final BaseOptions options = new BaseOptions(
      baseUrl: "http://10.1.209.88:5001/api/v1",
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );

    return new Dio(options);
  }

  void add(T entity);
  void update(T entity);
  void delete(List<T> entitys);
  Future<List<T>> findAll();
  Future<Optional<T>> findById(int id);

}
