import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:optional/optional.dart';
import 'package:prueba_flutter/invoice/model/invoice.dart';
import 'package:prueba_flutter/shared/provider/http.dart';

class InvoiceRepository extends Http<Invoice> {

  @override
  void add(Invoice entity) async {
    await getHttpManager()
        .post("/invoices", data: entity.toJson(), options:
    new Options(contentType: ContentType.parse("application/json")));
  }

  @override
  void update(Invoice entity) async {
    await getHttpManager()
        .put("/invoices", data: entity.toJson(), options:
    new Options(contentType: ContentType.parse("application/json")));
  }

  @override
  void delete(List<Invoice> entitys) async {
    Map<String, dynamic> body = new Map();
    body['invoices'] = entitys.map((cli) => cli.toJson()).toList();

    await getHttpManager()
        .put("/invoices/estatus", data: body, options:
    new Options(contentType: ContentType.parse("application/json")));
  }

  @override
  Stream<Invoice> findAll() async* {
    final Response res = await getHttpManager()
        .get("/invoices");

    final List<Invoice> list = jsonDecode(res.data)
        .map((result) => new Invoice.fromJson(result))
        .toList();

    for (Invoice value in list) {
      yield value;
    }
  }

  @override
  Future<List<Invoice>> findAllList() async {
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