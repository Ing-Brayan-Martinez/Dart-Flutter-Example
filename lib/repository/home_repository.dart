import 'dart:convert';

import 'package:dart_flutter_example/domain/entity/home.dart';
import 'package:dart_flutter_example/shared/provider/http.dart';
import 'package:dio/dio.dart';
import 'package:optional/optional_internal.dart';

abstract class HomeRepository  {

  void add(Home entity);

  void update(Home entity);

  void delete(List<Home> entitys);

  Future<List<Home>> findAll();

  Future<Optional<Home>> findById(int id);

}

class HomeMemoryRepository implements HomeRepository {

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

class HomeHttpRepository extends Http implements HomeRepository {

  @override
  void add(Home entity) async {
    await getHttpManager()
        .post("/homes", data: entity.toJson(), options:
    new Options(contentType: "application/json"));
  }

  @override
  void update(Home entity) async {
    await getHttpManager()
        .put("/homes", data: entity.toJson(), options:
    new Options(contentType: "application/json"));
  }

  @override
  void delete(List<Home> entitys) async {
    Map<String, dynamic> body = new Map();
    body['homes'] = entitys.map((cli) => cli.toJson()).toList();

    await getHttpManager()
        .put("/homes/estatus", data: body, options:
    new Options(contentType: "application/json"));
  }

  @override
  Future<List<Home>> findAll() async {
    final Response res = await getHttpManager()
        .get("/homes");

    final List<Home> list = jsonDecode(res.data)
        .map((result) => new Home.fromJson(result))
        .toList();

    return list;
  }

  @override
  Future<Optional<Home>> findById(int id) async {
    final Response res = await getHttpManager()
        .get("/homes/${id}");

    final Home single = jsonDecode(res.data)
        .map((result) => new Home.fromJson(result))
        .single;

    return Optional.ofNullable(single);
  }


}
