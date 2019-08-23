
import 'package:dio/dio.dart';
import 'package:optional/optional.dart';

abstract class Http<T> {

  Dio getHttpManager() {
    final BaseOptions options = new BaseOptions(
      baseUrl: "http://10.1.209.88:5001/api",
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );

    return new Dio(options);
  }

  Stream<T> findAll();
  Future<List<T>> findAllList();
  Future<Optional<T>> findById(int id);

}