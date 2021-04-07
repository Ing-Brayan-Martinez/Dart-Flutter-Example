import 'package:dart_flutter_example/screens/data/data_screen.dart';
import 'package:dart_flutter_example/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Correr la aplicación
void main() => runApp(AppWidget());

/// Widget inicaial
class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: new Locale("es"),
      theme: new ThemeData(primarySwatch: Colors.blue),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => new HomeScreen(),
        DataScreen.routeName: (context) => new DataScreen()
      },
    );
  }
}
