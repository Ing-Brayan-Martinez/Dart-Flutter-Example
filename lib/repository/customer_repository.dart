import 'package:optional/optional.dart';
import 'package:prueba_flutter/domain/customer.dart';

abstract class CustomerRepository {

  void add(Customer entity);

  void update(Customer entity);

  void delete(List<Customer> entitys);

  Future<List<Customer>> findAll();

  Future<Optional<Customer>> findById(int id);

  Future<List<Customer>> findByName(String name);

  Future<List<Customer>> findByCode(String code);

}
