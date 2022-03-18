import 'package:dart_flutter_example/controllers/observer/observer.dart';
import 'package:dart_flutter_example/controllers/observer/observer_action.dart';
import 'package:dart_flutter_example/controllers/observer/observer_event.dart';
import 'package:dart_flutter_example/controllers/observer/observer_singlenton.dart';
import 'package:flutter/material.dart';

import '../drawer_delegate.dart';

class DataDrawerDelegated implements DrawerDelegate {
  late Observer? _observer;

  DataDrawerDelegated() {
    _observer = SinglentonObserver.get();
  }

  @override
  void navigateToHome(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }

  @override
  void navigateToCustomer(BuildContext context) {
    _observer?.notify(ObserverAction(ObserverEvent.EVENT_TAB_CUSTOMER, 0));
    Navigator.of(context).pop();
  }

  @override
  void navigateToInvoiced(BuildContext context) {
    _observer?.notify(ObserverAction(ObserverEvent.EVENT_TAB_INVOICE, 1));
    Navigator.of(context).pop();
  }

  @override
  void navigateToSettings(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  void navigateToAbout(BuildContext context) {
    Navigator.of(context).pop();
  }
}
