import 'dart:convert';

import 'package:dart_flutter_example/domain/entity/customer.dart';
import 'package:dart_flutter_example/helper/provider/http.dart';
import 'package:dart_flutter_example/shared/provider/http.dart';
import 'package:dio/dio.dart';
import 'package:optional/optional.dart';

abstract class ICustomerRepository {
  void add(Customer entity);

  void update(Customer entity);

  void delete(List<Customer> entity);

  Future<List<Customer>> findAll();

  Future<Optional<Customer>> findById(int id);

  Future<List<Customer>> findByName(String name);

  Future<List<Customer>> findByCode(String code);
}

class CustomerMemoryRepository implements ICustomerRepository {
  List<Customer> _list = [
    new Customer.from(1, "0101", "Epa", "Valencia, Edo Carabobo",
        "prueba@gmail.com", "04142589632", "Y", DateTime.now(), DateTime.now()),
    new Customer.from(2, "0102", "Beco", "Valencia, Edo Carabobo",
        "prueba@gmail.com", "04142589632", "Y", DateTime.now(), DateTime.now()),
    new Customer.from(3, "0103", "Promotora Tántalo", "Valencia, Edo Carabobo",
        "prueba@gmail.com", "04142589632", "Y", DateTime.now(), DateTime.now()),
    new Customer.from(4, "0104", "Sillaca", "Valencia, Edo Carabobo",
        "prueba@gmail.com", "04142589632", "Y", DateTime.now(), DateTime.now()),
    new Customer.from(5, "0105", "Febeca", "Valencia, Edo Carabobo",
        "prueba@gmail.com", "04142589632", "Y", DateTime.now(), DateTime.now()),
    new Customer.from(6, "0106", "Beval", "Valencia, Edo Carabobo",
        "prueba@gmail.com", "04142589632", "Y", DateTime.now(), DateTime.now()),
  ];

  @override
  void add(Customer entity) async {
    _list.add(entity);
  }

  @override
  void update(Customer entity) {
    _list.removeWhere((el) => el.id == entity.id);
    _list.add(entity);
  }

  @override
  void delete(List<Customer> entitys) async {
    for (var item in entitys) {
      _list.removeWhere((el) => el.id == item.id);
    }
  }

  @override
  Future<List<Customer>> findAll() async {
    return _list;
  }

  @override
  Future<Optional<Customer>> findById(int id) async {
    var result = _list.where((el) => el.id == id).first;
    return Optional.ofNullable(result);
  }

  @override
  Future<List<Customer>> findByCode(String code) async {
    return _list.where((el) => el.code == code).toList();
  }

  @override
  Future<List<Customer>> findByName(String name) async {
    return _list.where((el) => el.name == name).toList();
  }
}

class CustomerHttpRepository extends Http implements ICustomerRepository {
  @override
  void add(Customer entity) async {
    await getHttpManager().post("/customers",
        data: entity.toJson(),
        options: new Options(contentType: "application/json"));
  }

  @override
  void update(Customer entity) async {
    await getHttpManager().put("/customers",
        data: entity.toJson(),
        options: new Options(contentType: "application/json"));
  }

  @override
  void delete(List<Customer> entitys) async {
    Map<String, dynamic> body = new Map();
    body['customers'] = entitys.map((cli) => cli.toJson()).toList();

    await getHttpManager().put("/customers/estatus",
        data: body, options: new Options(contentType: "application/json"));
  }

  @override
  Future<List<Customer>> findAll() async {
    final Response res = await getHttpManager().get("/customers");

    final List<Customer> list = jsonDecode(res.data)
        .map((result) => new Customer.fromJson(result))
        .toList();

    return list;
  }

  @override
  Future<Optional<Customer>> findById(int id) async {
    final Response res = await getHttpManager().get("/customers/${id}");

    final Customer single = jsonDecode(res.data)
        .map((result) => new Customer.fromJson(result))
        .single;

    return Optional.ofNullable(single);
  }

  @override
  Future<List<Customer>> findByName(String name) async {
    final Response res = await getHttpManager().get("/customers/name/${name}");

    final List<Customer> list = jsonDecode(res.data)
        .map((result) => new Customer.fromJson(result))
        .toList();

    return list;
  }

  @override
  Future<List<Customer>> findByCode(String code) async {
    final Response res = await getHttpManager().get("/customers/code/${code}");

    final List<Customer> list = jsonDecode(res.data)
        .map((result) => new Customer.fromJson(result))
        .toList();

    return list;
  }
}
