import 'package:flutter/material.dart';
import 'package:prueba_flutter/bloc/observer/observer.dart';
import 'package:prueba_flutter/bloc/observer/observer_action.dart';
import 'package:prueba_flutter/bloc/observer/observer_event.dart';
import 'package:prueba_flutter/bloc/observer/observer_singlenton.dart';
import 'package:prueba_flutter/views/customer/strategy/update/reload_customer_update_strategy.dart';
import 'package:prueba_flutter/views/data/data_screen.dart';

class ReloadCustomerFromSeeCustomerStrategy extends ReloadCustomerUpdateStrategy {

  Observer _observer;
  BuildContext _context;

  ReloadCustomerFromSeeCustomerStrategy(BuildContext context) {
    _context = context;
    _observer = SinglentonObserver.get();
  }

  @override
  void reloadCustomer() {
    _observer.notify(new ObserverAction(ObserverEvent.EVENT_LOAD_LIST_CUSTOMER, 0));
    Navigator.of(_context).pop();
    Navigator.of(_context).pop();
  }

}