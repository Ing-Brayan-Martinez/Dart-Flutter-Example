import 'package:optional/optional.dart';
import 'package:prueba_flutter/domain/customer.dart';
import 'package:prueba_flutter/repository/customer_repository.dart';

class CustomerRepositoryImpl implements CustomerRepository {

  @override
  void add(Customer entity) async {
    // TODO: implement add
  }

  @override
  void update(Customer entity) {
    // TODO: implement update
  }

  @override
  void delete(List<Customer> entitys) async {
    // TODO: implement delete
  }

  @override
  Future<List<Customer>> findAll() async {
    // TODO: implement findAll
    return null;
  }

  @override
  Future<List<Customer>> findByCode(String code) async {
    // TODO: implement findByCode
    return null;
  }

  @override
  Future<Optional<Customer>> findById(int id) async {
    // TODO: implement findById
    return null;
  }

  @override
  Future<List<Customer>> findByName(String name) async {
    // TODO: implement findByName
    return null;
  }

  CustomerRepositoryImpl();
}
