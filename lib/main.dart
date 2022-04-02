import 'package:dart_flutter_example/screens/data/data_screen.dart';
import 'package:dart_flutter_example/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

/// Correr la aplicación
void main() => runApp(const AppWidget());

/// Widget inicaial
class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

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
