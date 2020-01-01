import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:optional/optional_internal.dart';
import 'package:prueba_flutter/home/model/home.dart';
import 'package:prueba_flutter/shared/provider/http.dart';

class HomeRepository extends Http<Home> {

  @override
  void add(Home entity) async {
    await getHttpManager()
        .post("/homes", data: entity.toJson(), options:
    new Options(contentType: ContentType.parse("application/json")));
  }

  @override
  void update(Home entity) async {
    await getHttpManager()
        .put("/homes", data: entity.toJson(), options:
    new Options(contentType: ContentType.parse("application/json")));
  }

  @override
  void delete(List<Home> entitys) async {
    Map<String, dynamic> body = new Map();
    body['homes'] = entitys.map((cli) => cli.toJson()).toList();

    await getHttpManager()
        .put("/homes/estatus", data: body, options:
    new Options(contentType: ContentType.parse("application/json")));
  }

  @override
  Stream<Home> findAll() async* {
    final Response res = await getHttpManager()
        .get("/homes");

    final List<Home> list = jsonDecode(res.data)
        .map((result) => new Home.fromJson(result))
        .toList();

    for (Home value in list) {
      yield value;
    }
  }

  @override
  Future<List<Home>> findAllList() async {
    final Response res = await getHttpManager()
        .get("/homes");

    final List<Home> list = jsonDecode(res.data)
        .map((result) => new Home.fromJson(result))
        .toList();

    return list;
  }

  @override
  Future<Optional<Home>> findById(int id) async {
    final Response res = await getHttpManager()
        .get("/homes/${id}");

    final Home single = jsonDecode(res.data)
        .map((result) => new Home.fromJson(result))
        .single;

    return Optional.ofNullable(single);
  }


}