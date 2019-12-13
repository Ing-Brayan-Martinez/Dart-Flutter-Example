import 'package:prueba_flutter/customer/model/customer.dart';
import 'package:prueba_flutter/customer/repository/customer_repository.dart';
import 'package:rxdart/rxdart.dart';

class CustomerBloc {

  final CustomerRepository _repository =  new CustomerRepository();
  final BehaviorSubject<List<Customer>> _subject = new BehaviorSubject<List<Customer>>();

  void getCustomers() async {
    final List<Customer> res = await _repository.findAllList();
    _subject.sink.add(res);
  }

  void dispose() {
    _subject.close();
  }

  Stream<List<Customer>> get customerStream => _subject.stream;

}