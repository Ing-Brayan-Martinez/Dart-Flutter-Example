import 'dart:async';

import 'package:optional/optional.dart';
import 'package:persistence_flutter/persistence_flutter.dart';

import 'package:prueba_flutter/domain/home.dart';


class HomeRepository extends Repository<Home> {

  @override
  Stream<Home> findAll() {
    return getQueryManager()
        .createQueryBuilder(new Home())
        .create()
        .getResultStream((row) => new Home.fromJson(row));
  }

  @override
  Future<List<Home>> findAllList() {
//    return getQueryManager()
//        .createQueryBuilder(new Home())
//        .create()
//        .getResultList((row) => new Home.fromJson(row));

    List<Home> list = new List();

    Home h1 = new Home();
    h1.setId(1);
    h1.setTitle("bike");
    h1.setSubTitle("Flutter.dev");
    h1.setImage("assets/image1.jpg");
    list.add(h1);

    Home h2 = new Home();
    h2.setId(2);
    h2.setTitle("boat");
    h2.setSubTitle("Flutter.dev");
    h2.setImage("assets/image2.jpg");
    list.add(h2);

    Home h3 = new Home();
    h3.setId(3);
    h3.setTitle("bike");
    h3.setSubTitle("Yahoo.com");
    h3.setImage("assets/image3.jpg");
    list.add(h3);

    Home h4 = new Home();
    h4.setId(4);
    h4.setTitle("car");
    h4.setSubTitle("Google.com");
    h4.setImage("assets/image4.jpg");
    list.add(h4);

    Home h5 = new Home();
    h5.setId(5);
    h5.setTitle("run");
    h5.setSubTitle("github.com");
    h5.setImage("assets/image5.jpg");
    list.add(h5);

    Home h6 = new Home();
    h6.setId(6);
    h6.setTitle("railway");
    h6.setSubTitle("github.com");
    h6.setImage("assets/image6.jpg");
    list.add(h6);

    return Future.value(list);
  }

  @override
  Future<Optional<Home>> findById(int id) {
    return getQueryManager()
        .createQueryBuilder(new Home())
        .addEqualsFilter(id, Home.COLUMN_HOME_ID, FilterConst.NONE)
        .create()
        .getSingleResult((row) => new Home.fromJson(row));
  }

}

