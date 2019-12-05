
import 'package:prueba_flutter/legacy/observer/observer_action.dart';

class Observer {

  List<Function> actions;

  Observer() {
    this.actions = [];
  }

  void subscribe(Function suscriber) {
    this.actions.add(suscriber);
  }

  void notify(ObserverAction action) {
    actions.forEach((f) => f(action));
  }

}
