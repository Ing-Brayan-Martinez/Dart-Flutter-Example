import 'package:dio/dio.dart';

class ApiProvider {

  static Dio getHttpManager() {
    final BaseOptions options = new BaseOptions(
      baseUrl: "http://localhost:8080/api/v1",
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );

    return new Dio(options);
  }
}