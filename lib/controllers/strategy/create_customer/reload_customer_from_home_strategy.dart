import 'package:dart_flutter_example/controllers/observer/observer.dart';
import 'package:dart_flutter_example/controllers/observer/observer_action.dart';
import 'package:dart_flutter_example/controllers/observer/observer_event.dart';
import 'package:dart_flutter_example/controllers/observer/observer_singlenton.dart';
import 'package:dart_flutter_example/screens/data/data_screen.dart';
import 'package:flutter/material.dart';

import '../reload_strategy.dart';

class ReloadCustomerFromHomeStrategy extends ReloadStrategy {
  late Observer? _observer;
  late BuildContext _context;

  ReloadCustomerFromHomeStrategy(BuildContext context) {
    _context = context;
    _observer = SinglentonObserver.get();
  }

  @override
  void reload() {
    //destruir la ventana anterior.
    Navigator.of(_context).pop();

    //crear la nueva ventana y pararase en el tab correspondiente
    Navigator.pushNamed(_context, DataScreen.routeName, arguments: 0);

    //recargar la lista de laotra ventana para ver el resultado
    _observer
        ?.notify(ObserverAction(ObserverEvent.EVENT_LOAD_LIST_CUSTOMER, 0));
    print("He pasado por home strategy");
  }
}
