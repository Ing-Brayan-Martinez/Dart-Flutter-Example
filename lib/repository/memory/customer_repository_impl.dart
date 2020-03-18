import 'package:optional/optional.dart';
import 'package:prueba_flutter/domain/customer.dart';
import 'package:prueba_flutter/repository/customer_repository.dart';

class CustomerRepositoryImpl implements CustomerRepository {

  List<Customer> _list = [
    new Customer.from(1,"0101","Epa","Valencia, Edo Carabobo","prueba@gmail.com","04142589632","Y", DateTime.now(), DateTime.now()),
    new Customer.from(2,"0102","Beco","Valencia, Edo Carabobo","prueba@gmail.com","04142589632","Y", DateTime.now(), DateTime.now()),
    new Customer.from(3,"0103","Promotora Tántalo","Valencia, Edo Carabobo","prueba@gmail.com","04142589632","Y", DateTime.now(), DateTime.now()),
    new Customer.from(4,"0104","Sillaca","Valencia, Edo Carabobo","prueba@gmail.com","04142589632","Y", DateTime.now(), DateTime.now()),
    new Customer.from(5,"0105","Febeca","Valencia, Edo Carabobo","prueba@gmail.com","04142589632","Y", DateTime.now(), DateTime.now()),
    new Customer.from(6,"0106","Beval","Valencia, Edo Carabobo","prueba@gmail.com","04142589632","Y", DateTime.now(), DateTime.now()),
  ];

  @override
  void add(Customer entity) async {
    _list.add(entity);
  }

  @override
  void update(Customer entity) {
    _list.removeWhere((el) => el.id == entity.id);
    _list.add(entity);
  }

  @override
  void delete(List<Customer> entitys) async {
    for (var item in entitys) {
      _list.removeWhere((el) => el.id == item.id);
    }
  }

  @override
  Future<List<Customer>> findAll() async {
    return _list;
  }

  @override
  Future<Optional<Customer>> findById(int id) async {
    var result = _list.where((el) => el.id == id).first;
    return Optional.ofNullable(result);
  }

  @override
  Future<List<Customer>> findByCode(String code) async {
    return _list.where((el) => el.code == code).toList();
  }

  @override
  Future<List<Customer>> findByName(String name) async {
    return _list.where((el) => el.name == name).toList();
  }

}
