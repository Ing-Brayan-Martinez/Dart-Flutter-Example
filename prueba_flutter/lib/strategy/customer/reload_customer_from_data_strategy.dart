import 'package:flutter/material.dart';
import 'package:prueba_flutter/observer/observer.dart';
import 'package:prueba_flutter/observer/observer_action.dart';
import 'package:prueba_flutter/observer/observer_event.dart';
import 'package:prueba_flutter/observer/observer_singlenton.dart';
import 'package:prueba_flutter/strategy/customer/reload_customer_strategy.dart';

class ReloadCustomerFromDataStrategy extends ReloadCustomerStrategy {

  Observer _observer;
  BuildContext _context;

  ReloadCustomerFromDataStrategy(BuildContext context) {
    _context = context;
    _observer = SinglentonObserver.get();
  }

  @override
  void reloadCustomer() {
    _observer.notify(new ObserverAction(ObserverEvent.EVENT_LOAD_LIST_CUSTOMER, 0));

    Navigator.of(_context).pop();

    print("He pasado por data strategy");

  }

}