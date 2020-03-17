import 'package:optional/optional.dart';
import 'package:prueba_flutter/domain/customer.dart';
import 'package:prueba_flutter/repository/customer_repository.dart';
import 'package:prueba_flutter/repository/http/customer_repository_impl.dart';
import 'package:rxdart/rxdart.dart';

class CustomerBloc {

  final CustomerRepository _repository =  new CustomerRepositoryImpl();
  // ignore: close_sinks
  final BehaviorSubject<Customer> _subject = new BehaviorSubject<Customer>();
  final BehaviorSubject<List<Customer>> _subjectList = new BehaviorSubject<List<Customer>>();

  void add(Customer entity) async {
    _repository.add(entity);
  }

  void update(Customer entity) async {
    _repository.update(entity);
  }

  void delete(List<Customer> entitys) async {
    _repository.delete(entitys);
  }

  void getCustomerById(int id) async {
    final Optional<Customer> res = await _repository.findById(id);
    res.ifPresent((rest) { _subject.sink.add(rest); });
  }

  void getCustomers() async {
    final List<Customer> res = await _repository.findAll();
    _subjectList.sink.add(res);
  }

  void getCustomersByCode(String code) async {
    final List<Customer> res = await _repository.findByCode(code);
    _subjectList.sink.add(res);
  }

  void getCustomersByName(String name) async {
    final List<Customer> res = await _repository.findByName(name);
    _subjectList.sink.add(res);
  }

  void dispose() {
    _subject.close();
    _subjectList.close();
  }

  Stream<Customer> get customerStream => _subject.stream;

  Stream<List<Customer>> get customerListStream => _subjectList.stream;

}
