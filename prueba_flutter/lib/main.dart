import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistence_flutter/persistence_flutter.dart';

import 'package:prueba_flutter/domain/customer.dart';
import 'package:prueba_flutter/domain/home.dart';
import 'package:prueba_flutter/domain/invoice.dart';
import 'package:prueba_flutter/domain/invoice_item.dart';
import 'package:prueba_flutter/views/customer/create_customer_screen.dart';
import 'package:prueba_flutter/views/customer/see_customer_screen.dart';
import 'package:prueba_flutter/views/customer/update_customer_screen.dart';
import 'package:prueba_flutter/views/data/data_screen.dart';
import 'package:prueba_flutter/views/home/home_screen.dart';
import 'package:prueba_flutter/views/invoice/create_invoice_screen.dart';



/// Correr la aplicacion
///
void main(List<String> arg) {

  DatabaseManager().init((config) {
    config.databaseName = "sample6.db";
    config.databaseVersion = 1;
    config.databaseTables = [
      new Customer(),
      new Home(),
      new Invoice(),
      new InvoiceItem(),
    ];
  }).then((value) {
    if (value == true) {
      runApp(new MyApp());
    }
  });

}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: new ThemeData(primarySwatch: Colors.blue),
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          DataScreen.routeName: (context) => DataScreen(),
          CreateInvoiceScreen.routeName: (context) => CreateInvoiceScreen(),
          CreateCustomeScreen.routeName: (context) => CreateCustomeScreen(),
          UpdateCustomeScreen.routeName: (context) => UpdateCustomeScreen(),
          SeeCustomeScreen.routeName: (context) => SeeCustomeScreen(),
        }
    );
  }

}
