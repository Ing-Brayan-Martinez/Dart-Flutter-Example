import 'dart:convert';

import 'package:dart_flutter_example/domain/entity/customer.dart';
import 'package:dart_flutter_example/domain/entity/invoice.dart';
import 'package:dart_flutter_example/helper/provider/http.dart';
import 'package:dio/dio.dart';
import 'package:optional/optional.dart';

abstract class InvoiceRepository {
  void add(Invoice entity);

  void update(Invoice entity);

  void delete(List<Invoice> entitys);

  Future<List<Invoice>> findAll();

  Future<Optional<Invoice>> findById(int id);

  Future<List<Invoice>> findByCode(String code);

  Future<List<Invoice>> findByCustomerName(String name);

  Future<List<Invoice>> findByCustomerCode(String code);

  //Future<List<Invoice>> findByFilter(FilterInvoice filter);
}

class InvoiceMemoryRepository implements InvoiceRepository {
  final List<Invoice> _list = [
    Invoice.from(1, "0101", Customer.min(1, "Epa"), 100.0, 50.0, 16, 150.0, "Y",
        DateTime.now(), DateTime.now()),
    Invoice.from(2, "0102", Customer.min(1, "Epa"), 100.0, 50.0, 16, 150.0, "Y",
        DateTime.now(), DateTime.now()),
    Invoice.from(3, "0103", Customer.min(2, "Beco"), 100.0, 50.0, 16, 150.0,
        "Y", DateTime.now(), DateTime.now()),
    Invoice.from(4, "0104", Customer.min(2, "Beco"), 100.0, 50.0, 16, 150.0,
        "Y", DateTime.now(), DateTime.now()),
    Invoice.from(5, "0105", Customer.min(3, "Promotora Tántalo"), 100.0, 50.0,
        16, 150.0, "Y", DateTime.now(), DateTime.now()),
    Invoice.from(6, "0106", Customer.min(3, "Promotora Tántalo"), 100.0, 50.0,
        16, 150.0, "Y", DateTime.now(), DateTime.now()),
    Invoice.from(7, "0107", Customer.min(4, "Sillaca"), 100.0, 50.0, 16, 150.0,
        "Y", DateTime.now(), DateTime.now()),
    Invoice.from(8, "0108", Customer.min(4, "Sillaca"), 100.0, 50.0, 16, 150.0,
        "Y", DateTime.now(), DateTime.now()),
    Invoice.from(9, "0109", Customer.min(5, "Febeca"), 100.0, 50.0, 16, 150.0,
        "Y", DateTime.now(), DateTime.now()),
    Invoice.from(10, "0110", Customer.min(5, "Febeca"), 100.0, 50.0, 16, 150.0,
        "Y", DateTime.now(), DateTime.now()),
    Invoice.from(11, "0111", Customer.min(6, "Beval"), 100.0, 50.0, 16, 150.0,
        "Y", DateTime.now(), DateTime.now()),
    Invoice.from(12, "0112", Customer.min(6, "Beval"), 100.0, 50.0, 16, 150.0,
        "Y", DateTime.now(), DateTime.now()),
  ];

  @override
  void add(Invoice entity) async {
    _list.add(entity);
  }

  @override
  void update(Invoice entity) async {
    _list.removeWhere((el) => el.id == entity.id);
    _list.add(entity);
  }

  @override
  void delete(List<Invoice> entitys) async {
    for (var item in entitys) {
      _list.removeWhere((el) => el.id == item.id);
    }
  }

  @override
  Future<List<Invoice>> findAll() async {
    return _list;
  }

  @override
  Future<Optional<Invoice>> findById(int id) async {
    var result = _list.where((el) => el.id == id).first;
    return Optional.ofNullable(result);
  }

  @override
  Future<List<Invoice>> findByCode(String code) async {
    return _list.where((el) => el.code == code).toList();
  }

  @override
  Future<List<Invoice>> findByCustomerCode(String code) async {
    return _list.where((el) => el.customer?.code == code).toList();
  }

  @override
  Future<List<Invoice>> findByCustomerName(String name) async {
    return _list.where((el) => el.customer?.name == name).toList();
  }
}

class InvoiceHttpRepository extends Http implements InvoiceRepository {
  @override
  void add(Invoice entity) async {
    await getHttpManager().post("/invoices",
        data: entity.toJson(),
        options: Options(contentType: "application/json"));
  }

  @override
  void update(Invoice entity) async {
    await getHttpManager().put("/invoices",
        data: entity.toJson(),
        options: Options(contentType: "application/json"));
  }

  @override
  void delete(List<Invoice> entitys) async {
    Map<String, dynamic> body = {};
    body['invoices'] = entitys.map((cli) => cli.toJson()).toList();

    await getHttpManager().put("/invoices/estatus",
        data: body, options: Options(contentType: "application/json"));
  }

  @override
  Future<List<Invoice>> findAll() async {
    final Response res = await getHttpManager().get("/invoices");

    final List<Invoice> list =
        jsonDecode(res.data).map((result) => Invoice.fromJson(result)).toList();

    return list;
  }

  @override
  Future<Optional<Invoice>> findById(int id) async {
    final Response res = await getHttpManager().get("/invoices/$id");

    final Invoice single =
        jsonDecode(res.data).map((result) => Invoice.fromJson(result)).single;

    return Optional.ofNullable(single);
  }

  @override
  Future<List<Invoice>> findByCode(String code) async {
    final Response res = await getHttpManager().get("/invoices/code/$code");

    final List<Invoice> list =
        jsonDecode(res.data).map((result) => Invoice.fromJson(result)).toList();

    return list;
  }

  @override
  Future<List<Invoice>> findByCustomerName(String name) async {
    final Response res =
        await getHttpManager().get("/invoices/customers/name/$name");

    final List<Invoice> list =
        jsonDecode(res.data).map((result) => Invoice.fromJson(result)).toList();

    return list;
  }

  @override
  Future<List<Invoice>> findByCustomerCode(String code) async {
    final Response res =
        await getHttpManager().get("/invoices/customers/code/$code");

    final List<Invoice> list =
        jsonDecode(res.data).map((result) => Invoice.fromJson(result)).toList();

    return list;
  }

//  Future<List<Invoice>> findByFilter(FilterInvoice filter) async {
//    final Response res = await getHttpManager()
//        .get("""/facturas/filtros
//        ?nombreCliente=${filter.nameCustomer}
//        &codigoCliente=${filter.codeCustomer}
//        &codigoFactura=${filter.codeInvoice}
//        &fechaDesde=${filter.dateFrom}
//        &fechaHasta=${filter.dateTo}
//        """);
//
//    final List<Invoice> list = jsonDecode(res.data)
//        .map((result) => new Invoice.fromJson(result))
//        .toList();
//
//    return list;
//  }
}
