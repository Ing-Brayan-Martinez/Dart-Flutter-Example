import 'observer_action.dart';

class Observer {
  late List<Function> actions;

  Observer() {
    actions = [];
  }

  void subscribe(Function suscriber) {
    actions.add(suscriber);
  }

  void notify(ObserverAction action) {
    for (var f in actions) {
      f(action);
    }
  }
}
