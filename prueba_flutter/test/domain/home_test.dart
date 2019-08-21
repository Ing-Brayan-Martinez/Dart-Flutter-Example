
import 'package:flutter_test/flutter_test.dart';
import 'package:prueba_flutter/domain/home.dart';
import 'package:prueba_flutter/repository/home_repository.dart';

void main() {

  test('HomeTest', () {

    Home h1 = new Home();
    h1.setId(1);
    h1.setTitle("bike");
    h1.setSubTitle("Flutter.dev");
    h1.setImage("assets/image1.jpg");
    h1.save();

    Home h2 = new Home();
    h2.setId(2);
    h2.setTitle("boat");
    h2.setSubTitle("Flutter.dev");
    h2.setImage("assets/image2.jpg");
    h2.save();

    Home h3 = new Home();
    h3.setId(3);
    h3.setTitle("bike");
    h3.setSubTitle("Yahoo.com");
    h3.setImage("assets/image3.jpg");
    h3.save();

    Home h4 = new Home();
    h4.setId(4);
    h4.setTitle("car");
    h4.setSubTitle("Google.com");
    h4.setImage("assets/image4.jpg");
    h4.save();

    Home h5 = new Home();
    h5.setId(5);
    h5.setTitle("run");
    h5.setSubTitle("github.com");
    h5.setImage("assets/image5.jpg");
    h5.save();

    Home h6 = new Home();
    h6.setId(6);
    h6.setTitle("railway");
    h6.setSubTitle("github.com");
    h6.setImage("assets/image6.jpg");
    h6.save();

  });

  test("HomeRepositoryTest", () {
    final HomeRepository he = new HomeRepository();
    he.findAll().map((po) => po.toString()).forEach((str) => print(str));

    print("Ejecutando pruebas...");
  });
}