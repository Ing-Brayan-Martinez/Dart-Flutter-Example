import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:optional/optional.dart';
import 'package:prueba_flutter/domain/entity/customer.dart';
import 'package:prueba_flutter/domain/entity/invoice.dart';
import 'package:prueba_flutter/shared/provider/http.dart';

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

  List<Invoice> _list = [
    new Invoice.from(1, "0101", new Customer.min(1, "Epa"), 100.0, 50.0, 16, 150.0, "Y", DateTime.now(), DateTime.now()),
    new Invoice.from(2, "0102", new Customer.min(1, "Epa"), 100.0, 50.0, 16, 150.0, "Y", DateTime.now(), DateTime.now()),
    new Invoice.from(3, "0103", new Customer.min(2, "Beco"), 100.0, 50.0, 16, 150.0, "Y", DateTime.now(), DateTime.now()),
    new Invoice.from(4, "0104", new Customer.min(2, "Beco"), 100.0, 50.0, 16, 150.0, "Y", DateTime.now(), DateTime.now()),
    new Invoice.from(5, "0105", new Customer.min(3, "Promotora Tántalo"), 100.0, 50.0, 16, 150.0, "Y", DateTime.now(), DateTime.now()),
    new Invoice.from(6, "0106", new Customer.min(3, "Promotora Tántalo"), 100.0, 50.0, 16, 150.0, "Y", DateTime.now(), DateTime.now()),
    new Invoice.from(7, "0107", new Customer.min(4, "Sillaca"), 100.0, 50.0, 16, 150.0, "Y", DateTime.now(), DateTime.now()),
    new Invoice.from(8, "0108", new Customer.min(4, "Sillaca"), 100.0, 50.0, 16, 150.0, "Y", DateTime.now(), DateTime.now()),
    new Invoice.from(9, "0109", new Customer.min(5, "Febeca"), 100.0, 50.0, 16, 150.0, "Y", DateTime.now(), DateTime.now()),
    new Invoice.from(10, "0110", new Customer.min(5, "Febeca"), 100.0, 50.0, 16, 150.0, "Y", DateTime.now(), DateTime.now()),
    new Invoice.from(11, "0111", new Customer.min(6, "Beval"), 100.0, 50.0, 16, 150.0, "Y", DateTime.now(), DateTime.now()),
    new Invoice.from(12, "0112", new Customer.min(6, "Beval"), 100.0, 50.0, 16, 150.0, "Y", DateTime.now(), DateTime.now()),
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
    return _list.where((el) => el.customer.code == code).toList();
  }

  @override
  Future<List<Invoice>> findByCustomerName(String name) async {
    return _list.where((el) => el.customer.name == name).toList();
  }

}

class InvoiceHttpRepository extends Http implements InvoiceRepository {

  @override
  void add(Invoice entity) async {
    await getHttpManager()
        .post("/invoices", data: entity.toJson(), options:
    new Options(contentType: "application/json"));
  }

  @override
  void update(Invoice entity) async {
    await getHttpManager()
        .put("/invoices", data: entity.toJson(), options:
    new Options(contentType: "application/json"));
  }

  @override
  void delete(List<Invoice> entitys) async {
    Map<String, dynamic> body = new Map();
    body['invoices'] = entitys.map((cli) => cli.toJson()).toList();

    await getHttpManager()
        .put("/invoices/estatus", data: body, options:
    new Options(contentType: "application/json"));
  }

  @override
  Future<List<Invoice>> findAll() async {
    final Response res = await getHttpManager()
        .get("/invoices");

    final List<Invoice> list = jsonDecode(res.data)
        .map((result) => new Invoice.fromJson(result))
        .toList();

    return list;
  }

  @override
  Future<Optional<Invoice>> findById(int id) async {
    final Response res = await getHttpManager()
        .get("/invoices/${id}");

    final Invoice single = jsonDecode(res.data)
        .map((result) => new Invoice.fromJson(result))
        .single;

    return Optional.ofNullable(single);
  }

  Future<List<Invoice>> findByCode(String code) async {
    final Response res = await getHttpManager()
        .get("/invoices/code/${code}");

    final List<Invoice> list = jsonDecode(res.data)
        .map((result) => new Invoice.fromJson(result))
        .toList();

    return list;
  }

  Future<List<Invoice>> findByCustomerName(String name) async {
    final Response res = await getHttpManager()
        .get("/invoices/customers/name/${name}");

    final List<Invoice> list = jsonDecode(res.data)
        .map((result) => new Invoice.fromJson(result))
        .toList();

    return list;
  }

  Future<List<Invoice>> findByCustomerCode(String code) async {
    final Response res = await getHttpManager()
        .get("/invoices/customers/code/${code}");

    final List<Invoice> list = jsonDecode(res.data)
        .map((result) => new Invoice.fromJson(result))
        .toList();

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
