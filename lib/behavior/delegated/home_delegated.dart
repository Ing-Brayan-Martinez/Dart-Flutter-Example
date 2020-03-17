import 'package:flutter/material.dart';
import 'package:prueba_flutter/screens/data_screen.dart';

import 'delegated.dart';


class HomeDelegated implements Delegated {

  @override
  void onHome(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  void onCustomer(BuildContext context) {
    Navigator.pushNamed(context, DataScreen.routeName, arguments: 0);
  }

  @override
  void onInvoiced(BuildContext context) {
    Navigator.pushNamed(context, DataScreen.routeName, arguments: 1);
  }

  @override
  void onSettings(BuildContext context) {

  }

  @override
  void onAbout(BuildContext context) {

  }

}
