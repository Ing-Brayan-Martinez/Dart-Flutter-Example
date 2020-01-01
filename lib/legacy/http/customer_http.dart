import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:optional/optional_internal.dart';
import 'package:prueba_flutter/legacy/domain/customer.dart';
import 'package:prueba_flutter/legacy/http/model/wrapper_customer_model.dart';
import 'package:prueba_flutter/legacy/http/serializer/customer_json_serializer.dart';
import 'package:prueba_flutter/shared/provider/http.dart';

class CustomerHttp extends Http<Customer> {

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

    final repo = new JsonRepo();
    repo.add(new CustomerWrapperJsonSerializer());

    final CustomerWrapper data = repo.from<CustomerWrapper>(res.data);

    final List<Customer> list = data.customers
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

    final repo = new JsonRepo();
    repo.add(new CustomerWrapperJsonSerializer());

    final CustomerWrapper data = repo.from<CustomerWrapper>(res.data);

    final List<Customer> list = data.customers
        .map((result) => new Customer.fromJson(result))
        .toList();

    return list;
  }

  @override
  Future<Optional<Customer>> findById(int id) async {
    final Response res = await getHttpManager()
        .get("/clientes/${id}");

    final repo = new JsonRepo(serializers: [CustomerWrapperJsonSerializer()]);

    final CustomerWrapper data = repo.from<CustomerWrapper>(res.data);

    final Customer single = data.customers
        .map((result) => new Customer.fromJson(result))
        .single;

    return Optional.ofNullable(single);
  }

  Future<List<Customer>> findByName(String name) async {
    final Response res = await getHttpManager()
        .get("/clientes/nombre/${name}");

    final repo = new JsonRepo();
    repo.add(new CustomerWrapperJsonSerializer());

    final CustomerWrapper data = repo.from<CustomerWrapper>(res.data);

    final List<Customer> list = data.customers
        .map((result) => new Customer.fromJson(result))
        .toList();

    return list;
  }

  Future<List<Customer>> findByCode(String code) async {
    final Response res = await getHttpManager()
        .get("/clientes/codigo/${code}");

    final repo = new JsonRepo();
    repo.add(new CustomerWrapperJsonSerializer());

    final CustomerWrapper data = repo.from<CustomerWrapper>(res.data);

    final List<Customer> list = data.customers
        .map((result) => new Customer.fromJson(result))
        .toList();

    return list;
  }

}