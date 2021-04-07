import 'package:dart_flutter_example/domain/entity/customer.dart';
import 'package:dart_flutter_example/repository/customer_repository.dart';
import 'package:optional/optional.dart';
import 'package:rxdart/rxdart.dart';

class CustomerBloc {
  final BehaviorSubject<Customer> _subject = new BehaviorSubject<Customer>();
  final BehaviorSubject<List<Customer>> _subjectList =
      new BehaviorSubject<List<Customer>>();

  CustomerMemoryRepository _repository;

  CustomerBloc() {}

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
    res.ifPresent((rest) {
      _subject.sink.add(rest);
    });
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
