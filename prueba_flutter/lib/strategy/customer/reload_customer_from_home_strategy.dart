import 'package:flutter/material.dart';
import 'package:prueba_flutter/observer/observer.dart';
import 'package:prueba_flutter/observer/observer_action.dart';
import 'package:prueba_flutter/observer/observer_event.dart';
import 'package:prueba_flutter/observer/observer_singlenton.dart';
import 'package:prueba_flutter/strategy/customer/reload_customer_strategy.dart';
import 'package:prueba_flutter/views/data/data_screen.dart';

class ReloadCustomerFromHomeStrategy extends ReloadCustomerStrategy {

  Observer _observer;
  BuildContext _context;

  ReloadCustomerFromHomeStrategy(BuildContext context) {
    _context = context;
    _observer = SinglentonObserver.get();
  }

  @override
  void reloadCustomer() {
    //destruir la ventana anterior.
    Navigator.of(_context).pop();

    //crear la nueva ventana y pararase en el tab correspondiente
    Navigator.pushNamed(_context, DataScreen.routeName, arguments: 0);

    //recargar la lista de laotra ventana para ver el resultado
    _observer.notify(new ObserverAction(ObserverEvent.EVENT_LOAD_LIST_CUSTOMER, 0));
    print("He pasado por home strategy");

  }

}