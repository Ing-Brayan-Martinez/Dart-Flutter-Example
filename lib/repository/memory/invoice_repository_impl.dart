import 'package:optional/optional.dart';
import 'package:prueba_flutter/domain/invoice.dart';
import 'package:prueba_flutter/repository/invoice_repository.dart';

class InvoiceRepositoryImpl implements InvoiceRepository {

  @override
  void add(Invoice entity) {
    // TODO: implement add
  }

  @override
  void update(Invoice entity) {
    // TODO: implement update
  }

  @override
  void delete(List<Invoice> entitys) {
    // TODO: implement delete
  }

  @override
  Future<List<Invoice>> findAll() {
    // TODO: implement findAll
    return null;
  }

  @override
  Future<Optional<Invoice>> findById(int id) {
    // TODO: implement findById
    return null;
  }

  @override
  Future<List<Invoice>> findByCode(String code) {
    // TODO: implement findByCode
    return null;
  }

  @override
  Future<List<Invoice>> findByCustomerCode(String code) {
    // TODO: implement findByCustomerCode
    return null;
  }

  @override
  Future<List<Invoice>> findByCustomerName(String name) {
    // TODO: implement findByCustomerName
    return null;
  }

}
