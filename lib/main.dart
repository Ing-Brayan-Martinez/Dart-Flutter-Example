import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'screens/create_customer_screen.dart';
import 'screens/create_invoice_screen.dart';
import 'screens/data_screen.dart';
import 'screens/home_screen.dart';
import 'screens/see_customer_screen.dart';
import 'screens/update_customer_screen.dart';


/// Correr la aplicacion
void main(List<String> arg) async {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        locale: new Locale("es"),
        theme: new ThemeData(primarySwatch: Colors.blue),
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (context) => new HomeScreen(),
          DataScreen.routeName: (context) => new DataScreen(),
          CreateInvoiceScreen.routeName: (context) => new CreateInvoiceScreen(),
          CreateCustomeScreen.routeName: (context) => new CreateCustomeScreen(),
          UpdateCustomerScreen.routeName: (context) => new UpdateCustomerScreen(),
          SeeCustomerScreen.routeName: (context) => new SeeCustomerScreen(),
        }
    );
  }

}


