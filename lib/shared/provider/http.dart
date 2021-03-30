
import 'package:dio/dio.dart';

abstract class Http {

  Dio getHttpManager() {
    final BaseOptions options = new BaseOptions(
      baseUrl: "http://10.1.209.88:5001/api/v1",
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );

    return new Dio(options);
  }

}
