import 'package:flutter/material.dart';
import 'package:prueba_flutter/dashboard/views/data_screen.dart';
import 'package:prueba_flutter/shared//strategy/create/reload_customer_create_strategy.dart';
import 'package:prueba_flutter/shared/observer/observer.dart';
import 'package:prueba_flutter/shared/observer/observer_action.dart';
import 'package:prueba_flutter/shared/observer/observer_event.dart';
import 'package:prueba_flutter/shared/observer/observer_singlenton.dart';

class ReloadCustomerFromHomeStrategy extends ReloadCustomerCreateStrategy {

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