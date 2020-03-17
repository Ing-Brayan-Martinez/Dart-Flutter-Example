import 'package:flutter/material.dart';

abstract class Delegated {

  void onHome(BuildContext context);

  void onCustomer(BuildContext context);

  void onInvoiced(BuildContext context);

  void onSettings(BuildContext context);

  void onAbout(BuildContext context);

}