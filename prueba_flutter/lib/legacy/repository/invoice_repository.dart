import 'dart:async';

import 'package:optional/optional.dart';
import 'package:persistence_flutter/persistence_flutter.dart';
import 'package:prueba_flutter/legacy/domain/invoice.dart';

class InvoiceRepository extends Repository<Invoice> {

  @override
  Stream<Invoice> findAll() {
    return getQueryManager()
        .createQueryBuilder(new Invoice())
        .create()
        .getResultStream((row) => new Invoice.fromJson(row));
  }

  @override
  Future<List<Invoice>> findAllList() {
    return getQueryManager()
        .createQueryBuilder(new Invoice())
        .create()
        .getResultList((row) => new Invoice.fromJson(row));
  }

  @override
  Future<Optional<Invoice>> findById(int id) {
    return getQueryManager()
        .createQueryBuilder(new Invoice())
        .addEqualsFilter(id, Invoice.COLUMN_INVOICE_ID, FilterConst.NONE)
        .create()
        .getSingleResult((row) => new Invoice.fromJson(row));
  }

}