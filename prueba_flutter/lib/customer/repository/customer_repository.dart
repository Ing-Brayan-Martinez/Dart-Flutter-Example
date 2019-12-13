
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:optional/optional.dart';
import 'package:prueba_flutter/customer/model/customer.dart';
import 'package:prueba_flutter/shared/provider/http.dart';

class CustomerRepository extends Http<Customer> {

  @override
  void add(Customer customer) async {
    await getHttpManager()
        .post("/clientes", data: customer.toJson(), options:
    new Options(contentType: ContentType.parse("application/json")));
  }

  @override
  void update(Customer customer) async {
    await getHttpManager()
        .put("/clientes", data: customer.toJson(), options:
    new Options(contentType: ContentType.parse("application/json")));
  }

  @override
  void delete(List<Customer> customers) async {
    Map<String, dynamic> body = new Map();
    body['clientes'] = customers.map((cli) => cli.toJson()).toList();

    await getHttpManager()
        .put("/clientes/estatus", data: body, options:
    new Options(contentType: ContentType.parse("application/json")));
  }

  @override
  Stream<Customer> findAll() async* {
    final Response res = await getHttpManager()
        .get("/clientes");

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
        .get("/clientes");

    final List<Customer> list = jsonDecode(res.data)
        .map((result) => new Customer.fromJson(result))
        .toList();

    return list;
  }

  @override
  Future<Optional<Customer>> findById(int id) async {
    final Response res = await getHttpManager()
        .get("/clientes/${id}");


    final Customer single = jsonDecode(res.data)
        .map((result) => new Customer.fromJson(result))
        .single;

    return Optional.ofNullable(single);
  }

  Future<List<Customer>> findByName(String name) async {
    final Response res = await getHttpManager()
        .get("/clientes/nombre/${name}");

    final List<Customer> list = jsonDecode(res.data)
        .map((result) => new Customer.fromJson(result))
        .toList();

    return list;
  }

  Future<List<Customer>> findByCode(String code) async {
    final Response res = await getHttpManager()
        .get("/clientes/codigo/${code}");

    final List<Customer> list = jsonDecode(res.data)
        .map((result) => new Customer.fromJson(result))
        .toList();

    return list;
  }

}