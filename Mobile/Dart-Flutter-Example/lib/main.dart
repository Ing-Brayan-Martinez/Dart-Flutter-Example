import 'package:dart_flutter_example/bloc/customer_bloc.dart';
import 'package:dart_flutter_example/bloc/home_bloc.dart';
import 'package:dart_flutter_example/bloc/invoice_bloc.dart';
import 'package:dart_flutter_example/factory/customer_factory.dart';
import 'package:dart_flutter_example/factory/home_factory.dart';
import 'package:dart_flutter_example/factory/invoice_factory.dart';
import 'package:dart_flutter_example/repository/customer_repository.dart';
import 'package:dart_flutter_example/repository/home_repository.dart';
import 'package:dart_flutter_example/repository/invoice_repository.dart';
import 'package:dart_flutter_example/screens/customer_create_screen.dart';
import 'package:dart_flutter_example/screens/customer_see_screen.dart';
import 'package:dart_flutter_example/screens/customer_update_screen.dart';
import 'package:dart_flutter_example/screens/data_screen.dart';
import 'package:dart_flutter_example/screens/home_screen.dart';
import 'package:dart_flutter_example/screens/invoice_create_screen.dart';
import 'package:dart_flutter_example/shared/provider/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';



/// Correr la aplicacion
void main() => runApp(ModularApp(module: MyAppModule()));

/// Modulo para la injeccion de dependencias
class MyAppModule extends MainModule {

  // Provide a list of dependencies to inject into your project
  @override
  List<Bind> get binds => [
    //home
    Bind((_) => HomeBloc()),
    Bind((_) => HomeMemoryRepository()),
    Bind((_) => HomeFactory()),
    //customer
    Bind((_) => CustomerBloc()),
    Bind((_) => CustomerMemoryRepository()),
    Bind((_) => CustomerFactory()),
    //invoice
    Bind((_) => InvoiceBloc()),
    Bind((_) => InvoiceMemoryRepository()),
    Bind((_) => InvoiceFactory()),
    //http
    Bind((_) => Http()),
  ];

  // Provide all the routes for your module
  @override
  List<Router> get routers => [
    Router(HomeScreen.routeName, child: (context, args) => new HomeScreen()),
    Router(DataScreen.routeName, child: (context, args) => new DataScreen()),
    Router(CreateInvoiceScreen.routeName, child: (context, args) => new CreateInvoiceScreen()),
    Router(CreateCustomerScreen.routeName, child: (context, args) => new CreateCustomerScreen()),
    Router(UpdateCustomerScreen.routeName, child: (context, args) => new UpdateCustomerScreen()),
    Router(SeeCustomerScreen.routeName, child: (context, args) => new SeeCustomerScreen()),
  ];

  // Provide the root widget associated with your module
  @override
  Widget get bootstrap => MyApp();

}

/// Widget inicaial
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        locale: new Locale("es"),
        theme: new ThemeData(primarySwatch: Colors.blue),
        initialRoute: HomeScreen.routeName,
        onGenerateRoute: Modular.generateRoute,
        navigatorKey: Modular.navigatorKey,
    );
  }
}
