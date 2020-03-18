import 'package:optional/optional_internal.dart';
import 'package:prueba_flutter/domain/home.dart';
import 'package:prueba_flutter/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {

  List<Home> _list = [
    new Home.from(1,"bike","Flutter.dev","assets/image1.jpg","Y", DateTime.now(), DateTime.now()),
    new Home.from(2,"boat","Flutter.dev","assets/image2.jpg","Y", DateTime.now(), DateTime.now()),
    new Home.from(3,"bike","Yahoo.com","assets/image3.jpg","Y", DateTime.now(), DateTime.now()),
    new Home.from(4,"car","Google.com","assets/image4.jpg","Y", DateTime.now(), DateTime.now()),
    new Home.from(5,"run","Github.com","assets/image5.jpg","Y", DateTime.now(), DateTime.now()),
    new Home.from(6,"railway","Github.com","assets/image6.jpg","Y", DateTime.now(), DateTime.now()),
  ];

  @override
  void add(Home entity) async{
    _list.add(entity);
  }

  @override
  void update(Home entity) async {
    _list.removeWhere((el) => el.id == entity.id);
    _list.add(entity);
  }

  @override
  void delete(List<Home> entitys) async {
    for (var item in entitys) {
      _list.removeWhere((el) => el.id == item.id);
    }
  }

  @override
  Future<List<Home>> findAll() async {
    return _list;
  }

  @override
  Future<Optional<Home>> findById(int id) async {
    var result = _list.where((el) => el.id == id).first;
    return Optional.ofNullable(result);
  }



}
