import 'package:dart_flutter_example/screens/data/data_screen.dart';
import 'package:dart_flutter_example/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

/// Correr la aplicación
void main() => runApp(AppWidget());

/// Widget inicaial
class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale("es"),
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        DataScreen.routeName: (context) => const DataScreen()
      },
    );
  }
}
