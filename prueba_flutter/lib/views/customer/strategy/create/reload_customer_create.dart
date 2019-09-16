import 'package:flutter/material.dart';
import 'package:prueba_flutter/views/customer/strategy/create/reload_customer_from_data_strategy.dart';
import 'package:prueba_flutter/views/customer/strategy/create/reload_customer_from_home_strategy.dart';
import 'package:prueba_flutter/views/customer/strategy/create/reload_customer_create_strategy.dart';

class ReloadCustomerCreate implements ReloadCustomerCreateStrategy {

  static const String HOME_STRATEGY = "Home";
  static const String DATA_STRATEGY = "Data";

  ReloadCustomerCreateStrategy _strategy;
  BuildContext _context;


  ReloadCustomerCreate(BuildContext context) {
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