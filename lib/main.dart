import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:prueba_flutter/dashboard/views/data_screen.dart';
import 'package:prueba_flutter/home/views/home_screen.dart';
import 'package:prueba_flutter/invoice/views/create_invoice_screen.dart';

import 'customer/views/create_customer_screen.dart';
import 'customer/views/see_customer_screen.dart';
import 'customer/views/update_customer_screen.dart';


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


