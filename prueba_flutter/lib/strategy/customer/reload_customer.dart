import 'package:flutter/material.dart';
import 'package:prueba_flutter/strategy/customer/reload_customer_from_data_strategy.dart';
import 'package:prueba_flutter/strategy/customer/reload_customer_from_home_strategy.dart';
import 'package:prueba_flutter/strategy/customer/reload_customer_strategy.dart';

class ReloadCustomer implements ReloadCustomerStrategy {

  static const String HOME_STRATEGY = "Home";
  static const String DATA_STRATEGY = "Data";

  ReloadCustomerStrategy _strategy;
  BuildContext _context;


  ReloadCustomer(BuildContext context) {
    _context = context;

    //Estrategia por defecto.
    _strategy = new ReloadCustomerFromHomeStrategy(_context);
  }

  void setReloadCustomerFromHome() {
    _strategy = new ReloadCustomerFromHomeStrategy(_context);
  }

  void setReloadCustomerFromData() {
    _strategy = new ReloadCustomerFromDataStrategy(_context);
  }

  @override
  void reloadCustomer() {
    _strategy.reloadCustomer();
  }
}