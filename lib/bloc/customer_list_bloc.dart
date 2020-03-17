import 'package:prueba_flutter/domain/customer.dart';
import 'package:prueba_flutter/repository/customer_repository.dart';
import 'package:rxdart/rxdart.dart';

class CustomerListBloc {

  final CustomerRepository _repository =  new CustomerRepository();
  final BehaviorSubject<List<Customer>> _subject = new BehaviorSubject<List<Customer>>();

  void getCustomers() async {
    final List<Customer> res = await _repository.findAllList();
    _subject.sink.add(res);
  }

  void getCustomersByCode(String code) async {
    final List<Customer> res = await _repository.findByCode(code);
    _subject.sink.add(res);
  }

  void getCustomersByName(String name) async {
    final List<Customer> res = await _repository.findByName(name);
    _subject.sink.add(res);
  }
  
  void dispose() {
    _subject.close();
  }

  Stream<List<Customer>> get customerStream => _subject.stream;

}
