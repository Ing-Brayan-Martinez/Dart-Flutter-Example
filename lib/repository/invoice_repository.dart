import 'package:optional/optional.dart';
import 'package:prueba_flutter/domain/invoice.dart';

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
