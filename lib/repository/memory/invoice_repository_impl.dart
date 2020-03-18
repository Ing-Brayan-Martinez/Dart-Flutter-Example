import 'package:optional/optional.dart';
import 'package:prueba_flutter/domain/customer.dart';
import 'package:prueba_flutter/domain/invoice.dart';
import 'package:prueba_flutter/repository/invoice_repository.dart';

class InvoiceRepositoryImpl implements InvoiceRepository {

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
