import 'package:flutter/material.dart';
import 'package:prueba_flutter/legacy/observer/observer.dart';
import 'package:prueba_flutter/legacy/observer/observer_action.dart';
import 'package:prueba_flutter/legacy/observer/observer_event.dart';
import 'package:prueba_flutter/legacy/observer/observer_singlenton.dart';
import 'package:prueba_flutter/views/customer/strategy/update/reload_customer_update_strategy.dart';

class ReloadCustomerFromDataStrategy extends ReloadCustomerUpdateStrategy {

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
  }

}