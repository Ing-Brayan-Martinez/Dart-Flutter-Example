import 'package:flutter/material.dart';
import 'package:prueba_flutter/behavior/observer/observer.dart';
import 'package:prueba_flutter/behavior/observer/observer_action.dart';
import 'package:prueba_flutter/behavior/observer/observer_event.dart';
import 'package:prueba_flutter/behavior/observer/observer_singlenton.dart';
import 'package:prueba_flutter/behavior/strategy/update_customer/reload_customer_update_strategy.dart';


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
