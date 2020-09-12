import 'package:dart_flutter_example/behavior/strategy/create_customer/reload_customer_from_data_strategy.dart';
import 'package:dart_flutter_example/behavior/strategy/reload_strategy.dart';
import 'package:dart_flutter_example/behavior/strategy/update_customer/reload_customer_from_see_customer_strategy.dart';
import 'package:flutter/material.dart';



class ReloadCustomerUpdate implements ReloadStrategy {

  static const String SEE_STRATEGY = "See";
  static const String DATA_STRATEGY = "Data";

  ReloadStrategy _strategy;
  BuildContext _context;


  ReloadCustomerUpdate(BuildContext context) {
    _context = context;
    _strategy = new ReloadCustomerFromSeeCustomerStrategy(_context);
  }

  void setReloadCustomerFromSeeCustomer() {
    _strategy = new ReloadCustomerFromSeeCustomerStrategy(_context);
  }

  void setReloadCustomerFromData() {
    _strategy = new ReloadCustomerFromDataStrategy(_context);
  }

  @override
  void reload() {
    _strategy.reload();
  }
}
