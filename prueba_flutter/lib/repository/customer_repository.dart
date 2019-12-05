
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:prueba_flutter/domain/customer.dart';
import 'package:prueba_flutter/provider/ApiProvider.dart';

class CustomerRepository {

  Future<List<Customer>> getCustomers() async {
    final Response res = await ApiProvider.getHttpManager()
        .get("/clientes");

    final List<Customer> list = jsonDecode(res.data)
        .map((result) => new Customer.fromJson(result))
        .toList();

    return list;
  }

}