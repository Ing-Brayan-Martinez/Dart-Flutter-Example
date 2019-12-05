
import 'package:dio/dio.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:optional/optional_internal.dart';
import 'package:prueba_flutter/legacy/domain/invoice.dart';
import 'package:prueba_flutter/legacy/http/model/wrapper_invoice_model.dart';
import 'package:prueba_flutter/legacy/http/serializer/invoice_json_serializer.dart';
import 'package:prueba_flutter/legacy/http/util/filter.dart';
import 'package:prueba_flutter/legacy/http/util/http.dart';

class InvoiceHttp extends Http<Invoice> {

  @override
  void add(Invoice customer) {

  }

  @override
  void update(Invoice customer) {

  }

  @override
  void delete(List<Invoice> ids) {
    // TODO: implement delete
  }

  @override
  Stream<Invoice> findAll() async* {
    final Response res = await getHttpManager()
        .get("/facturas");

    final repo = new JsonRepo();
    repo.add(new InvoiceWrapperJsonSerializer());

    final InvoiceWrapper data = repo.from<InvoiceWrapper>(res.data);

    final List<Invoice> list = data.invoices
        .map((result) => new Invoice.fromJson(result))
        .toList();

    for (Invoice value in list) {
      yield value;
    }
  }

  @override
  Future<List<Invoice>> findAllList() async {
    final Response res = await getHttpManager()
        .get("/facturas");

    final repo = new JsonRepo();
    repo.add(new InvoiceWrapperJsonSerializer());

    final InvoiceWrapper data = repo.from<InvoiceWrapper>(res.data);

    final List<Invoice> list = data.invoices
        .map((result) => new Invoice.fromJson(result))
        .toList();

    return list;
  }

  @override
  Future<Optional<Invoice>> findById(int id) async {
    final Response res = await getHttpManager()
        .get("/facturas/${id}");

    final repo = new JsonRepo();
    repo.add(new InvoiceWrapperJsonSerializer());

    final InvoiceWrapper data = repo.from<InvoiceWrapper>(res.data);

    final Invoice single = data.invoices
        .map((result) => new Invoice.fromJson(result))
        .single;

    return Optional.ofNullable(single);
  }

  Future<List<Invoice>> findByCode(String code) async {
    final Response res = await getHttpManager()
        .get("/facturas/codigo/${code}");

    final repo = new JsonRepo();
    repo.add(new InvoiceWrapperJsonSerializer());

    final InvoiceWrapper data = repo.from<InvoiceWrapper>(res.data);

    final List<Invoice> list = data.invoices
        .map((result) => new Invoice.fromJson(result))
        .toList();

    return list;
  }

  Future<List<Invoice>> findByCustomerName(String name) async {
    final Response res = await getHttpManager()
        .get("/facturas/clientes/nombre/${name}");

    final repo = new JsonRepo();
    repo.add(new InvoiceWrapperJsonSerializer());

    final InvoiceWrapper data = repo.from<InvoiceWrapper>(res.data);

    final List<Invoice> list = data.invoices
        .map((result) => new Invoice.fromJson(result))
        .toList();

    return list;
  }

  Future<List<Invoice>> findByCustomerCode(String code) async {
    final Response res = await getHttpManager()
        .get("/facturas/clientes/codigo/${code}");

    final repo = new JsonRepo();
    repo.add(new InvoiceWrapperJsonSerializer());

    final InvoiceWrapper data = repo.from<InvoiceWrapper>(res.data);

    final List<Invoice> list = data.invoices
        .map((result) => new Invoice.fromJson(result))
        .toList();

    return list;
  }

  Future<List<Invoice>> findByFilter(FilterInvoice filter) async {
    final Response res = await getHttpManager()
        .get("""/facturas/filtros
        ?nombreCliente=${filter.nameCustomer}
        &codigoCliente=${filter.codeCustomer}
        &codigoFactura=${filter.codeInvoice}
        &fechaDesde=${filter.dateFrom}
        &fechaHasta=${filter.dateTo}""");

    final repo = new JsonRepo();
    repo.add(new InvoiceWrapperJsonSerializer());

    final InvoiceWrapper data = repo.from<InvoiceWrapper>(res.data);

    final List<Invoice> list = data.invoices
        .map((result) => new Invoice.fromJson(result))
        .toList();

    return list;
  }

}