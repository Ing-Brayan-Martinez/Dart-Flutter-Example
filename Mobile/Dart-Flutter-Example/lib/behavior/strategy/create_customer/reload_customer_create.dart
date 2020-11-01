import 'package:flutter/material.dart';
import 'package:dart_flutter_example/behavior/strategy/create_customer/reload_customer_from_data_strategy.dart';
import 'package:dart_flutter_example/behavior/strategy/create_customer/reload_customer_from_home_strategy.dart';

import '../reload_strategy.dart';


class ReloadCustomerCreate {

  static const String HOME_STRATEGY = "Home";
  static const String DATA_STRATEGY = "Data";

  final BuildContext _context;

  ReloadCustomerCreate(this._context);

  ReloadStrategy setReloadCustomerFromHome() {
    return new ReloadCustomerFromHomeStrategy(_context);
  }

  ReloadStrategy setReloadCustomerFromData() {
    return new ReloadCustomerFromDataStrategy(_context);
  }

}
