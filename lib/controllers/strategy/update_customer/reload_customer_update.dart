import 'package:dart_flutter_example/controllers/strategy/create_customer/reload_customer_from_data_strategy.dart';
import 'package:dart_flutter_example/controllers/strategy/update_customer/reload_customer_from_see_customer_strategy.dart';
import 'package:flutter/material.dart';

import '../reload_strategy.dart';

class ReloadCustomerUpdate implements ReloadStrategy {
  static const String SEE_STRATEGY = "See";
  static const String DATA_STRATEGY = "Data";

  late ReloadStrategy _strategy;
  late BuildContext _context;

  ReloadCustomerUpdate(BuildContext context) {
    _context = context;
    _strategy =
        ReloadCustomerFromSeeCustomerStrategy(_context);
  }

  void setReloadCustomerFromSeeCustomer() {
    _strategy =
        ReloadCustomerFromSeeCustomerStrategy(_context);
  }

  void setReloadCustomerFromData() {
    _strategy = ReloadCustomerFromDataStrategy(_context);
  }

  @override
  void reload() {
    _strategy.reload();
  }
}
