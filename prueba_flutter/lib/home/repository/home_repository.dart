
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:prueba_flutter/home/model/home.dart';
import 'package:prueba_flutter/shared/provider/ApiProvider.dart';

class HomeRepository {

  Future<List<Home>> getHomes() async {
    final Response res = await ApiProvider.getHttpManager()
        .get("/homes");

    final List<Home> list = jsonDecode(res.data)
        .map((result) => new Home.fromJson(result))
        .toList();

    return list;
  }
}