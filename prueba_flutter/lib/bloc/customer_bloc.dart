import 'package:prueba_flutter/domain/customer.dart';
import 'package:prueba_flutter/repository/customer_repository.dart';
import 'package:rxdart/rxdart.dart';

class CustomerBloc {

  final CustomerRepository _repository =  new CustomerRepository();
  final BehaviorSubject<Customer> _subject = new BehaviorSubject<Customer>();

  void getCustomers() async {
    List<Customer> res = await _repository.getCustomers();
    res.forEach((co) =>  _subject.sink.add(co));
  }

  void dispose() {
    _subject.close();
  }

  Stream<Customer> get customerStream => _subject.stream;

}