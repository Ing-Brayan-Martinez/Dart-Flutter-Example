import 'package:dart_flutter_example/controllers/observer/observer.dart';
import 'package:dart_flutter_example/controllers/observer/observer_action.dart';
import 'package:dart_flutter_example/controllers/observer/observer_event.dart';
import 'package:dart_flutter_example/controllers/observer/observer_singlenton.dart';
import 'package:flutter/material.dart';

import '../reload_strategy.dart';

class ReloadCustomerFromSeeCustomerStrategy extends ReloadStrategy {
  late Observer? _observer;
  late BuildContext _context;

  ReloadCustomerFromSeeCustomerStrategy(BuildContext context) {
    _context = context;
    _observer = SinglentonObserver.get();
  }

  @override
  void reload() {
    _observer
        ?.notify(ObserverAction(ObserverEvent.EVENT_LOAD_LIST_CUSTOMER, 0));
    Navigator.of(_context).pop();
    Navigator.of(_context).pop();
  }
}
