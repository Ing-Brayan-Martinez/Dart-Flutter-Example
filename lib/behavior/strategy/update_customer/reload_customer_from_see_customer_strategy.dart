import 'package:flutter/material.dart';
import 'package:dart_flutter_example/behavior/observer/observer.dart';
import 'package:dart_flutter_example/behavior/observer/observer_action.dart';
import 'package:dart_flutter_example/behavior/observer/observer_event.dart';
import 'package:dart_flutter_example/behavior/observer/observer_singlenton.dart';
import 'package:dart_flutter_example/behavior/strategy/reload_strategy.dart';

class ReloadCustomerFromSeeCustomerStrategy extends ReloadStrategy {

  Observer _observer;
  BuildContext _context;

  ReloadCustomerFromSeeCustomerStrategy(BuildContext context) {
    _context = context;
    _observer = SinglentonObserver.get();
  }

  @override
  void reload() {
    _observer.notify(new ObserverAction(ObserverEvent.EVENT_LOAD_LIST_CUSTOMER, 0));
    Navigator.of(_context).pop();
    Navigator.of(_context).pop();
  }

}
