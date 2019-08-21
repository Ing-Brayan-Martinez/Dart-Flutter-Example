import 'dart:async';

import 'package:optional/optional.dart';
import 'package:persistence_flutter/persistence_flutter.dart';

import 'package:prueba_flutter/domain/invoice_item.dart';

class ItemsRepository extends Repository<InvoiceItem> {

  @override
  Stream<InvoiceItem> findAll() {
    return getQueryManager()
        .createQueryBuilder(new InvoiceItem())
        .create()
        .getResultStream((row) => new InvoiceItem.fromJson(row));
  }

  @override
  Future<List<InvoiceItem>> findAllList() {
    return getQueryManager()
        .createQueryBuilder(new InvoiceItem())
        .create()
        .getResultList((row) => new InvoiceItem.fromJson(row));
  }

  @override
  Future<Optional<InvoiceItem>> findById(int id) {
    return getQueryManager()
        .createQueryBuilder(new InvoiceItem())
        .addEqualsFilter(id, InvoiceItem.COLUMN_INVOICE_ITEM_ID, FilterConst.NONE)
        .create()
        .getSingleResult((row) => new InvoiceItem.fromJson(row));
  }

}