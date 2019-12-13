import 'dart:async';

import 'package:optional/optional.dart';
import 'package:persistence_flutter/persistence_flutter.dart';
import 'package:prueba_flutter/dashboard/model/filter_customer_model.dart';
import 'package:prueba_flutter/legacy/domain//customer.dart';

class CustomerRepository extends Repository<Customer> {

  @override
  Stream<Customer> findAll() {
    return getQueryManager()
        .createQueryBuilder(new Customer())
        .create()
        .getResultStream((row) => new Customer.fromJson(row));
  }

  @override
  Future<List<Customer>> findAllList() {
     return getQueryManager()
         .createQueryBuilder(new Customer())
         .create()
         .getResultList((row) => new Customer.fromJson(row));
  }

  @override
  Future<Optional<Customer>> findById(int id) {
    return getQueryManager()
          .createQueryBuilder(new Customer())
          .addEqualsFilter(id, Customer.COLUMN_CUSTOMER_ID, FilterConst.NONE)
          .create()
          .getSingleResult((row) => new Customer.fromJson(row));
  }

  Future<List<Customer>> findCustomer(FilterCustomerModel model) {
    return getQueryManager()
        .createQueryBuilder(new Customer())
        .addLikeFilter(model.code, Customer.COLUMN_CODE, FilterConst.OR)
        .addLikeFilter(model.name, Customer.COLUMN_NAME, FilterConst.NONE)
        .create()
        .getResultList((row) => new Customer.fromJson(row));
  }
}