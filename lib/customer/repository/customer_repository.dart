import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:optional/optional.dart';
import 'package:prueba_flutter/customer/model/customer.dart';
import 'package:prueba_flutter/shared/provider/http.dart';

class CustomerRepository extends Http<Customer> {

  @override
  void add(Customer entity) async {
    await getHttpManager()
        .post("/customers", data: entity.toJson(), options:
    new Options(contentType: ContentType.parse("application/json")));
  }

  @override
  void update(Customer entity) async {
    await getHttpManager()
        .put("/customers", data: entity.toJson(), options:
    new Options(contentType: ContentType.parse("application/json")));
  }

  @override
  void delete(List<Customer> entitys) async {
    Map<String, dynamic> body = new Map();
    body['customers'] = entitys.map((cli) => cli.toJson()).toList();

    await getHttpManager()
        .put("/customers/estatus", data: body, options:
    new Options(contentType: ContentType.parse("application/json")));
  }

  @override
  Stream<Customer> findAll() async* {
    final Response res = await getHttpManager()
        .get("/customers");

    final List<Customer> list = jsonDecode(res.data)
        .map((result) => new Customer.fromJson(result))
        .toList();

    for (Customer value in list) {
      yield value;
    }
  }

  @override
  Future<List<Customer>> findAllList() async {
    final Response res = await getHttpManager()
        .get("/customers");

    final List<Customer> list = jsonDecode(res.data)
        .map((result) => new Customer.fromJson(result))
        .toList();

    return list;
  }

  @override
  Future<Optional<Customer>> findById(int id) async {
    final Response res = await getHttpManager()
        .get("/customers/${id}");


    final Customer single = jsonDecode(res.data)
        .map((result) => new Customer.fromJson(result))
        .single;

    return Optional.ofNullable(single);
  }

  Future<List<Customer>> findByName(String name) async {
    final Response res = await getHttpManager()
        .get("/customers/name/${name}");

    final List<Customer> list = jsonDecode(res.data)
        .map((result) => new Customer.fromJson(result))
        .toList();

    return list;
  }

  Future<List<Customer>> findByCode(String code) async {
    final Response res = await getHttpManager()
        .get("/customers/code/${code}");

    final List<Customer> list = jsonDecode(res.data)
        .map((result) => new Customer.fromJson(result))
        .toList();

    return list;
  }

}