import 'package:flutter/material.dart';
import 'package:prueba_flutter/behavior/delegated/drawer_delegate.dart';
import 'package:prueba_flutter/screens/data_screen.dart';

class HomeDrawerDelegate implements DrawerDelegate {
  @override
  void navigateToHome(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  void navigateToCustomer(BuildContext context) {
    Navigator.pushNamed(context, DataScreen.routeName, arguments: 0);
  }

  @override
  void navigateToInvoiced(BuildContext context) {
    Navigator.pushNamed(context, DataScreen.routeName, arguments: 1);
  }

  @override
  void navigateToSettings(BuildContext context) {}

  @override
  void navigateToAbout(BuildContext context) {}
}
