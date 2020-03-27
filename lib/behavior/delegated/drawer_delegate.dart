import 'package:flutter/material.dart';

abstract class DrawerDelegate {
  void navigateToHome(BuildContext context);

  void navigateToCustomer(BuildContext context);

  void navigateToInvoiced(BuildContext context);

  void navigateToSettings(BuildContext context);

  void navigateToAbout(BuildContext context);
}
