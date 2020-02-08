import 'package:flutter/material.dart';
import 'package:prueba_flutter/shared/strategy/update/reload_customer_from_data_strategy.dart';
import 'package:prueba_flutter/shared/strategy/update/reload_customer_from_see_customer_strategy.dart';
import 'package:prueba_flutter/shared/strategy/update/reload_customer_update_strategy.dart';


class ReloadCustomerUpdate implements ReloadCustomerUpdateStrategy {

  static const String SEE_STRATEGY = "See";
  static const String DATA_STRATEGY = "Data";

  ReloadCustomerUpdateStrategy _strategy;
  BuildContext _context;


  ReloadCustomerUpdate(BuildContext context) {
    _context = context;
    _strategy = new ReloadCustomerFromSeeCustomerStrategy(_context);
  }

  void setReloadCustomerFromSeeCustomer() {
    _strategy = new ReloadCustomerFromSeeCustomerStrategy(_context);
  }

  void setReloadCustomerFromData() {
    _strategy = new ReloadCustomerFromDataStrategy(_context) as ReloadCustomerUpdateStrategy;
  }

  @override
  void reloadCustomer() {
    _strategy.reloadCustomer();
  }
}